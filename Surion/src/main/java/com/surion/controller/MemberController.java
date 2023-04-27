  package com.surion.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.surion.entity.Member;
import com.surion.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	//로그인폼
	@GetMapping("/login")
	public String login() {
		return "/common/login";
	}
	
	//회원가입폼
	@GetMapping("/join")
	public String join() {
		return "/common/join";
	}
	
	//회원가입
	@PostMapping("/join")
	public String join(Member m, RedirectAttributes rttr) {
		return memberService.join(m, rttr);
	}
	
	//로그인
	@PostMapping("/login")
	public String login(Member m, HttpSession session, RedirectAttributes rttr) {
		return memberService.findOne(m, session, rttr);
	
	}
	
	//로그아웃
	@GetMapping("/logout")
	public String logout(Member m, HttpSession session, RedirectAttributes rttr) {
		memberService.logout(m, session, rttr);
		return "redirect:/";
	}
	
	//중복체크
	@GetMapping("/check")
	public @ResponseBody int check(Member m) {
		System.out.println(m.getId());
		int result = memberService.check(m);
		return result;
	}
	
	//프로필 업데이트
	@PostMapping("/updateProfile")
	public String updateProfile(HttpServletRequest request, HttpSession session, RedirectAttributes rttr) {
		return memberService.updateProfile(request, session, rttr);
	}
	
	
}
