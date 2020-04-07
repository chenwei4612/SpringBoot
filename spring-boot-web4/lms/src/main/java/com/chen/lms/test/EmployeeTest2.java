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
//import com.chen.lms.bean.Department;
//import com.chen.lms.bean.DepartmentExample;
//import com.chen.lms.bean.DepartmentExample.Criteria;
//import com.chen.lms.dao.DepartmentMapper;
//
//
//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(locations={"classpath:applicationContext.xml"})
//public class EmployeeTest2 {
//	
//	@Autowired
//	DepartmentMapper departmentMapper;
//	
//	@Autowired
//	SqlSession sqlSession;
//	@Test
//	public void testCRUD(){
//	
//		DepartmentMapper mapper = sqlSession.getMapper(DepartmentMapper.class);
//		DepartmentExample example = new DepartmentExample();
//		Criteria criteria = example.createCriteria();
////		//delete from xxx where emp_id in(1,2,3)
//		List<Department> emps = mapper.selectByCN();
//		System.out.println(emps.size());
//		for (int i = 0; i < emps.size(); i++) {
//			System.out.println(emps.get(i));
//			
//		}
//	}
//
//}
