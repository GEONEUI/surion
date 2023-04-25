package com.surion.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.surion.entity.RepairForm;
import com.surion.entity.RepairListPaging;
import com.surion.service.RepairFormService;

@Controller
@RequestMapping("/repair/*")
public class RepairController {
	
	@Autowired
	RepairFormService repairFormService;
	
	// 의뢰 목록
	@RequestMapping("/repairList")
	public String repairList(Model model, RepairListPaging pa,HttpServletRequest request) {
		repairFormService.repairList(model, pa, request);
		return "/repair/repairList";
	}
	
	// 견적 요청
	@RequestMapping("/repairForm")
	public String repairForm() {
		return "/repair/repairForm";
	}
	
	// RepairList 상세 보기
	@RequestMapping("/repairDetail")
	public String repairDetail(Model model, RepairForm m) {
		repairFormService.repairDetail(model, m);
		repairFormService.readCount(m);
		return "/repair/repairDetail";
	}
	
	// RepairList 검색 
		@RequestMapping("/repairListSearch")
		public String repairListSearch(Model model, RepairListPaging pa, HttpServletRequest request) {
			repairFormService.search(model, pa, request);
			return "/repair/repairListSearch";
		}
	
	// 견적 폼 저장하는 Ajax
	@PostMapping("/uploadAjaxAction")
		public @ResponseBody void uploadAjaxPost(RepairForm m, HttpServletRequest request) {
		System.out.println(m);
		repairFormService.save(m);
	}
	
	// 견적 폼에서 파일 업로드
	@PostMapping("/upload")
	public String upload(HttpServletRequest request) {
		repairFormService.upload(request);
		return "redirect:/";
	}
	
	
	
	
}
