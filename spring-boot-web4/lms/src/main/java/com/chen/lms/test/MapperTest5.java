package com.chen.lms.test;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.chen.lms.bean.Car;
import com.chen.lms.bean.Route;
import com.chen.lms.bean.Storehouse;
import com.chen.lms.dao.CarMapper;
import com.chen.lms.dao.RouteMapper;
import com.chen.lms.dao.StorehouseMapper;

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
public class MapperTest5 {

	@Autowired
	CarMapper carMapper;


	@Autowired
	SqlSession sqlSession;

	/**
	 * 测试S
	 */
	@Test
	public void testCRUD(){
		CarMapper mapper=sqlSession.getMapper(CarMapper.class);
		System.out.println(carMapper);
		String emid[]={"1010021","106631","108593","103259","105801","10136 ","107696 ","107256"
				,"12925","101801","102578","109678","10339","109904","109904","106909","104629","101613",
				"103147","101838","102448","10629","102608","104090","106415","105435","108740","105663",
				"102328","104949","109501","109784","109736","103536","102482","106879","101539","106812",
				"108467","107511","102235","105335","107293","101909","106567","108549","106306","106971",
				"101775","106805","106982","107067","10846","10923","101207","109369","108938","101639",
				"109320","108578","10903","101179","104529","104659","109624","103408","102359","109441",
				"108373","103496 ","109286","103758","104917","106432","103551","108946","104897","101207",
				"107435","107226","107341","103313","101958","109317","101265","655820"};
		System.out.println(emid.length);
		for(int i = 0;i<emid.length;i++){
			int roadId=(int)(Math.random()*10+1);
			//mapper.insertSelective(new Storehouse(storeId, type, number, da, remark));
			int ct=i%4;
			mapper.insertSelective(new Car(null, roadId, emid[i],ct));
			System.out.println(i);
		}
		System.out.println("批量完成");

	}

}
