package com.chen.lms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chen.lms.bean.OrderG;
import com.chen.lms.bean.OrderGExample;
import com.chen.lms.bean.OrderGExample.Criteria;
import com.chen.lms.dao.OrderGMapper;


@Service
public class OrderGService {

	@Autowired
	OrderGMapper orderGMapper;
	//发货省份
	String srpr(int n){
		String s="";
		if (n==8) {
			s="黑龙江";
		}else if (n==14) {
			s="山东省";
		}else if (n==9) {
			s="江苏省";
		}else if (n==33) {
			s="上海市";
		}else if (n==10) {
			s="浙江省";
		}else if (n==12) {
			s="安徽省";
		}else if (n==3) {
			s="福建省";
		}else if (n==13) {
			s="江西省";
		}else if (n==1) {
			s="广东省";
		}else if (n==25) {
			s="广西壮族自治区";
		}else if (n==2) {
			s="海南省";
		}else if (n==15) {
			s="河南省";
		}else if (n==17) {
			s="湖南省";
		}else if (n==16) {
			s="湖北省";
		}else if (n==31) {
			s="北京市";
		}else if (n==11) {
			s="河北省";
		}else if (n==5) {
			s="山西省";
		}else if (n==24) {
			s="内蒙古自治区";
		}else if (n==27) {
			s="宁夏回族自治区";
		}else if (n==23) {
			s="青海省";
		}else if (n==21) {
			s="陕西省";
		}else if (n==22) {
			s="甘肃省";
		}else if (n==28) {
			s="新疆维吾尔自治区";
		}else if (n==18) {
			s="四川省";
		}else if (n==19) {
			s="贵州市";
		}else if (n==34) {
			s="重庆市";
		}else if (n==20) {
			s="云南省";
		}else if (n==26) {
			s="西藏自治区";
		}else if (n==32) {
			s="天津市";
		}else if (n==6) {
			s="辽宁省";
		}else if (n==7) {
			s="吉林省";
		}else if (n==29) {
			s="香港市";
		}else if (n==30) {
			s="澳门市";
		}else if (n==4) {
			s="台湾市";
		}else{
			s="";
		}
		return s;
	}
	//收货地址
	int sraddress(String s){
		int n=0;
		if (s.indexOf("黑龙")!=-1) {
			n=8;
		}else if (s.indexOf("山东")!=-1) {
			n=14;
		}else if (s.indexOf("江苏")!=-1) {
			n=9;
		}else if (s.indexOf("上海")!=-1) {
			n=33;
		}else if (s.indexOf("浙江")!=-1) {
			n=10;
		}else if (s.indexOf("安徽")!=-1) {
			n=12;
		}else if (s.indexOf("福建")!=-1) {
			n=3;
		}else if (s.indexOf("江西")!=-1) {
			n=13;
		}else if (s.indexOf("广东")!=-1) {
			n=1;
		}else if (s.indexOf("广西")!=-1) {
			n=25;
		}else if (s.indexOf("海南")!=-1) {
			n=2;
		}else if (s.indexOf("河南")!=-1) {
			n=15;
		}else if (s.indexOf("湖南")!=-1) {
			n=17;
		}else if (s.indexOf("湖北")!=-1) {
			n=16;
		}else if (s.indexOf("北京")!=-1) {
			n=31;
		}else if (s.indexOf("河北")!=-1) {
			n=11;
		}else if (s.indexOf("山西")!=-1) {
			n=5;
		}else if (s.indexOf("内蒙古")!=-1) {
			n=24;
		}else if (s.indexOf("宁夏")!=-1) {
			n=27;
		}else if (s.indexOf("青海")!=-1) {
			n=23;
		}else if (s.indexOf("陕西")!=-1) {
			n=21;
		}else if (s.indexOf("甘肃")!=-1) {
			n=22;
		}else if (s.indexOf("新疆")!=-1) {
			n=28;
		}else if (s.indexOf("四川")!=-1) {
			n=18;
		}else if (s.indexOf("贵州")!=-1) {
			n=19;
		}else if (s.indexOf("云南")!=-1) {
			n=20;
		}else if (s.indexOf("重庆")!=-1) {
			n=34;
		}else if (s.indexOf("云南")!=-1) {
			n=20;
		}else if (s.indexOf("西藏")!=-1) {
			n=26;
		}else if (s.indexOf("天津")!=-1) {
			n=32;
		}else if (s.indexOf("辽宁")!=-1) {
			n=6;
		}else if (s.indexOf("吉林")!=-1) {
			n=7;
		}else if (s.indexOf("香港")!=-1) {
			n=29;
		}else if (s.indexOf("澳门")!=-1) {
			n=30;
		}else if (s.indexOf("台湾")!=-1) {
			n=4;
		}else{
			n=0;
		}
		return n;
	}

