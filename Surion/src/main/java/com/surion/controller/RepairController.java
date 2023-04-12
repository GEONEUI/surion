package com.surion.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	public String repairList() {
		return "/repair/repairList";
	}
	
	@RequestMapping("/repairForm")
	public String repairForm() {
		return "/repair/repairForm";
	}
	
	@RequestMapping("/repairDetail")
	public String repairDetail() {
		return "/repair/repairDetail";
	}
	
	// 파일 업로드
	@PostMapping("/uploadAjaxAction")
		public @ResponseBody String uploadAjaxPost(RepairForm repairForm, HttpServletRequest request) {
		repairFormService.save(repairForm);
		
		return "요청이 완료 되었습니다.";
		
	}
	
	
	@PostMapping("/upload")
	public String upload(HttpServletRequest request) {
		MultipartRequest multi = null;
		
		String save = request.getRealPath("/resources/images");
		int maxSize = 1024 * 1024 * 5;
		
		try {
			multi = new MultipartRequest(request, save, maxSize, "UTF-8", new DefaultFileRenamePolicy());
			System.out.println(save);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		return "redirect:/";
	}
	
	
	
	
}
