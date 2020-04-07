package com.chen.lms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chen.lms.bean.Province;
import com.chen.lms.dao.ProvinceMapper;
@Service
public class PrService {
	@Autowired
	ProvinceMapper provinceMapper;

	/**
	 * 返回所有的省份信息
	 */
	public List<Province> getPrs() {
		// TODO Auto-generated method stub
		return provinceMapper.selectByExample(null);
	}

}
