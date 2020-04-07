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
import com.chen.lms.bean.Route;
import com.chen.lms.bean.Storehouse;
import com.chen.lms.service.StorehouseService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

/**
 * 处理仓库CRUD请求
 *
 * @author cw
 *
 */
@Controller
public class StorehouseController {

	@Autowired
	StorehouseService storehouseService;

	/**
	 * 单个批量二合一
	 * 批量删除：1-2-3
	 * 单个删除：1
	 *
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/storehouse/{storeIds}",method=RequestMethod.DELETE)
	public Msg deletestorehouse(@PathVariable("storeIds")String storeIds){
		//批量删除
		if(storeIds.contains("-")){
			List<Integer> del_storeIds = new ArrayList<>();
			String[] str_storeIds = storeIds.split("-");
			//组装id的集合
			for (String string : str_storeIds) {
				del_storeIds.add(Integer.parseInt(string));
			}
			storehouseService.deleteBatch(del_storeIds);
		}else{
			Integer id = Integer.parseInt(storeIds);
			storehouseService.deleteStorehouse(id);
		}
		return Msg.success();
	}

	/**
	 * 仓库更新方法
	 * @param route
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/storehouse/{storeId}",method=RequestMethod.PUT)
	public Msg saveStorehouse(Storehouse storehouse,HttpServletRequest request){
		//System.out.println(route.getRouId());
//		System.out.println("将要更新的员工数据："+storehouse);
//		System.out.println("请求体中的id值："+request.getParameter("storeId"));
//		System.out.println("请求体中的name值："+request.getParameter("date"));
		storehouseService.updateStorehouse(storehouse);
		return Msg.success();
	}

	/**
	 * 根据storeId查询store
	 * @param rouId
	 * @return
	 */
	@RequestMapping(value="/storehouse/{storeId}",method=RequestMethod.GET)
	@ResponseBody
	public Msg getStorehouse(@PathVariable("storeId")Integer storeId){
		System.out.println("sys"+storeId);
		Storehouse storehouse = storehouseService.getStorehouse(storeId);
		return Msg.success().add("emp", storehouse);
	}

	/**
	 * Storehouse保存
	 * 1、支持JSR303校验
	 * 2、导入Hibernate-Validator
	 *
	 * @return
	 */
	@RequestMapping(value="/storehouse",method=RequestMethod.POST)
	@ResponseBody
	public Msg saveStorehouse(Storehouse storehouse){
//		System.out.println(storehouse.getDate());
//		System.out.println(storehouse.getType());
//		System.out.println(storehouse.getNumber());
//		System.out.println(storehouse.getStState());
//		System.out.println(storehouse.getRemark());
//		String storeId= storeId(storehouse);
//		storehouse.setStoreId(storeId);
		storehouseService.saveStorehouse(storehouse);
		return Msg.success();
	}

	/**
	 * 返回所有的仓库类型信息
	 */
	@RequestMapping("/shtype")
	@ResponseBody
	public Msg getType(){
		//查出的所有部门信息
		List<Storehouse> list = storehouseService.getType();
		return Msg.success().add("storehouse", list);
	}

	/**
	 * 查询仓库数据（分页查询）
	 *
	 * @return
	 */
	//发出的请求
	@RequestMapping("/Shlist")
	public String getStorehouses(
			//传入分页数据
			@RequestParam(value = "pn", defaultValue = "1") Integer pn,Model model) {
		// 这不是一个分页查询；
		// 引入PageHelper分页插件
		// 在查询之前只需要调用，传入页码，以及每页的大小
		PageHelper.startPage(pn, 5);
		// startPage后面紧跟的这个查询就是一个分页查询
		List<Storehouse> storehouses = storehouseService.getAll();
		// 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
		// 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
		PageInfo page = new PageInfo(storehouses, 5);
		model.addAttribute("pageInfo", page);

		//跳转页面
		return "list";
	}

	/**
	 * 导入jackson包。
	 * @param pn
	 * @return
	 */
	@RequestMapping("/storehouses")
	@ResponseBody
	public Msg getStorehousesWithJspn(@RequestParam(value = "pn", defaultValue = "1") Integer pn,
									  Model model){
		// 这不是一个分页查询；
		// 引入PageHelper分页插件
		// 在查询之前只需要调用，传入页码，以及每页的大小
		PageHelper.startPage(pn, 7);
		// startPage后面紧跟的这个查询就是一个分页查询
		List<Storehouse> storehouses = storehouseService.getAll();
		// 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
		// 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
		PageInfo page = new PageInfo(storehouses, 5);
//				model.addAttribute("pageInfo", page);
		return Msg.success().add("pageInfo", page);
	}
	/**
	 * 检查仓库id是否可用
	 * @param phone
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/checkuser5")
	public Msg checkuser(@RequestParam("stId")Integer stId){

		//数据库用户名重复校验
		boolean b = storehouseService.checkUser5(stId);
		if(b){
			return Msg.success();
		}else{
			return Msg.fail().add("va_msg", "stId不可用");
		}
	}

	/**
	 * 根据仓库id查询仓库信息
	 * @param pn
	 * @return
	 */
	@RequestMapping("/storehousesID/{storeId}")
	@ResponseBody
	public Msg getStorehousesWithJspn2(@PathVariable("storeId")Integer storeId,@RequestParam(value = "pn", defaultValue = "1") Integer pn,
									   Model model){
		// 这不是一个分页查询；
		// 引入PageHelper分页插件
		// 在查询之前只需要调用，传入页码，以及每页的大小
		PageHelper.startPage(pn, 7);
		// startPage后面紧跟的这个查询就是一个分页查询
		List<Storehouse> storehouses = storehouseService.getAll2(storeId);
		// 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
		// 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
		PageInfo page = new PageInfo(storehouses, 5);
//				model.addAttribute("pageInfo", page);
		return Msg.success().add("pageInfo", page);
	}

	/**
	 * 仓库信息统计
	 * @param num
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/StCount")
	public Msg StCount(){
		//数据库用户名重复校验
		List<Storehouse> list = storehouseService.StCount();
		return Msg.success().add("sths", list);
	}
}
