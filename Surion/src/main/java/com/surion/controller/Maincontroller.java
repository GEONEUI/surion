package com.surion.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Controller
public class Maincontroller {
	@RequestMapping("/")
	public String index() {
		return "index";
	}
}
