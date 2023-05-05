package com.surion.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.surion.entity.Member;
import com.surion.entity.OrderForm;
import com.surion.entity.OrderJoin;
import com.surion.entity.OrderListPaging;

public interface OrderFormService {
	//게시물등록
	public void save(OrderForm orderForm);
	
	//게시물 리스트
	public void orderList(Model model, OrderListPaging pa, HttpServletRequest request, HttpSession session);
	
	//이미지업로드 
	public String upload(HttpServletRequest request, RedirectAttributes rttr, HttpSession session);
	
	//거래내역
	public void transaction(Model model);
	
	//게시물 상세보기
	public void orderDetail(Model model, String id);
	
	//사업자번호 중복검사
	public int check(OrderJoin orderJoin);
	
	//정비사등록
	public String join(OrderJoin orderJoin, RedirectAttributes rttr, HttpSession session);	
	
	//정비사등록시 멤버테이블의 컬럼값 가져오기
	public void update1(OrderJoin orderJoin);
	
	//조회수 증가
	public void readCount(OrderForm orderForm);
	
	//orderList 검색
	public void search(Model model, OrderListPaging pa, HttpServletRequest request);
	
}