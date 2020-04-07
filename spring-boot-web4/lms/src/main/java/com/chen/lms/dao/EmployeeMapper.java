package com.chen.lms.dao;

import com.chen.lms.bean.Employee;
import com.chen.lms.bean.EmployeeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface EmployeeMapper {
    long countByExample(EmployeeExample example);
    //2
    long countByExample2(EmployeeExample example);
    List<Employee> countSexNum(EmployeeExample example);
    List<Employee> countRoleNum(Object object);

    int deleteByExample(EmployeeExample example);

    int deleteByPrimaryKey(String phone);

    int insert(Employee record);

    int insertSelective(Employee record);

    List<Employee> selectByExampleWithBLOBs(EmployeeExample example);
    //新增
    List<Employee> selectByExampleWithDept(EmployeeExample example);
    //登陆
    List<Employee> loginByUserNameAndPassword(Employee example);

    List<Employee> selectByExample(EmployeeExample example);

    Employee selectByPrimaryKey(String phone);

    int updateByExampleSelective(@Param("record") Employee record, @Param("example") EmployeeExample example);

    int updateByExampleWithBLOBs(@Param("record") Employee record, @Param("example") EmployeeExample example);

    int updateByExample(@Param("record") Employee record, @Param("example") EmployeeExample example);

    int updateByPrimaryKeySelective(Employee record);

    int updateByPrimaryKeyWithBLOBs(Employee record);

    int updateByPrimaryKey(Employee record);

}