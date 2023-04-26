package com.surion.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.surion.entity.RepairForm;

public interface RepairFormService {
	public void save(RepairForm repairForm);
	public void imageUpload(HttpServletRequest request);
	public void repairList(Model model);
	public void upload(HttpServletRequest request);
	public void repairDetail(Model model, RepairForm m);
}
