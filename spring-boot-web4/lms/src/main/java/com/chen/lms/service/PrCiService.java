package com.chen.lms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chen.lms.bean.PrCi;
import com.chen.lms.dao.PrCiMapper;
@Service
public class PrCiService {
	@Autowired
	PrCiMapper prCiMapper;

	/**
	 * �������е�ʡ����Ϣ
	 */
	public List<PrCi> getPrCis() {
		// TODO Auto-generated method stub
		return prCiMapper.selectByExampleWPC(null);
	}

}
