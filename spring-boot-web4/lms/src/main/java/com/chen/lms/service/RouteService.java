package com.chen.lms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chen.lms.bean.Route;
import com.chen.lms.bean.RouteExample;
import com.chen.lms.bean.RouteExample.Criteria;
import com.chen.lms.dao.RouteMapper;

@Service
public class RouteService {

	@Autowired
	RouteMapper routeMapper;

	/**
	 * 查询所有线路
	 * @return
	 */
	public List<Route> getAll() {
		// TODO Auto-generated method stub
		return routeMapper.selectByExampleWithBLOBs(null);
	}



	/**
	 * 线路保存
	 * 1、支持JSR303校验
	 * 2、导入Hibernate-Validator
	 * @return
	 */
	public void saveRoute(Route route) {
		// TODO Auto-generated method stub
		routeMapper.insertSelective(route);
	}


	/**
	 * 按照员工rouId查询线路
	 * @param rouId
	 * @return
	 */
	public Route getRoute(Integer rouId) {
		// TODO Auto-generated method stub
		Route route = routeMapper.selectByPrimaryKey(rouId);
		return route;
	}

	/**
	 * 线路更新
	 * @param Route
	 */
	public void updateRoute(Route route) {
		// TODO Auto-generated method stub
		routeMapper.updateByPrimaryKeySelective(route);
	}

	/**
	 * 线路删除
	 * @param id
	 */
	public void deleteRoute(Integer id) {
		// TODO Auto-generated method stub
		routeMapper.deleteByPrimaryKey(id);
	}
	/**
	 * 线路删除
	 * @param ids
	 */
	public void deleteBatch(List<Integer> ids) {
		// TODO Auto-generated method stub
		RouteExample  example = new RouteExample();
		Criteria criteria = example.createCriteria();
		//delete from xxx where emp_id in(1,2,3)
		criteria.andRouIdIn(ids);
		routeMapper.deleteByExample(example);
	}
	public List<Route> getRoutes() {
		// TODO Auto-generated method stub
		List<Route> list =routeMapper.selectByExample(null);
		return list;
	}

	/**
	 * 根据线路id查询线路
	 * @param 线路
	 * @return
	 */
	public List<Route> getAll2(Integer rouId) {
		// TODO Auto-generated method stub
		RouteExample  example = new RouteExample();
		Criteria criteria = example.createCriteria();
		//delete from xxx where emp_id in(1,2,3)
		criteria.andRouIdEqualTo(rouId);
		return routeMapper.selectByExampleWithBLOBs(example);
	}

}
