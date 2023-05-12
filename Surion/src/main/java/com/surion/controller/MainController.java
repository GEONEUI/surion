package com.surion.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.surion.entity.Popular;
import com.surion.service.MainService;


@Controller
public class MainController {
	@Autowired
	MainService mainService;
	
	@RequestMapping("/")
	public String index(Popular popular, Model model) {
		mainService.findPopular(popular, model);
		return "index";
	}
	
	
}
