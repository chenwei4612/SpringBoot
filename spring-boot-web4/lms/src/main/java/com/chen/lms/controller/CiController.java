package com.chen.lms.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chen.lms.bean.City;
import com.chen.lms.bean.Msg;
import com.chen.lms.service.CiService;

/**
 * 处理城市CRUD请求
 *
 * @author cw
 *
 */
@Controller
public class CiController {

	@Autowired
	CiService ciService;

	/**
	 * 返回所有的城市信息
	 */
	@ResponseBody
	@RequestMapping(value="/Cis/{cityId}",method=RequestMethod.GET)
	public Msg getCis(@PathVariable("cityId")Integer cityId){
		//查出的所有城市信息
		City list = ciService.getCis(cityId);
		return Msg.success().add("ci", list);
	}
}
