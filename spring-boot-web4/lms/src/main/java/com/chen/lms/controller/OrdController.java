package com.chen.lms.controller;

import java.util.ArrayList;
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

import com.chen.lms.bean.Msg;
import com.chen.lms.bean.OrderG;
import com.chen.lms.service.OrderGService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

/**
 * 处理订单CRUD请求
 *
 * @author cw
 *
 */
@Controller
public class OrdController {

	@Autowired
	OrderGService orderGService;

	/**
	 * 单个批量二合一
	 * 批量删除：1-2-3
	 * 单个删除：1
	 *
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/orderG/{ordIds}",method=RequestMethod.DELETE)
	public Msg deleteorderG(@PathVariable("ordIds")String ordIds){
		//批量删除
		if(ordIds.contains("-")){
			List<String> del_ordIds = new ArrayList<>();
			String[] str_ordIds = ordIds.split("-");
			//组装id的集合
			for (String string : str_ordIds) {
				del_ordIds.add(string);
			}
			orderGService.deleteBatch(del_ordIds);
		}else{
			orderGService.deleteOrderG(ordIds);
		}
		return Msg.success();
	}
	//省份
	String Rr1(String s){
		String ss="";
		if (s.indexOf("黑龙")!=-1) {
			ss="000000";
		}else if (s.indexOf("山东")!=-1) {
			ss="0000001";
		}else if (s.indexOf("江苏")!=-1) {
			ss="000010";
		}else if (s.indexOf("上海")!=-1) {
			ss="000011";
		}else if (s.indexOf("浙江")!=-1) {
			ss="000100";
		}else if (s.indexOf("安徽")!=-1) {
			ss="000101";
		}else if (s.indexOf("福建")!=-1) {
			ss="000110";
		}else if (s.indexOf("江西")!=-1) {
			ss="000111";
		}else if (s.indexOf("广东")!=-1) {
			ss="001000";
		}else if (s.indexOf("广西")!=-1) {
			ss="001001";
		}else if (s.indexOf("海南")!=-1) {
			ss="001010";
		}else if (s.indexOf("河南")!=-1) {
			ss="001011";
		}else if (s.indexOf("湖南")!=-1) {
			ss="001100";
		}else if (s.indexOf("湖北")!=-1) {
			ss="001101";
		}else if (s.indexOf("北京")!=-1) {
			ss="001110";
		}else if (s.indexOf("河北")!=-1) {
			ss="001111";
		}else if (s.indexOf("山西")!=-1) {
			ss="010000";
		}else if (s.indexOf("内蒙古")!=-1) {
			ss="010001";
		}else if (s.indexOf("宁夏")!=-1) {
			ss="010010";
		}else if (s.indexOf("青海")!=-1) {
			ss="010011";
		}else if (s.indexOf("陕西")!=-1) {
			ss="010100";
		}else if (s.indexOf("甘肃")!=-1) {
			ss="010101";
		}else if (s.indexOf("新疆")!=-1) {
			ss="010110";
		}else if (s.indexOf("四川")!=-1) {
			ss="010111";
		}else if (s.indexOf("贵州")!=-1) {
			ss="011000";
		}else if (s.indexOf("云南")!=-1) {
			ss="011001";
		}else if (s.indexOf("重庆")!=-1) {
			ss="011010";
		}else if (s.indexOf("云南")!=-1) {
			ss="011011";
		}else if (s.indexOf("西藏")!=-1) {
			ss="011100";
		}else if (s.indexOf("天津")!=-1) {
			ss="011101";
		}else if (s.indexOf("辽宁")!=-1) {
			ss="011110";
		}else if (s.indexOf("吉林")!=-1) {
			ss="011111";
		}else if (s.indexOf("香港")!=-1) {
			ss="100000";
		}else if (s.indexOf("澳门")!=-1) {
			ss="110000";
		}else if (s.indexOf("台湾")!=-1) {
			ss="101000";
		}else{
			ss="111111";
		}
		return ss;
	}
	//创建ID
	String ordId(OrderG orderG){
		String a=(orderG.getDate()).replace('-', ' ');
		String da=a.replace(" ", "");
		String date=da.substring(2);
		//System.out.println(date);
		String rr= Rr1(orderG.getRaddress());
		String ordId =date+rr+(int)(Math.random()*10000+1234);
		//System.out.println(ordId);
		return ordId;
	}

	/**
	 * 订单更新方法
	 * @param route
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/orderG/{ordId}",method=RequestMethod.PUT)
	public Msg saveStorehouse(OrderG orderG,HttpServletRequest request){
		//System.out.println(route.getRouId());
//		System.out.println("将要更新的员工数据："+orderG);
//		System.out.println("请求体中的id值："+request.getParameter("ordId"));
//		System.out.println("请求体中的name值："+request.getParameter("date"));
		orderGService.updateOrderG(orderG);
		return Msg.success();
	}

	/**
	 * 根据ordId查询orderG
	 * @param rouId
	 * @return
	 */
	@RequestMapping(value="/orderG/{ordId}",method=RequestMethod.GET)
	@ResponseBody
	public Msg getOrderG(@PathVariable("ordId")String ordId){
//		System.out.println("sys"+ordId);
		OrderG orderG = orderGService.getOrderG(ordId);
		return Msg.success().add("emp", orderG);
	}

