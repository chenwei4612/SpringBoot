package com.chen.lms.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chen.lms.bean.Employee;
import com.chen.lms.bean.Msg;
import com.chen.lms.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

/**
 * 处理员工CRUD请求
 *
 * @author cw
 *
 */
@Controller
public class EmployeeController {

	@Autowired
	EmployeeService employeeService;

	/**
	 * 单个批量二合一
	 * 批量删除：1-2-3
	 * 单个删除：1
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/emp/{phones}",method=RequestMethod.DELETE)
	public Msg deleteEmp(@PathVariable("phones")String phones){
		//批量删除
		if(phones.contains("-")){
			List<String> del_phones = new ArrayList<>();
			String[] str_phones = phones.split("-");
			//组装phone的集合
			for (String string : str_phones) {
				del_phones.add(string);
			}
			employeeService.deleteBatch(del_phones);
		}else{
			String id = phones;
			employeeService.deleteEmp(id);
		}
		return Msg.success();
	}

	String Epid(String dp,String ro){
		Date date =new Date();
		String id = new SimpleDateFormat("yyyyMM").format(date)+dp+ro+(int)(Math.random()*123+12);
		return id;
	}
	/**
	 * 如果直接发送ajax=PUT形式的请求
	 * 封装的数据
	 * Employee
	 * [empId=1014, empName=null, gender=null, email=null, dId=null]
	 *
	 * 问题：
	 * 请求体中有数据；
	 * 但是Employee对象封装不上；
	 * update tbl_emp  where emp_id = 1014;
	 *
	 * 原因：
	 * Tomcat：
	 * 		1、将请求体中的数据，封装一个map。
	 * 		2、request.getParameter("empName")就会从这个map中取值。
	 * 		3、SpringMVC封装POJO对象的时候。
	 * 				会把POJO中每个属性的值，request.getParamter("email");
	 * AJAX发送PUT请求引发的血案：
	 * 		PUT请求，请求体中的数据，request.getParameter("empName")拿不到
	 * 		Tomcat一看是PUT不会封装请求体中的数据为map，只有POST形式的请求才封装请求体为map
	 * org.apache.catalina.connector.Request--parseParameters() (3111);
	 *
	 * protected String parseBodyMethods = "POST";
	 * if( !getConnector().isParseBodyMethod(getMethod()) ) {
	 success = true;
	 return;
	 }
	 *
	 *
	 * 解决方案；
	 * 我们要能支持直接发送PUT之类的请求还要封装请求体中的数据
	 * 1、配置上HttpPutFormContentFilter；
	 * 2、他的作用；将请求体中的数据解析包装成一个map。
	 * 3、request被重新包装，request.getParameter()被重写，就会从自己封装的map中取数据
	 * 员工更新方法
	 * @param employee
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/emp/{phone}",method=RequestMethod.PUT)
	public Msg saveEmp(Employee employee,HttpServletRequest request){
//		System.out.println("请求体中的值："+request.getParameter("gender"));
//		System.out.println("将要更新的员工数据："+employee);
//		System.out.println("请求体中的id值："+request.getParameter("empId"));
//		System.out.println("请求体中的name值："+request.getParameter("name"));
		String id=request.getParameter("empId");
		String depid=employee.getDepId()+"";
		String roleid=employee.getRole()+"";
		String empId;
		if(depid.equals(null+"")&&roleid.equals(null+"")){
			empId=id;
		}else {
			empId=depid+roleid+id.substring(2, id.length());
		}
		employee.setEmpId(empId);
		employeeService.updateEmp(employee);
		return Msg.success()	;
	}

	/**
	 * 员工密码更新方法
	 * @param employee
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/empup/{phone}",method=RequestMethod.PUT)
	public Msg saveEmp2(Employee employee,HttpServletRequest request){
		employeeService.updateEmp(employee);
		return Msg.success()	;
	}


	/**
	 * 根据phone查询员工
	 * @param phone
	 * @return
	 */
	@RequestMapping(value="/emp/{phone}",method=RequestMethod.GET)
	@ResponseBody
	public Msg getEmp(@PathVariable("phone")String phone){
//		System.out.println("sys"+phone);
		Employee employee = employeeService.getEmp(phone);
//		System.out.println(employee.getName());
		return Msg.success().add("emp", employee);
	}

