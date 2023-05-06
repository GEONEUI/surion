package com.surion.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.surion.entity.RepairForm;
import com.surion.entity.RepairListPaging;
import com.surion.entity.RepairOffer;
import com.surion.service.RepairFormService;

@Controller
@RequestMapping("/repair/*")
public class RepairController {
	
	@Autowired
	RepairFormService repairFormService;
	
	// 의뢰 목록
	@RequestMapping("/repairList")
	public String repairList(Model model, RepairListPaging pa, HttpServletRequest request) {
		repairFormService.repairList(model, pa, request);
		return "/repair/repairList";
	}
	
	@GetMapping("/repairAjax")
	public @ResponseBody int repairList(@Param("pageNum")int pageNum){
		System.out.println(pageNum);
		return pageNum;
	}
	
	
	// 견적 요청
	@RequestMapping("/repairForm")
	public String repairForm() {
		return "/repair/repairForm";
	}
	
	// RepairList 상세 보기
	@RequestMapping("/repairDetail")
	public String repairDetail(Model model, @Param("idx") int idx) {
		RepairForm m = new RepairForm();
		m.setIdx(idx);
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
		repairFormService.save(m);
	}
	
	// 견적 폼에서 파일 업로드
	@PostMapping("/upload")
	public String upload(HttpServletRequest request) {
		repairFormService.upload(request);
		return "redirect:/";
	}
	
	// Mechanic이 의뢰목록에서 견적 제안
	@RequestMapping("/offer")
	public String offer(RepairOffer offer) {
		repairFormService.offer(offer);
		return "redirect:/repair/repairList";
	}
	
	@RequestMapping("/categoryAjax")
	public @ResponseBody List<RepairForm> categoryAjax(HttpServletRequest request, Model model) {
		return repairFormService.category(request, model);
	}
}
