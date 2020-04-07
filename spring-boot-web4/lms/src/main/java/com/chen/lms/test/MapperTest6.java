package com.chen.lms.test;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.chen.lms.bean.Orst;
import com.chen.lms.bean.OrstExample;
import com.chen.lms.dao.OrstMapper;
import com.mysql.fabric.xmlrpc.base.Array;

/**
 * 测试dao层的工作
 * @author lfy
 *推荐Spring的项目就可以使用Spring的单元测试，可以自动注入我们需要的组件
 *1、导入SpringTest模块
 *2、@ContextConfiguration指定Spring配置文件的位置
 *3、直接autowired要使用的组件即可
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
public class MapperTest6 {

	@Autowired
	OrstMapper orsMapper;


	@Autowired
	SqlSession sqlSession;

	/**
	 * 测试S
	 */
	@Test
	public void testCRUD(){
		OrstMapper mapper=sqlSession.getMapper(OrstMapper.class);
		System.out.println(orsMapper);
		for(int i = 0;i<1065;i++){
			//int carId=(int)(Math.random()*10+1);
			//mapper.insertSelective(new Storehouse(storeId, type, number, da, remark));
			//int ct=i%4;
			int car[]={3,14,15,25,27,38,41,52,56,67,69,72,78,82};
			Orst record=new Orst();
//			record.setCarId(car[i%14]);
			record.setCarId(9);
			OrstExample example=new OrstExample();
//			List<Integer> a= new ArrayList<>();
//			a.add(1);
//			a.add(3);
//			a.add(4);
//			a.add(10);
//			example.createCriteria().andRoIdIn(a);
			example.createCriteria().andRoIdEqualTo(6);
			mapper.updateByExampleSelective(record, example);
			System.out.println(i);
		}
		System.out.println("批量完成");

	}

}