	/**
	 * 检查phone是否可用
	 * @param phone
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/checkuser")
	public Msg checkuser(@RequestParam("phone")String phone){
		//先判断用户名是否是合法的表达式;
		String regx = "(^1([38][0-9]|4[579]|5[0-3,5-9]|6[6]|7[0135678]|9[89])\\d{8}$)";
		if(!phone.matches(regx)){
			return Msg.fail().add("va_msg", "请输入合法手机号");
		}
		//数据库用户名重复校验
		boolean b = employeeService.checkUser(phone);
		if(b){
			return Msg.success();
		}else{
			return Msg.fail().add("va_msg", "手机不可用");
		}
	}

	/**
	 * 检查id是否可用
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/checkuser2")
	public Msg checkuser2(@RequestParam("emId")String emId){
		//数据库用户名重复校验
		boolean b = employeeService.checkUser2(emId);
		if(b){
			return Msg.fail().add("va_msg", "员工id不可用");
		}else{
			return Msg.success();
		}
	}


	/**
	 * 员工保存
	 * 1、支持JSR303校验
	 * 2、导入Hibernate-Validator
	 *
	 *
	 * @return
	 */
	@RequestMapping(value="/emp",method=RequestMethod.POST)
	@ResponseBody
	public Msg saveEmp(@Valid Employee employee,BindingResult result){
		if(result.hasErrors()){
			//校验失败，应该返回失败，在模态框中显示校验失败的错误信息
			Map<String, Object> map = new HashMap<>();
			List<FieldError> errors = result.getFieldErrors();
			for (FieldError fieldError : errors) {
				System.out.println("错误的字段名："+fieldError.getField());
				System.out.println("错误信息："+fieldError.getDefaultMessage());
				map.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			return Msg.fail().add("errorFields", map);
		}else{
			String depid=employee.getDepId()+"";
			String roleid=employee.getRole()+"";
			String empId=Epid(depid, roleid);
//			System.out.println(empId);
			employee.setEmpId(empId);
			employeeService.saveEmp(employee);
			return Msg.success();
		}

	}


	/**
	 * 查询员工数据（分页查询）
	 *
	 * @return
	 */
	//发出的请求
	@RequestMapping("/list")
	public String getEmps(
			//传入分页数据
			@RequestParam(value = "pn", defaultValue = "1") Integer pn,
			Model model) {
		// 这不是一个分页查询；
		// 引入PageHelper分页插件
		// 在查询之前只需要调用，传入页码，以及每页的大小
		PageHelper.startPage(pn, 10);
		// startPage后面紧跟的这个查询就是一个分页查询
		List<Employee> emps = employeeService.getAll();
		// 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
		// 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
		PageInfo page = new PageInfo(emps, 5);
		model.addAttribute("pageInfo", page);

		return "list";
		//跳转页面
//		return "employee";
	}
	/**
	 * login
	 */
	@RequestMapping(value="/login",method=RequestMethod.POST)
	@ResponseBody
	public long getEmpLogin(Employee employee,Model model){
		long b =employeeService.loginByUserNameAndPassword(employee);
		return b;
	}

	/**
	 * 导入jackson包。
	 * @param pn
	 * @return
	 */
	@RequestMapping("/emps")
	@ResponseBody
	public Msg getEmpsWithJspn(@RequestParam(value = "pn", defaultValue = "1") Integer pn,Model model){
		// 这不是一个分页查询；
		// 引入PageHelper分页插件
		// 在查询之前只需要调用，传入页码，以及每页的大小
		PageHelper.startPage(pn, 8);
		// startPage后面紧跟的这个查询就是一个分页查询
		List<Employee> emps = employeeService.getAll();
		// 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
		// 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
		PageInfo page = new PageInfo(emps, 5);
		//	model.addAttribute("pageInfo", page);
		return Msg.success().add("pageInfo", page);
	}
	/**
	 * 根据emp_id查询员工信息
	 * @param pn
	 * @return
	 */
	@RequestMapping("/empsEP/{empId}")
	@ResponseBody
	public Msg getEmpsWithJspn2(@PathVariable("empId")String empId,@RequestParam(value = "pn", defaultValue = "1") Integer pn,
								Model model){
		// 这不是一个分页查询；
		// 引入PageHelper分页插件
		// 在查询之前只需要调用，传入页码，以及每页的大小
		PageHelper.startPage(pn, 8);
		// startPage后面紧跟的这个查询就是一个分页查询
		System.out.println(empId);
		List<Employee> emps = employeeService.getAll2(empId);
		// 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
		// 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
		PageInfo page = new PageInfo(emps, 5);
//		model.addAttribute("pageInfo", page);
		return Msg.success().add("pageInfo", page);
	}
	/**
	 * 员工信息统计
	 * @param phone
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/EmSexCount")
	public Msg DepNumber(){
		//数据库用户名重复校验
		List<Employee> list = employeeService.SexNumber();
		return Msg.success().add("emps", list);
	}

	/**
	 * 员工信息统计
	 * @param role
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/EmRoleCount")
	public Msg RolepNumber(){
		//数据库用户名重复校验
		List<Employee> list = employeeService.RoleNumber();
		return Msg.success().add("emps", list);
	}

	/**
	 * 检查phone是否可用存在
	 * @param phone
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/checkuserPhone")
	public Msg checkuserPhone(@RequestParam("phone")String phone){
		//先判断用户名是否是合法的表达式;
		String regx = "(^1([38][0-9]|4[579]|5[0-3,5-9]|6[6]|7[0135678]|9[89])\\d{8}$)";
		if(!phone.matches(regx)){
			return Msg.fail().add("va_msg", "请输入合法手机号");
		}
		//数据库用户名重复校验
		boolean b = employeeService.checkUser(phone);
		if(b){
//			System.out.println("1");
			return Msg.fail().add("va_msg", "手机不可用或不存在请重输！");
		}else{
//			System.out.println("0");
			return Msg.success();
		}
	}
}
