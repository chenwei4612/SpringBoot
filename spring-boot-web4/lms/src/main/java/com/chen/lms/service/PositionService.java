package com.chen.lms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chen.lms.bean.Position;
import com.chen.lms.dao.PositionMapper;
@Service
public class PositionService {

	/**
	 * 返回所有的职位信息
	 */
	@Autowired
	private PositionMapper positionMapper;
	public List<Position> getRoles() {
		// TODO Auto-generated method stub
		List<Position> list =positionMapper.selectByExample(null);
		return list;
	}

}
