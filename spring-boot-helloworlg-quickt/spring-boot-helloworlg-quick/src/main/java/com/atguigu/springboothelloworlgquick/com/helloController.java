package com.atguigu.springboothelloworlgquick.com;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author ChenWei
 * @create 2020-03-24-12:53
 */
//这个类的所有方法返回的数据直接写给浏览器，（如果是对象转为json数据）
/*@ResponseBody
@Controller*/
@RestController
public class helloController {
    @RequestMapping("/hello")
    public String hello(){
        return "hello world quick!";
    }

    // RESTAPI的方式
}
