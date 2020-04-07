package com.atguigu.springboot.bean;

/**
 * @author ChenWei
 * @create 2020-03-24-16:54
 * alt+enter->get/set
 */
public class Dog {
    private String name;
    private Integer age;

    public Integer getAge() {
        return age;
    }

    @Override
    public String toString() {
        return "Dog{" +
                "name='" + name + '\'' +
                ", age=" + age +
                '}';
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

}
