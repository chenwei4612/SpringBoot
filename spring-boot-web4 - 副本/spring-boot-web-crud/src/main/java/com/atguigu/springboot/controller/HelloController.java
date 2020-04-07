package com.atguigu.springboot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Arrays;
import java.util.Map;

/**
 * @author ChenWei
 * @create 2020-03-27-15:51
 */
@Controller
public class HelloController {
    @ResponseBody
    @RequestMapping("/hello")
    public String Hello(){
        return "Hello!";
    }

    //查出一些数据
    @RequestMapping("/success")
    public String Success(Map<String,Object> map){
        map.put("hello","您好");
        map.put("users", Arrays.asList("zhangsan","lisi","wangwu"));
        //classpath:/templates/success.html
        return "success";
    }
}
