package com.surion.service;

import javax.servlet.http.HttpServletRequest;

import com.surion.entity.RepairForm;

public interface RepairFormService {
	public void save(RepairForm repairForm);
	public void imageUpload(HttpServletRequest request);
	
}
