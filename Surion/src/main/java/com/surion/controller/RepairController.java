package com.surion.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/repair/*")
public class RepairController {
	@RequestMapping("/repairList")
	public String repairList() {
		return "/repair/repairList";
	}
	
	@RequestMapping("/orderList")
	public String orderList() {
		return "/repair/orderList";
	}
	
	@RequestMapping("/order")
	public String orderForm() {
		return "/repair/orderForm";
	}
	
}
