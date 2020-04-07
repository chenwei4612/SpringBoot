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

import com.chen.lms.bean.Car;
import com.chen.lms.bean.Msg;
import com.chen.lms.bean.Orst;
import com.chen.lms.service.OrstService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

/**
 * 处理订单详细信息CRUD请求
 *
 * @author cw
 *
 */
@Controller
public class OrstController {

	@Autowired
	OrstService orstService;

	/**
	 * 单个批量二合一
	 * 批量删除：1-2-3
	 * 单个删除：1
	 *
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/orst/{orIds}",method=RequestMethod.DELETE)
	public Msg deleteOrst(@PathVariable("orIds")String orIds){
		//批量删除
		if(orIds.contains("-")){
			List<String> del_orIds = new ArrayList<>();
			String[] str_orIds = orIds.split("-");
			//组装id的集合
			for (String string : str_orIds) {
				del_orIds.add(string);
			}
			orstService.deleteBatch(del_orIds);
		}else{

			orstService.deleteOrst(orIds);
		}
		return Msg.success();
	}

	/**
	 * 订单详细更新方法
	 * @param orst
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/orst/{orId}",method=RequestMethod.PUT)
	public Msg saveOrst(Orst orst,HttpServletRequest request){
		//System.out.println(route.getRouId());
//		System.out.println("将要更新的员工数据："+orst);
//		System.out.println("请求体中的id值："+request.getParameter("orId"));
//		System.out.println("请求体中的name值："+request.getParameter("status"));
		orstService.updateOrst(orst);
		return Msg.success();
	}

	/**
	 * 根据orId查询or
	 * @param orId
	 * @return
	 */
	@RequestMapping(value="/orst/{orId}",method=RequestMethod.GET)
	@ResponseBody
	public Msg getOrst(@PathVariable("orId")String orId){
//		System.out.println("sys"+orId);
		List<Orst> ol = orstService.getOrst(orId);
//		System.out.println("ol"+ol.get(0));
//		System.out.println("ol"+ol.get(0).getOrId());
		Orst orst=new Orst();
		orst.setOrId(ol.get(0).getOrId());
		orst.setRoId(ol.get(0).getRoId());
		orst.setStatus(ol.get(0).getStatus());
		orst.setStId(ol.get(0).getStId());
		orst.setCarId(ol.get(0).getCarId());
		return Msg.success().add("emp", orst);
	}


	/**
	 * orst保存
	 * 1、支持JSR303校验
	 * 2、导入Hibernate-Validator
	 * @return
	 */
	@RequestMapping(value="/orst",method=RequestMethod.POST)
	@ResponseBody
	public Msg saveOrst(Orst orst){
//		System.out.println(orst.getStatus());
//		System.out.println(orst.getRoId());
		orstService.saveOrst(orst);
		return Msg.success();
	}


	/**
	 * 导入jackson包。
	 * @param pn
	 * @return
	 */
	@RequestMapping("/orsts")
	@ResponseBody
	public Msg getOrstsWithJspn(@RequestParam(value = "pn", defaultValue = "1") Integer pn,
								Model model){
		// 这不是一个分页查询；
		// 引入PageHelper分页插件
		// 在查询之前只需要调用，传入页码，以及每页的大小
		PageHelper.startPage(pn, 8);
		// startPage后面紧跟的这个查询就是一个分页查询
		List<Orst> orsts = orstService.getAll();
		// 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
		// 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
		PageInfo page = new PageInfo(orsts, 5);
//				model.addAttribute("pageInfo", page);
		return Msg.success().add("pageInfo", page);
	}

	/**
	 * 根据id查询信息
	 * @param st
	 * @return
	 */
	@RequestMapping("/orstsST/{stId}")
	@ResponseBody
	public Msg getOrstsWithJspn2(@PathVariable("stId")int stId,@RequestParam(value = "pn", defaultValue = "1") Integer pn,
								 Model model){
//		System.out.println(stId);
		// 这不是一个分页查询；
		// 引入PageHelper分页插件
		// 在查询之前只需要调用，传入页码，以及每页的大小
		PageHelper.startPage(pn, 8);
		// startPage后面紧跟的这个查询就是一个分页查询
		List<Orst> orsts = orstService.getAll2(stId);
		// 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
		// 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
		PageInfo page = new PageInfo(orsts, 5);
//				model.addAttribute("pageInfo", page);
		return Msg.success().add("pageInfo", page);
	}

	/**
	 * 根据id查询信息
	 * @param or
	 * @return
	 */
	@RequestMapping("/orstsOR/{orId}")
	@ResponseBody
	public Msg getOrstsWithJspn3(@PathVariable("orId")String orId,@RequestParam(value = "pn", defaultValue = "1") Integer pn,
								 Model model){
		System.out.println(orId);//
		// 这不是一个分页查询；
		// 引入PageHelper分页插件
		// 在查询之前只需要调用，传入页码，以及每页的大小
		PageHelper.startPage(pn, 8);
		// startPage后面紧跟的这个查询就是一个分页查询
		List<Orst> orsts = orstService.getAll3(orId);
		// 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
		// 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
		PageInfo page = new PageInfo(orsts, 5);
//				model.addAttribute("pageInfo", page);
		return Msg.success().add("pageInfo", page);
	}
	/**
	 * 根据id查询信息
	 * @param or
	 * @return
	 */
	@RequestMapping("/orstscar/{carId}")
	@ResponseBody
	public Msg getOrstsWithJspn4(@PathVariable("carId")int carId,@RequestParam(value = "pn", defaultValue = "1") Integer pn,
								 Model model){
		System.out.println(carId);//
		// 这不是一个分页查询；
		// 引入PageHelper分页插件
		// 在查询之前只需要调用，传入页码，以及每页的大小
		PageHelper.startPage(pn, 8);
		// startPage后面紧跟的这个查询就是一个分页查询
		List<Orst> orsts = orstService.getAll4(carId);
		// 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
		// 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
		PageInfo page = new PageInfo(orsts, 5);
//				model.addAttribute("pageInfo", page);
		return Msg.success().add("pageInfo", page);
	}
	/**
	 * 订单详情统计
	 * @param num
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/OrstCount")
	public Msg OrstCount(){
		List<Orst> list = orstService.OrstCount();
		return Msg.success().add("orsts", list);
	}
	/**
	 * 仓库库存详情统计
	 * @param num
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/OrstCount2")
	public Msg OrstCount2(){
		List<Orst> list = orstService.OrstCount2();
		return Msg.success().add("orsts", list);
	}
}
