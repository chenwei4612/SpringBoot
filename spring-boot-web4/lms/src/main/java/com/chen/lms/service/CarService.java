package com.chen.lms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chen.lms.bean.Car;
import com.chen.lms.bean.CarExample;
import com.chen.lms.bean.CarExample.Criteria;
import com.chen.lms.dao.CarMapper;

@Service
public class CarService {

	@Autowired
	CarMapper carMapper;

	/**
	 * 查询所有车辆信息
	 * @return
	 */
	public List<Car> getAll() {
		// TODO Auto-generated method stub
		return carMapper.selectByExample(null);
	}



	/**
	 * 新car保存
	 * @param employee
	 */
	public void saveCar(Car car) {
		// TODO Auto-generated method stub
		carMapper.insertSelective(car);
	}


	/**
	 * 按照员工carId查询car
	 * @param carId
	 * @return
	 */
	public Car getCar(Integer carId) {
		// TODO Auto-generated method stub
		Car car = carMapper.selectByPrimaryKey(carId);
		return car;
	}

	/**
	 * 线路更新
	 * @param Route
	 */
	public void updateCar(Car car) {
		// TODO Auto-generated method stub
		carMapper.updateByPrimaryKeySelective(car);
	}

	/**
	 * 线路删除
	 * @param id
	 */
	public void deleteCar(Integer id) {
		// TODO Auto-generated method stub
		carMapper.deleteByPrimaryKey(id);
	}
	/**
	 * 线路删除
	 * @param ids
	 */
	public void deleteBatch(List<Integer> ids) {
		// TODO Auto-generated method stub
		CarExample  example = new CarExample();
		Criteria criteria = example.createCriteria();
		//delete from xxx where emp_id in(1,2,3)
		criteria.andCarIdIn(ids);
		carMapper.deleteByExample(example);
	}

	/**
	 * 根据车辆id查询车辆信息
	 * @param ids
	 */
	public List<Car> getAll2(Integer carId) {
		// TODO Auto-generated method stub
		CarExample  example = new CarExample();
		Criteria criteria = example.createCriteria();
		//delete from xxx where emp_id in(1,2,3)
		criteria.andCarIdEqualTo(carId);
		return carMapper.selectByExample(example);
	}

	/**
	 * 车辆信息统计
	 * @param 线路
	 */
	public List<Car> CarCount() {
		// TODO Auto-generated method stub
		return carMapper.selectByCCN();
	}

	/**
	 * 车辆信息统计
	 * @param 类型
	 */
	public List<Car> CarCount2() {
		// TODO Auto-generated method stub
		return carMapper.selectByCCN2();
	}

}
