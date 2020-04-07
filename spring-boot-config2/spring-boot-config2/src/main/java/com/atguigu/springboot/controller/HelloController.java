package com.atguigu.springboot.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author ChenWei
 * @create 2020-03-25-11:05
 */
@RestController
public class HelloController {

    @RequestMapping("hello")
    public String Hello(){
        return "Hello!";
    }
}
