package com.chen.lms.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chen.lms.bean.Msg;
import com.chen.lms.bean.Position;
import com.chen.lms.service.PositionService;

/**
 * 处理和职位有关的请求
 * @author cw
 *
 */
@Controller
public class PositionController {
	@Autowired
	private PositionService positionService;
	/**
	 * 返回所有的职位信息
	 */
	@RequestMapping("/roles")
	@ResponseBody
	public Msg getRolets(){
		//查出的所有职位信息
		List<Position> list = positionService.getRoles();
		return Msg.success().add("roles", list);
	}

}
