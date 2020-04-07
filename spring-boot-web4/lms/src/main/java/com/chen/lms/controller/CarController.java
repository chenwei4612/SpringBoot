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
import com.chen.lms.service.CarService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

/**
 * 处理汽车CRUD请求
 *
 * @author cw
 *
 */
@Controller
public class CarController {

	@Autowired
	CarService carService;

	/**
	 * 单个批量二合一
	 * 批量删除：1-2-3
	 * 单个删除：1
	 *
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/car/{carIds}",method=RequestMethod.DELETE)
	public Msg deleteCar(@PathVariable("carIds")String carIds){
		//批量删除
		if(carIds.contains("-")){
			List<Integer> del_carIds = new ArrayList<>();
			String[] str_carIds = carIds.split("-");
			//组装id的集合
			for (String string : str_carIds) {
				del_carIds.add(Integer.parseInt(string));
			}
			carService.deleteBatch(del_carIds);
		}else{
			Integer id = Integer.parseInt(carIds);
			carService.deleteCar(id);
		}
		return Msg.success();
	}

	/**
	 * 线路更新方法
	 * @param route
	 * @return msg
	 */
	@ResponseBody
	@RequestMapping(value="/car/{carId}",method=RequestMethod.PUT)
	public Msg saveCar(Car car,HttpServletRequest request){
//		System.out.println("将要更新的员工数据："+car);
//		System.out.println("请求体中的id值："+request.getParameter("carId"));
//		System.out.println("请求体中的name值："+request.getParameter("roadId"));
		carService.updateCar(car);
		return Msg.success();
	}

	/**
	 * 根据carId查询car
	 * @param carId
	 * @return
	 */
	@RequestMapping(value="/car/{carId}",method=RequestMethod.GET)
	@ResponseBody
	public Msg getCar(@PathVariable("carId")Integer carId){
		System.out.println("sys"+carId);
		Car car = carService.getCar(carId);
		return Msg.success().add("emp", car);
	}

	/**
	 * car保存
	 * 1、支持JSR303校验
	 * 2、导入Hibernate-Validator
	 * @return
	 */
	@RequestMapping(value="/car",method=RequestMethod.POST)
	@ResponseBody
	public Msg saveCar(Car car){
//		System.out.println(car.getEmId());
//		System.out.println(car.getRoadId());
		carService.saveCar(car);
		return Msg.success();
	}

	/**
	 * 查询线路数据（分页查询）
	 *
	 * @return
	 */
	//发出的请求
	@RequestMapping("/Clist")
	public String getCars(
			//传入分页数据
			@RequestParam(value = "pn", defaultValue = "1") Integer pn,
			Model model) {
		// 这不是一个分页查询；
		// 引入PageHelper分页插件
		// 在查询之前只需要调用，传入页码，以及每页的大小
		PageHelper.startPage(pn, 5);
		// startPage后面紧跟的这个查询就是一个分页查询
		List<Car> cars = carService.getAll();
		// 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
		// 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
		PageInfo page = new PageInfo(cars, 5);
		model.addAttribute("pageInfo", page);

		//跳转页面
		return "list";
	}

	/**
	 * 导入jackson包。
	 * @param pn
	 * @return
	 */
	@RequestMapping("/cars")
	@ResponseBody
	public Msg getRoutesWithJspn(@RequestParam(value = "pn", defaultValue = "1") Integer pn,
								 Model model){
		// 这不是一个分页查询；
		// 引入PageHelper分页插件
		// 在查询之前只需要调用，传入页码，以及每页的大小
		PageHelper.startPage(pn, 8);
		// startPage后面紧跟的这个查询就是一个分页查询
		List<Car> cars = carService.getAll();
		// 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
		// 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
		PageInfo page = new PageInfo(cars, 5);
//				model.addAttribute("pageInfo", page);
		return Msg.success().add("pageInfo", page);
	}
	/**
	 * 根据carid查询car信息
	 * 导入jackson包。
	 * @param pn
	 * @return
	 */
	@RequestMapping("/carID/{carId}")
	@ResponseBody
	public Msg getRoutesWithJspn2(@PathVariable("carId")Integer carId,@RequestParam(value = "pn", defaultValue = "1") Integer pn,
								  Model model){
		// 这不是一个分页查询；
		// 引入PageHelper分页插件
		// 在查询之前只需要调用，传入页码，以及每页的大小
		PageHelper.startPage(pn, 8);
		// startPage后面紧跟的这个查询就是一个分页查询
		List<Car> cars = carService.getAll2(carId);
		// 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
		// 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
		PageInfo page = new PageInfo(cars, 5);
//				model.addAttribute("pageInfo", page);
		return Msg.success().add("pageInfo", page);
	}
	/**
	 * car统计
	 * @param 线路
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/CarCount")
	public Msg CarCount(){
		//数据库用户名重复校验
		List<Car> list = carService.CarCount();
		return Msg.success().add("cars", list);
	}
	/**
	 * car统计2
	 * @param 类型
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/CarCount2")
	public Msg CarCount2(){
		//数据库用户名重复校验
		List<Car> list = carService.CarCount2();
		return Msg.success().add("cars", list);
	}
}
