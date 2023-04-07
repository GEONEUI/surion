package com.surion.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/repair/*")
public class RepairController {
	@RequestMapping("/repairList")
	public String repairList() {
		return "/repair/repairList";
	}
	
	@RequestMapping("/order")
	public String orderForm() {
		return "/repair/orderForm";
	}
}
