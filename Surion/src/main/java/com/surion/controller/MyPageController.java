package com.surion.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.AutoConfigureOrder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.surion.dto.Message;
import com.surion.repository.ChatRoomRepository;
import com.surion.entity.Member;
import com.surion.service.MemberService;

import lombok.extern.log4j.Log4j2;

import lombok.extern.log4j.Log4j2;


@Log4j2
@Controller
@RequestMapping("/mypage/*")
public class MyPageController {
	
	@Autowired
	MemberService memberService;
	
	
	@GetMapping("/myinfo")
	public String myinfo(Model model, HttpServletRequest request, HttpSession session) {
		String pagev = request.getParameter("pageview");
		if(pagev == null) {
			pagev = "1";
		}
		
		Member m = (Member)session.getAttribute("member");
		
		int pageview = Integer.parseInt(pagev);

		
		model.addAttribute("pageview", pageview);
		model.addAttribute("member", m);	
		return "/mypage/mypage";
	}
	
	


}
