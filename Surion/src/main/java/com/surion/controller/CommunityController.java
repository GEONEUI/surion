package com.surion.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.surion.community.CommService;
import com.surion.community.Community;

@Controller
@RequestMapping("/community/*")
public class CommunityController {
	
	@Autowired
	private CommService commService;
	
	@RequestMapping("/board")
	public String board() {
		
		return "/community/community";
	}
	
	//글작성
	@GetMapping("/write")
		public String writeForm() {
			return "community/write";
	}
	
	//글작성 동작
	@PostMapping("/writePro")
	public String writePro(Community community) {
		commService.register(community);
		return "community/community";
	}
	
	//글 하나 보기
	@GetMapping("/detail")
	public String detail() {
		return "community/detail";
	}
	
	//글 수정
	@GetMapping("/update")
	public String updateForm() {
		return "update";
	}
	
	//글 수정 동작
	@PostMapping("/updatePro")
	public String updatePro() {
		return "redirect:/community/community";
	}
	
	//글 삭제
	@GetMapping("/delete")
	public String delete() {
		return "community/community";
	}
}
