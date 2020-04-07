package com.chen.lms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chen.lms.bean.City;
import com.chen.lms.dao.CityMapper;
@Service
public class CiService {
	@Autowired
	CityMapper cityMapper;
	/**
	 * 获取城市信息
	 * @param city
	 */
	public City getCis(Integer cityId) {
		// TODO Auto-generated method stub
		return cityMapper.selectByKey(cityId);
	}

}
