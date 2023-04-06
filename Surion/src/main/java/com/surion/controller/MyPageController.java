package com.surion.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/mypage/*")
public class MyPageController {
	
	@RequestMapping("/myinfo")
	public String myinfo(Model model, HttpServletRequest request) {
		String pagev = request.getParameter("pageview");
		if(pagev == null) {
			pagev = "1";
		}
		
		int pageview = Integer.parseInt(pagev);
		
		model.addAttribute("pageview", pageview);
		return "/mypage/mypage";
	}
}
