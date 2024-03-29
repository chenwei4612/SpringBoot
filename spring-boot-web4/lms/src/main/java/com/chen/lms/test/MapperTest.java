//package com.chen.lms.test;
//
//import java.util.UUID;
//
//import org.apache.ibatis.session.SqlSession;
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//
//import com.chen.lms.bean.Employee;
//import com.chen.lms.dao.DepartmentMapper;
//import com.chen.lms.dao.EmployeeMapper;
//
///**
// * 测试dao层的工作
// * @author lfy
// *推荐Spring的项目就可以使用Spring的单元测试，可以自动注入我们需要的组件
// *1、导入SpringTest模块
// *2、@ContextConfiguration指定Spring配置文件的位置
// *3、直接autowired要使用的组件即可
// */
//
//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(locations={"classpath:applicationContext.xml"})
//public class MapperTest {
//
//	@Autowired
//	DepartmentMapper departmentMapper;
//
//	@Autowired
//	EmployeeMapper employeeMapper;
//
//	@Autowired
//	SqlSession sqlSession;
//	/**
//	 * 测试DepartmentMapper
//	 */
//	@Test
//	public void testCRUD(){
//	/*	//1、创建SpringIOC容器
////		ApplicationContext ioc = new ClassPathXmlApplicationContext("applicationContext.xml");
////		//2、从容器中获取mapper
////		DepartmentMapper bean = ioc.getBean(DepartmentMapper.class);*/
////		System.out.println(departmentMapper);
////
////		//1、插入几个部门
//////		departmentMapper.insertSelective(new Department(null, "开发部"));
//////		departmentMapper.insertSelective(new Department(null, "测试部"));
//
////		//2、生成员工数据，测试员工插入
//////		employeeMapper.insertSelective(new Employee(null, "Jerry", "M", "Jerry@atguigu.com", 1));
////
////		//3、批量插入多个员工；批量，使用可以执行批量操作的sqlSession。
////
//////		for(){
//////			employeeMapper.insertSelective(new Employee(null, , "M", "Jerry@atguigu.com", 1));
//////		}
//		String de[]={"1","2","3","4","5","6"};
//		String po[]={"0","1","2","3","4","5"};
//		String ph[]={"152","138","134","177","181","132"};
//		EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
//		for(int i = 0;i<10;i++){
//			String uid = UUID.randomUUID().toString().substring(0,7);
//			String phone=ph[i%5]+(int)(Math.random()*100000000+1234567011);
//			String empId= de[i%5]+po[i%5]+(int)(Math.random()*100+1);
//			String email=uid+"@atguigu.com";
//			int sex=i%2;
//			int role=i%5;
//			String depId=de[i%5];
//			String password="00000000";
//			String address="广东海洋大学寸金学院";
//			Employee e=new Employee(phone, uid, sex, email, password, role, depId, empId, address);
////			mapper.insertSelective(new Employee(phone, uid, sex, email, password, role, depId, empId, address));
////			System.out.println(e.toString());
//			mapper.insertSelective(e);
//			System.out.println(i);
//		}
////		new Employee(phone, name, sex, email, password, role, depId, empId, address, department)
//		System.out.println("批量完成");
//	}
//	
//}
