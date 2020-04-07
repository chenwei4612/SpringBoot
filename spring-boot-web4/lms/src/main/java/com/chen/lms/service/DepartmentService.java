package com.chen.lms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chen.lms.bean.Department;
import com.chen.lms.dao.DepartmentMapper;

@Service
public class DepartmentService {

	@Autowired
	private DepartmentMapper departmentMapper;
	/**
	 * 查询所有部门信息
	 * @param 线路
	 */
	public List<Department> getDepts() {
		// TODO Auto-generated method stub
		List<Department> list =departmentMapper.selectByExample(null);
		return list;
	}
	/**
	 * 部门信息统计
	 * @param 人数
	 */
	public List<Department> getDeptNs() {
		// TODO Auto-generated method stub
		List<Department> list =departmentMapper.selectByCN();
		return list;
	}

}
