package com.surion.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.surion.entity.RepairForm;
import com.surion.entity.RepairListPaging;
import com.surion.entity.RepairOffer;

public interface RepairFormService {
	// 견적 요청 저장
	public void save(RepairForm repairForm);
	
//	// 견적 요청 시 업로드 되는 이미지
//	public void imageUpload(HttpServletRequest request);
	
	// 의뢰목록 리스트
	public void repairList(Model model, RepairListPaging pa, HttpServletRequest request);
	
	// 견적 요청 시 업로드 되는 이미지
	public void upload(HttpServletRequest request);
	
	// 의뢰목록 상세보기
	public void repairDetail(Model model, RepairForm m);
	
	// 조회수 증가
	public void readCount(RepairForm m);
	
	// repairList 검색
	public void search(Model model, RepairListPaging pa, HttpServletRequest reuqest);
	
	// Mechanic의 의뢰 제안
	public void offer(RepairOffer offer);
	
	// 카테고리
	public List<RepairForm> category(HttpServletRequest request);

}
