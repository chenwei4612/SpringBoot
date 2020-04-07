package com.chen.lms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chen.lms.bean.Orst;
import com.chen.lms.bean.OrstExample;
import com.chen.lms.bean.OrstExample.Criteria;
import com.chen.lms.dao.OrstMapper;
@Service
public class OrstService {
	@Autowired
	OrstMapper orstMapper;

	/**
	 * 订单详细更新方法
	 * @param orst
	 * @return
	 */
	public void updateOrst(Orst orst) {
		// TODO Auto-generated method stub
		OrstExample example= new OrstExample();
		Criteria criteria = example.createCriteria();
		criteria.andOrIdEqualTo(orst.getOrId());
		orstMapper.updateByExampleSelective(orst, example);
	}

	/**
	 * 根据orId查询or
	 * @param orId
	 * @return
	 */
	public List<Orst> getOrst(String orId) {
		OrstExample example= new OrstExample();
		Criteria criteria = example.createCriteria();
		criteria.andOrIdEqualTo(orId);
		// TODO Auto-generated method stub
		List<Orst> orst =  orstMapper.selectByExample(example);
		return orst;
	}
	/**
	 * orst查询
	 * @return
	 */
	public List<Orst> getAll() {
		// TODO Auto-generated method stub
		return orstMapper.selectByExample(null);
	}

	/**
	 * orst保存
	 * 1、支持JSR303校验
	 * 2、导入Hibernate-Validator
	 * @return
	 */
	public void saveOrst(Orst orst) {
		// TODO Auto-generated method stub
		orstMapper.insert(orst);
	}

	/**
	 * orst删除
	 * @param id
	 */
	public void deleteOrst(String id) {
		// TODO Auto-generated method stub

		OrstExample example=new OrstExample();
		Criteria criteria = example.createCriteria();
		criteria.andOrIdEqualTo(id);
		orstMapper.deleteByExample(example);
	}
	/**
	 * orst删除
	 * @param ids
	 */
	public void deleteBatch(List<String> ids) {
		// TODO Auto-generated method stub
		OrstExample example=new OrstExample();
		Criteria criteria = example.createCriteria();
		//delete from xxx where emp_id in(1,2,3)
		criteria.andOrIdIn(ids);
		orstMapper.deleteByExample(example);
	}

	/**
	 * 根据id查询信息
	 * @param st
	 * @return
	 */
	public List<Orst> getAll2(int stid) {
		// TODO Auto-generated method stub
		OrstExample example=new OrstExample();
		Criteria criteria = example.createCriteria();
		//delete from xxx where emp_id in(1,2,3)
		criteria.andStIdEqualTo(stid);
		return orstMapper.selectByExample(example);
	}

	/**
	 * 根据id查询信息
	 * @param or
	 * @return
	 */
	public List<Orst> getAll3(String orId) {
		OrstExample example=new OrstExample();
		Criteria criteria = example.createCriteria();
		//delete from xxx where emp_id in(1,2,3)
		criteria.andOrIdEqualTo(orId);
		return orstMapper.selectByExample(example);
	}

	public List<Orst> getAll4(int carId) {
		OrstExample example=new OrstExample();
		Criteria criteria = example.createCriteria();
		criteria.andCarIdEqualTo(carId);
		return orstMapper.selectByExample(example);
	}

	/**
	 * 订单详情统计
	 * @param num
	 * @return
	 */
	public List<Orst> OrstCount() {
		// TODO Auto-generated method stub
		return orstMapper.SelectORCount();
	}

	public List<Orst> OrstCount2() {
		// TODO Auto-generated method stub
		return orstMapper.SelectORCount2();
	}



}