	/**
	 * 查询订单数据（分页查询）
	 *
	 * @return
	 */
	public List<OrderG> getAll() {
		// TODO Auto-generated method stub
		return orderGMapper.selectByExampleWithBLOBs(null);
	}

	/**
	 * 新订单保存
	 * 1、支持JSR303校验
	 * 2、导入Hibernate-Validator
	 * @return
	 */
	public void saveOrderG(OrderG orderG) {
		// TODO Auto-generated method stub
		orderGMapper.insertSelective(orderG);
	}


	/**
	 * 根据ordId查询orderG
	 * @param rouId
	 * @return
	 */
	public OrderG getOrderG(String carId) {
		// TODO Auto-generated method stub
		OrderG orderG = orderGMapper.selectByPrimaryKey(carId);
		String rpr=orderG.getRaddress().substring(0, 2);
		//orderG.setRpovince(rpr);
		String spr=orderG.getSaddress().substring(0, 2);
		//System.out.println(orderG.getSaddress());
		int rpi=sraddress(rpr);
		int spi=sraddress(spr);
		orderG.setRpi(rpi);
		orderG.setSpi(spi);
		System.out.println(rpr+" "+rpi);
		System.out.println(spr+" "+spi);
		//orderG.setRpovince(spr);
		return orderG;
	}

	/**
	 * 订单更新方法
	 * @param route
	 * @return
	 */
	public void updateOrderG(OrderG orderG) {
		// TODO Auto-generated method stub
//		String rprovin=orderG.getRpovince();
//		String sprovin=orderG.getSpovince();
		int rapr=Integer.parseInt(orderG.getRpovince());
		int sapr=Integer.parseInt(orderG.getSpovince());
		String raddress=srpr(rapr)+orderG.getRaddress().substring(2);
		String saddress=srpr(sapr)+orderG.getSaddress().substring(3);
//		System.out.println("ors"+rapr);
//		System.out.println("ors"+sapr);
//		System.out.println("ors"+raddress);
//		System.out.println("ors"+saddress);
		orderG.setRaddress(raddress);
		orderG.setSaddress(saddress);
//		System.out.println(rprovin+sprovin);
//		System.out.println(rapr+sapr);
		orderGMapper.updateByPrimaryKeySelective(orderG);
	}

	/**
	 * 订单删除
	 * @param id
	 */
	public void deleteOrderG(String id) {
		// TODO Auto-generated method stub
		orderGMapper.deleteByPrimaryKey(id);
	}
	/**
	 * 订单删除
	 * @param ids
	 */
	public void deleteBatch(List<String> ids) {
		// TODO Auto-generated method stub
		OrderGExample  example = new OrderGExample();
		Criteria criteria = example.createCriteria();
		//delete from xxx where emp_id in(1,2,3)
		criteria.andOrdIdIn(ids);
		orderGMapper.deleteByExample(example);
	}
	/**
	 * 检验orId是否可用
	 * @param orId
	 * @return  true：代表当前orId可用   fasle：不可用
	 */
	public boolean checkUser4(String orId) {
		// TODO Auto-generated method stub
		OrderGExample example = new OrderGExample();
		Criteria criteria = example.createCriteria();
		criteria.andOrdIdEqualTo(orId);
		long count = orderGMapper.countByExample(example);
		return count == 1;
	}

	/**
	 * 根据id查询订单信息
	 * @param pn
	 * @return
	 */
	public List<OrderG> getOrderG2(String ordid) {
		// TODO Auto-generated method stub
		//OrderG orderG = orderGMapper.selectByPrimaryKey(ordid);
		OrderGExample example = new OrderGExample();
		Criteria criteria = example.createCriteria();
		criteria.andOrdIdEqualTo(ordid);
		return orderGMapper.selectByExampleWithBLOBs(example);
	}

	/**
	 * 订单信息统计
	 * @param year
	 * @return
	 */
	public List<OrderG> OrdNumber() {
		// TODO Auto-generated method stub
		return orderGMapper.selectByOCN();
	}
	/**
	 * 订单信息统计
	 * @param month
	 * @return
	 */
	public List<OrderG> OrdNumber2() {
		// TODO Auto-generated method stub
		return orderGMapper.selectByOCN2();
	}

}
