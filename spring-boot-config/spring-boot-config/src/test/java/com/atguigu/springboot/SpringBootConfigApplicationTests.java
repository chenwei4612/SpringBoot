package com.atguigu.springboot;

import com.atguigu.springboot.bean.Person;

import com.atguigu.springboot.service.HelloService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.junit4.SpringRunner;
/**
 * SpringBoot单元测试;
 *
 * 可以在测试期间很方便的类似编码一样进行自动注入等容器的功能
 *
 */
//@RunWith(SpringRunner.class)
@SpringBootTest
class SpringBootConfigApplicationTests {
    @Autowired
    Person person;
    
    @Autowired
    ApplicationContext ioc;
    
    @Test
    public void testHelloService(){
       Boolean b = ioc.containsBean("helloService");
        System.out.println("b = " + b);
    }

    @Test
    void contextLoads() {
        System.out.println(person);
    }

}
