package com.surion.controller;


import java.util.ArrayList;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.AutoConfigureOrder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.surion.repository.ChatRoomRepository;
import com.surion.repository.RepairFormRepository;
import com.surion.domain.chat.Message;
import com.surion.entity.Member;
import com.surion.entity.RepairForm;
import com.surion.service.MemberService;
import com.surion.service.MypageService;
import com.surion.service.MypageServiceImpl;

import lombok.extern.log4j.Log4j2;

import lombok.extern.log4j.Log4j2;


@Log4j2
@Controller
@RequestMapping("/mypage/*")
public class MyPageController {
	
	@Autowired
	RepairFormRepository repairFormRepository;
	
	@Autowired
	MypageService mypageService;
	
	@GetMapping("/myinfo")
	public String myinfo(Model model, HttpServletRequest request, HttpSession session) {
		return mypageService.myinfo(model, request, session);

	}
	
	@GetMapping("/boardUpdate")
	public String boardUpdate(Model model, HttpServletRequest request) {
		mypageService.boardUpdate(model, request);
		return "/mypage/updateRepair";
	}
	
	@PostMapping("/boardUpdate")
	public String boardUpdated(Model model, HttpServletRequest request, RedirectAttributes rttr) {
		return mypageService.boardUpdated(model, request, rttr);		
	}
	
	@GetMapping("/boardDelete")
	public String boardDelete(RepairForm form) {
		return mypageService.boardDelete(form);
	}
	
	@PostMapping("/offerDelete")
	@ResponseBody
	public int offerDelete(Member member) {
		return mypageService.offerDelete(member);
		 
	}


}
