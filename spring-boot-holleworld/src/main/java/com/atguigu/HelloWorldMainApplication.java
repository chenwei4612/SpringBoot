package com.atguigu;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * @author ChenWei
 * @create 2020-03-23-17:20
 * @SpringBootApplication来标注一个主程序，说明是一个Springboot应用
 */
@SpringBootApplication
public class HelloWorldMainApplication {

    //Spring应用启动
    public static void main(String[] args) {
        SpringApplication.run(HelloWorldMainApplication.class, args);
    }
}
