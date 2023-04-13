package com.surion.service;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.surion.entity.RepairForm;
import com.surion.repository.RepairFormRepository;

@Service
public class RepairFormServiceImp implements RepairFormService{

	@Autowired
	RepairFormRepository repairFormRepository;

	@Override
	public void save(RepairForm repairform) {
	repairFormRepository.save(repairform);	
	}

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
	
	
}