	/**
	 * 新订单保存
	 * 1、支持JSR303校验
	 * 2、导入Hibernate-Validator
	 * @return
	 */
	@RequestMapping(value="/orderG",method=RequestMethod.POST)
	@ResponseBody
	public Msg saveOrderG(OrderG orderG){
//		System.out.println(orderG.getDate());
//		System.out.println(orderG.getRaddress());
		String raddress=orderG.getRpovince()+orderG.getRcity()+orderG.getRaddress();
		String saddress=orderG.getSpovince()+orderG.getScity()+orderG.getSaddress();
//		System.out.println(raddress);
//		System.out.println(saddress);
//		System.out.println(storehouse.getNumber());
//		System.out.println(storehouse.getStState());
//		System.out.println(storehouse.getRemark());
		String ordId= ordId(orderG);
		orderG.setOrdId(ordId);
		orderG.setRaddress(raddress);
		orderG.setSaddress(saddress);
		orderGService.saveOrderG(orderG);
		return Msg.success();
	}

	/**
	 * 查询订单数据（分页查询）
	 *
	 * @return
	 */
	//发出的请求
	@RequestMapping("/OGlist")
	public String getOrderGs(
			//传入分页数据
			@RequestParam(value = "pn", defaultValue = "1") Integer pn,Model model) {
		// 这不是一个分页查询；
		// 引入PageHelper分页插件
		// 在查询之前只需要调用，传入页码，以及每页的大小
		PageHelper.startPage(pn, 5);
		// startPage后面紧跟的这个查询就是一个分页查询
		List<OrderG> orderGs = orderGService.getAll();
		// 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
		// 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
		PageInfo page = new PageInfo(orderGs, 7);
		model.addAttribute("pageInfo", page);
		//跳转页面
		return "list";
	}

	/**
	 * 导入jackson包。
	 * @param pn
	 * @return
	 */
	@RequestMapping("/orderGs")
	@ResponseBody
	public Msg getOrderGsWithJspn(@RequestParam(value = "pn", defaultValue = "1") Integer pn,
								  Model model){
		// 这不是一个分页查询；
		// 引入PageHelper分页插件
		// 在查询之前只需要调用，传入页码，以及每页的大小
		PageHelper.startPage(pn, 7);
		// startPage后面紧跟的这个查询就是一个分页查询
		List<OrderG> orderGs = orderGService.getAll();
		// 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
		// 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
		PageInfo page = new PageInfo(orderGs, 5);
//				model.addAttribute("pageInfo", page);
		return Msg.success().add("pageInfo", page);
	}
	/**
	 * 检查orId是否可用
	 * @param orId
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/checkuser4")
	public Msg checkuser(@RequestParam("orId")String orId){
		boolean b = orderGService.checkUser4(orId);
		if(b){
			return Msg.success();
		}else{
			return Msg.fail().add("va_msg", "orId不可用");
		}
	}

	/**
	 * 根据id查询订单信息
	 * @param pn
	 * @return
	 */
	@RequestMapping(value="/orderGs/{orid}",method=RequestMethod.GET)
	@ResponseBody
	public Msg getOrderGsWithJspn2(@PathVariable("orid")String ordid,Model model){
		// 这不是一个分页查询；
		// 引入PageHelper分页插件
		// 在查询之前只需要调用，传入页码，以及每页的大小
		int pn=1;
		PageHelper.startPage(pn, 7);
		// startPage后面紧跟的这个查询就是一个分页查询
		System.out.println("pn="+pn);
		System.out.println("ordid="+ordid);
		List<OrderG> orderGs =orderGService.getOrderG2(ordid);
		// 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
		// 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
		PageInfo page = new PageInfo(orderGs, 5);
//				model.addAttribute("pageInfo", page);
		return Msg.success().add("pageInfo", page);
	}

	/**
	 * 订单信息统计
	 * @param year
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/OrdCount")
	public Msg OrdNumber(){
		List<OrderG> list = orderGService.OrdNumber();
		return Msg.success().add("ords", list);
	}
	/**
	 * 订单信息统计
	 * @param month
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/OrdCount2")
	public Msg OrdNumber2(){
		List<OrderG> list = orderGService.OrdNumber2();
		return Msg.success().add("ords", list);
	}
}
