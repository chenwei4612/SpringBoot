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

import com.chen.lms.bean.Storehouse;
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
public class MapperTest4 {

	@Autowired
	StorehouseMapper storehouseMapper;


	@Autowired
	SqlSession sqlSession;

	public static String base = "abcdefghijklmnopqrstuvwxyz0123456789";
	private static String[] ty="大,中,小".split(",");
	private static String getTy() {
		int index=getNum(0,ty.length-1);
		String tt=ty[index];
		return tt;
	}
	private static String[] rm="无,易碎,急件,贵重,普通日用".split(",");
	private static String getRm() {
		int index=getNum(0,ty.length-1);
		String rr=rm[index];
		return rr;
	}
	public static int getNum(int start,int end) {
		return (int)(Math.random()*(end-start+1)+start);
	}
	//获取时间
	private static Date randomDate(String beginDate,String endDate){
		try {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			Date start = format.parse(beginDate);
			Date end = format.parse(endDate);

			if(start.getTime() >= end.getTime()){
				return null;
			}
			long date = random(start.getTime(),end.getTime());
			return new Date(date);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	private static long random(long begin,long end){
		long rtn = begin + (long)(Math.random() * (end - begin));
		if(rtn == begin || rtn == end){
			return random(begin,end);
		}
		return rtn;
	}
	/**
	 * 测试S
	 */
	@Test
	public void testCRUD(){
		StorehouseMapper mapper=sqlSession.getMapper(StorehouseMapper.class);
		System.out.println(storehouseMapper);
		for(int i = 0;i<10;i++){
			Date date =randomDate("2016-1-1", "2020-5-31");
			String type=getTy();
			String tt="";
			if(tt.equals("大")){
				tt="00";
			}else if(tt.equals("中")){
				tt="01";
			}else if(tt.equals("小")){
				tt="10";
			}
			int number=(int)(Math.random()*12345+12);
			String nn;
			if(number<500){
				nn="00";
			}else if(number<1000){
				nn="01";
			}else if(number<5000){
				nn="10";
			}else {
				nn="11";
			}
			String remark=getRm();
			String da=new SimpleDateFormat("yyyy-MM-dd").format(date);
			String a=da.replace('-', ' ');
			String c=a.replace(" ", "");
			String storeId=c+tt+nn+(int)(Math.random()*1000+1234);
			int ss=i%2;
			//System.out.println(ss);
			//System.out.println(storeId+" "+da+" "+type);
			mapper.insertSelective(new Storehouse(null, type, number, 0, remark));
			System.out.println(i);
		}
		System.out.println("批量完成");

	}

}
