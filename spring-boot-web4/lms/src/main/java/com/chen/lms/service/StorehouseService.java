package com.chen.lms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chen.lms.bean.OrderGExample;
import com.chen.lms.bean.Storehouse;
import com.chen.lms.bean.StorehouseExample;
import com.chen.lms.bean.StorehouseExample.Criteria;
import com.chen.lms.dao.StorehouseMapper;

@Service
public class StorehouseService {

	@Autowired
	StorehouseMapper storehouseMapper;

	/**
	 * 查询仓库数据（分页查询）
	 *
	 * @return
	 */
	public List<Storehouse> getAll() {
		// TODO Auto-generated method stub
		return storehouseMapper.selectByExampleWithBLOBs(null);
	}

	/**
	 * Storehouse保存
	 * 1、支持JSR303校验
	 * 2、导入Hibernate-Validator
	 *
	 * @return
	 */
	public void saveStorehouse(Storehouse storehouse) {
		// TODO Auto-generated method stub
		storehouseMapper.insertSelective(storehouse);
	}


	/**
	 * 根据storeId查询store
	 * @param rouId
	 * @return
	 */
	public Storehouse getStorehouse(int storeId) {
		// TODO Auto-generated method stub
		Storehouse storehouse = storehouseMapper.selectByPrimaryKey(storeId);
		return storehouse;
	}

	/**
	 * 仓库更新方法
	 * @param route
	 * @return
	 */
	public void updateStorehouse(Storehouse storehouse) {
		// TODO Auto-generated method stub
		storehouseMapper.updateByPrimaryKeySelective(storehouse);
	}

	/**
	 * 仓库删除
	 * @param id
	 */
	public void deleteStorehouse(int id) {
		// TODO Auto-generated method stub
		storehouseMapper.deleteByPrimaryKey(id);
	}
	/**
	 * 仓库删除
	 * @param ids
	 */
	public void deleteBatch(List<Integer> ids) {
		// TODO Auto-generated method stub
		StorehouseExample  example = new StorehouseExample();
		Criteria criteria = example.createCriteria();
		//delete from xxx where emp_id in(1,2,3)
		criteria.andStoreIdIn(ids);
		storehouseMapper.deleteByExample(example);
	}

	/**
	 * 返回所有的仓库类型信息
	 */
	public List<Storehouse> getType() {
		// TODO Auto-generated method stub
		List<Storehouse> list =storehouseMapper.selecttype(null);
		return list;
	}

	/**
	 * 检查仓库id是否可用
	 * @param phone
	 * @return
	 */
	public boolean checkUser5(Integer stId) {
		// TODO Auto-generated method stub
		StorehouseExample example = new StorehouseExample();
		Criteria criteria = example.createCriteria();
		criteria.andStoreIdEqualTo(stId);
		long count = storehouseMapper.countByExample(example);
		return count == 1;
	}

	/**
	 * 根据仓库id查询仓库信息
	 * @param pn
	 * @return
	 */
	public List<Storehouse> getAll2(Integer storeId) {
		// TODO Auto-generated method stub
		StorehouseExample example = new StorehouseExample();
		Criteria criteria = example.createCriteria();
		criteria.andStoreIdEqualTo(storeId);
		return storehouseMapper.selectByExampleWithBLOBs(example);
	}

	/**
	 * 仓库信息统计
	 * @param num
	 * @return
	 */
	public List<Storehouse> StCount() {
		// TODO Auto-generated method stub
		return storehouseMapper.selecttypeCount();
	}

}
