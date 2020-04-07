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
import com.chen.lms.bean.Route;
import com.chen.lms.service.RouteService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

/**
 * 处理线路CRUD请求
 *
 * @author cw
 *
 */
@Controller
public class RouteController {

	@Autowired
	RouteService routeService;

	/**
	 * 单个批量二合一
	 * 批量删除：1-2-3
	 * 单个删除：1
	 *
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/route/{rouIds}",method=RequestMethod.DELETE)
	public Msg deleteEmp(@PathVariable("rouIds")String rouIds){
		//批量删除
		if(rouIds.contains("-")){
			List<Integer> del_rouIds = new ArrayList<>();
			String[] str_rouIds = rouIds.split("-");
			//组装id的集合
			for (String string : str_rouIds) {
				del_rouIds.add(Integer.parseInt(string));
			}
			routeService.deleteBatch(del_rouIds);
		}else{
			Integer id = Integer.parseInt(rouIds);
			routeService.deleteRoute(id);
		}
		return Msg.success();
	}

	/**
	 * 线路更新方法
	 * @param route
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/route/{rouId}",method=RequestMethod.PUT)
	public Msg updateRoute(Route route,HttpServletRequest request){
		//System.out.println(route.getRouId());
		System.out.println("将要更新的员工数据："+route);
		System.out.println("请求体中的id值："+request.getParameter("rouId"));
		System.out.println("请求体中的name值："+request.getParameter("area"));
		routeService.updateRoute(route);
		return Msg.success();
	}

	/**
	 * 根据rouId查询线路
	 * @param rouId
	 * @return
	 */
	@RequestMapping(value="/route/{rouId}",method=RequestMethod.GET)
	@ResponseBody
	public Msg getRoute(@PathVariable("rouId")Integer rouId){
		System.out.println("sys"+rouId);
		Route route = routeService.getRoute(rouId);
		return Msg.success().add("emp", route);
	}

	/**
	 * 线路保存
	 * 1、支持JSR303校验
	 * 2、导入Hibernate-Validator
	 * @return
	 */
	@RequestMapping(value="/route",method=RequestMethod.POST)
	@ResponseBody
	public Msg saveRoute(Route route){
//		System.out.println(route.getArea());
//		System.out.println(route.getDscope());
		routeService.saveRoute(route);
		return Msg.success();
	}

	/**
	 * 查询线路数据（分页查询）
	 *
	 * @return
	 */
	//发出的请求
	@RequestMapping("/Rlist")
	public String getRoutes(
			//传入分页数据
			@RequestParam(value = "pn", defaultValue = "1") Integer pn,Model model) {
		// 这不是一个分页查询；
		// 引入PageHelper分页插件
		// 在查询之前只需要调用，传入页码，以及每页的大小
		PageHelper.startPage(pn, 5);
		// startPage后面紧跟的这个查询就是一个分页查询
		List<Route> routes = routeService.getAll();
		// 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
		// 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
		PageInfo page = new PageInfo(routes, 5);
		model.addAttribute("pageInfo", page);

		//跳转页面
		return "list";
	}

	/**
	 * 导入jackson包。
	 * @param pn
	 * @return
	 */
	@RequestMapping("/routes")
	@ResponseBody
	public Msg getRoutesWithJspn(@RequestParam(value = "pn", defaultValue = "1") Integer pn,
								 Model model){
		// 这不是一个分页查询；
		// 引入PageHelper分页插件
		// 在查询之前只需要调用，传入页码，以及每页的大小
		PageHelper.startPage(pn, 5);
		// startPage后面紧跟的这个查询就是一个分页查询
		List<Route> routes = routeService.getAll();
		// 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
		// 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
		PageInfo page = new PageInfo(routes, 5);
//				model.addAttribute("pageInfo", page);
		return Msg.success().add("pageInfo", page);
	}
	/**
	 * 返回所有的route信息
	 */
	@RequestMapping("/Routes")
	@ResponseBody
	public Msg getRoutes(){
		//查出的所有部门信息
		List<Route> list = routeService.getRoutes();
		return Msg.success().add("routes", list);
	}
	/**
	 * 根据线路id查询线路
	 * @param 线路
	 * @return
	 */
	@RequestMapping("/routesID/{rouId}")
	@ResponseBody
	public Msg getRoutesWithJspn2(@PathVariable("rouId")Integer rouId,@RequestParam(value = "pn", defaultValue = "1") Integer pn,
								  Model model){
		// 这不是一个分页查询；
		// 引入PageHelper分页插件
		// 在查询之前只需要调用，传入页码，以及每页的大小
		PageHelper.startPage(pn, 5);
		// startPage后面紧跟的这个查询就是一个分页查询
		List<Route> routes = routeService.getAll2(rouId);
		// 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
		// 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
		PageInfo page = new PageInfo(routes, 5);
//				model.addAttribute("pageInfo", page);
		return Msg.success().add("pageInfo", page);
	}
}
