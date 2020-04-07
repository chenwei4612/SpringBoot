package com.atguigu.springboot;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class})
//@SpringBootApplication
public class SpringBootWebCrudApplication {

    public static void main(String[] args) {
        SpringApplication.run(SpringBootWebCrudApplication.class, args);
    }

}
