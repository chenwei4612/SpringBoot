package com.chen.lms.bean;

import javax.validation.constraints.Pattern;

public class Employee {
    @Pattern(regexp="^1([38][0-9]|4[579]|5[0-3,5-9]|6[6]|7[0135678]|9[89])\\d{8}$",
            message="手机格式不正确")
    private String phone;

    @Pattern(regexp="(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})"
            ,message="用户名必须是2-5位中文或者6-16位英文和数字的组合")
    private String name;

    private Integer sex;

    //@Email
    @Pattern(regexp="^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$",
            message="邮箱格式不正确")
    private String email;

    private String password;

    private Integer role;

    private Integer depId;

    private String empId;

    private String address;

    private int num;

    //希望查询员工的同时部门信息也是查询好的
    private Department department;
    //希望查询员工的同时职位信息也是查询好的
    private Position position;

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public Integer getRole() {
        return role;
    }

    public void setRole(Integer role) {
        this.role = role;
    }

    public Integer getDepId() {
        return depId;
    }

    public void setDepId(Integer depId) {
        this.depId = depId;
    }

    public String getEmpId() {
        return empId;
    }

    public void setEmpId(String empId) {
        this.empId = empId == null ? null : empId.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public Position getPosition() {
        return position;
    }

    public void setPosition(Position position) {
        this.position = position;
    }

    public Employee() {
        super();
    }

    public Employee(String phone, String name, Integer sex, String email, String password, Integer role, Integer depId,
                    String empId, String address) {
        super();
        this.phone = phone;
        this.name = name;
        this.sex = sex;
        this.email = email;
        this.password = password;
        this.role = role;
        this.depId = depId;
        this.empId = empId;
        this.address = address;
    }

    @Override
    public String toString() {
        return "Employee [phone=" + phone + ", name=" + name + ", sex=" + sex + ", email=" + email + ", password="
                + password + ", role=" + role + ", depId=" + depId + ", empId=" + empId + ", address=" + address
                + ", num=" + num + ", department=" + department + ", position=" + position + "]";
    }

}