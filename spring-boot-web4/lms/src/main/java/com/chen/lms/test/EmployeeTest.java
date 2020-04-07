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
//import com.chen.lms.bean.EmployeeExample;
//import com.chen.lms.bean.EmployeeExample.Criteria;
//import com.chen.lms.dao.DepartmentMapper;
//import com.chen.lms.dao.EmployeeMapper;
//
//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(locations={"classpath:applicationContext.xml"})
//public class EmployeeTest {
//	
//	@Autowired
//	DepartmentMapper departmentMapper;
//	
//	@Autowired
//	EmployeeMapper employeeMapper;
//	
//	@Autowired
//	SqlSession sqlSession;
//	@Test
//	public void testCRUD(){
//	
//		EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
////		List<Employee> emps = employeeService.getAll();
//		//List<Employee> emps =mapper.selectByExampleWithDept(null);
//		///List<Employee> emps =mapper.countDepNum(null);
//		//List<DepNumber> dep=emps;
//		//System.out.println(emps);
//		EmployeeExample example = new EmployeeExample();
//		Criteria criteria = example.createCriteria();
////		//delete from xxx where emp_id in(1,2,3)
//		criteria.andDepIdEqualTo("1");
////		long emps =mapper.countByExample(example);
//		List<Employee> emps=mapper.countSexNum(null);
////		System.out.println(emps);
//		System.out.println(emps.size());
//		for (int i = 0; i < emps.size(); i++) {
//			System.out.println(emps.get(i));
//			
//		}
//	}
//
//}
