//package com.chen.lms.test;
//
//import java.util.List;
//
//import org.apache.ibatis.session.SqlSession;
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//
//import com.chen.lms.bean.Employee;
//import com.chen.lms.bean.Route;
//import com.chen.lms.dao.DepartmentMapper;
//import com.chen.lms.dao.EmployeeMapper;
//import com.chen.lms.dao.RouteMapper;
//
//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(locations={"classpath:applicationContext.xml"})
//public class RouteTest {
//	
//	@Autowired
//	DepartmentMapper departmentMapper;
//	
//	@Autowired
//	EmployeeMapper employeeMapper;
//	@Autowired
//	RouteMapper routeMapper;
//	
//	@Autowired
//	SqlSession sqlSession;
//	@Test
//	public void testCRUD(){
//	
//		RouteMapper mapper = sqlSession.getMapper(RouteMapper.class);
////		List<Employee> emps = employeeService.getAll();
//		List<Route> emps =mapper.selectByExampleWithBLOBs(null);
////		System.out.println(emps.size());
//		for (int i = 0; i < emps.size(); i++) {
//			System.out.println(emps.get(i));
//			
//		}
//	}
//
//}
