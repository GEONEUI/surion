package com.surion.service;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.surion.entity.RepairForm;
import com.surion.repository.RepairFormRepository;

@Service
public class RepairFormServiceImpl implements RepairFormService{

	@Autowired
	RepairFormRepository repairFormRepository;
	
	// 의뢰자가 orderForm 날리는 거 저장 // 
	@Override
	public void save(RepairForm repairForm) {
		repairFormRepository.save(repairForm);	
	}

	// orderForm 사진 저장 //
	@Override
	public void imageUpload(HttpServletRequest request) {
		MultipartRequest multi = null;
		
		String save = request.getRealPath("/resources/images");
		int maxSize = 1024*1024*5;
		
		try {
			multi = new MultipartRequest(request, save, maxSize, "UTF-8", new DefaultFileRenamePolicy());
			System.out.println(save);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String id = multi.getParameter("member_id");
		System.out.println(id);
	}

	// DB : suri_repairForm 전체 리스트 가져오기 // 
	@Override
	public void repairList(Model model) {
		List<RepairForm> lst = repairFormRepository.findByAll();
		model.addAttribute("list", lst);
	}
	
	// 의뢰목록에서 1개만 열어서 보기 //
	@Override
	public void repairDetail(Model model, RepairForm m) {
		RepairForm lst = repairFormRepository.findById(m);
		model.addAttribute("m", lst);
	}
	
	// orderForm에서 이미지 업로드 되는 메소드 //
	@Override
	public void upload(HttpServletRequest request) {
		MultipartRequest multi = null;
		
		String save = request.getRealPath("/resources/images");
		int maxSize = 1024 * 1024 * 5;
		
		try {
			multi = new MultipartRequest(request, save, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	


	
	
}
