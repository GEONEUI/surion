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
import com.surion.service.RepairFormService;

@Controller
@RequestMapping("/repair/*")
public class RepairController {
	
	@Autowired
	RepairFormService repairFormService;
	
	@RequestMapping("/repairList")
	public String repairList(Model model) {
		repairFormService.repairList(model);
		return "/repair/repairList";
	}
	
	@RequestMapping("/repairForm")
	public String repairForm() {
		return "/repair/repairForm";
	}
	
	@RequestMapping("/repairDetail")
	public String repairDetail(Model model, RepairForm m) {
		repairFormService.repairDetail(model, m);
		return "/repair/repairDetail";
	}
	
	// 파일 업로드
	@PostMapping("/uploadAjaxAction")
		public @ResponseBody void uploadAjaxPost(RepairForm repairForm, HttpServletRequest request) {
		repairFormService.save(repairForm);
	}
	
	
	@PostMapping("/upload")
	public String upload(HttpServletRequest request) {
		repairFormService.upload(request);
		return "redirect:/";
	}
	
	
	
	
}
