package com.surion.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.surion.entity.CommunCriteria;
import com.surion.entity.Community;
import com.surion.entity.CommunityReply;
import com.surion.repository.CommRepository;
import com.surion.service.CommService;


@Controller
@RequestMapping("/community/*")
public class CommunityController {
	
	@Autowired
	private CommService commService; 
	
	
	@RequestMapping("/board")
	public String board(Model model, CommunCriteria cri) {
		commService.board(model, cri);
		return "/community/community";
	}
	
	//글작성 폼
	@GetMapping("/write")
		public String writeForm() {
			return "/community/write";
	}
	
	//글작성 동작
	@PostMapping("/writePro")
	public String writePro(Community community, HttpServletRequest request, RedirectAttributes rttr) {
		return commService.register(request, rttr);
	}
	
	//글 하나 보기
	@GetMapping("/detail")
	public String detail(@Param("idx") int idx, Model model) {
		commService.getOneBoard(idx, model);
		return "/community/detail";
	}
	
	//글 수정 동작
	@PostMapping("/updatePro")
	public String updatePro() {
		return "redirect:/community/community";
	}
	
	//글 삭제
	@GetMapping("/delete")
	public String delete(@Param("idx") int idx) {
		commService.deleteBoard(idx);
		return "redirect:/community/board";
	}
	
	//댓글 보기
	@GetMapping("/findReply")
	public @ResponseBody List<CommunityReply> findReply(int idx) {
		return commService.findReply(idx);
	}
	
	//댓글 달기
	@GetMapping("/ReplySave")
	public @ResponseBody String ReplySave(CommunityReply communityReply) {
		System.out.println("파라미터 테스트 " + communityReply);
		commService.saveReply(communityReply);
		return "성공";
	}
	
	//댓글 지우기
	@GetMapping("/ReplyDelete")
	public @ResponseBody String ReplyDelete(CommunityReply communityReply) {
		commService.ReplyDelete(communityReply);
		return "성공";
	}
	
	//업데이트(view)
	@GetMapping("/update")
	public String update(int idx, Model model) {
		commService.update(idx,model);
		return "/community/update";
	}
	
	//업데이트(Method)
	@PostMapping("/update")
	public String update(HttpServletRequest request, RedirectAttributes rttr) {
		return commService.update(request, rttr);
	}
	
	
	
	
}
