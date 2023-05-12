package com.surion.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.surion.domain.review.Review;
import com.surion.repository.MainRepository;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.surion.entity.Criteria;
import com.surion.entity.OrderForm;
import com.surion.entity.OrderJoin;
import com.surion.entity.OrderListPaging;
import com.surion.service.MypageService;
import com.surion.service.OrderFormService;


@Controller
@RequestMapping("/order2/*")
public class OrderTwoController {

	@Autowired
	MainRepository mainRepository;
	@Autowired
	OrderFormService orderFormService;
	
	@Autowired
	MypageService mypageService;
	
	//정비사 등록폼
	@RequestMapping("/orderJoin")
	public String orderJoin() {
		return "/order2/orderJoin";
	}
	
    //프로필 등록
    @RequestMapping("/orderForm")
    public String orderForm() {
    	return "/order2/orderForm";
    }
    
    //사진업로드
    @PostMapping("/upload")
    public String upload(HttpServletRequest request, RedirectAttributes rttr, HttpSession session) {
    	return orderFormService.upload(request, rttr, session);
    }
    
    //프로필등록 오류
    @GetMapping("/orderFormProc")
    public String orderFormProc() {
    	return "/order2/orderFormProc";
    }
    
    //프로필리스트
    @GetMapping("/orderList")
    public String orderList(Model model, OrderListPaging pa, HttpServletRequest request, HttpSession session, Criteria cri) {
    	orderFormService.orderList(model, pa, request, session, cri);
        return "/order2/orderList";
    }
    
    // RepairList 검색 
   	@RequestMapping("/orderListSearch")
   	public String repairListSearch(Model model, Criteria cri, HttpServletRequest request) {
   	orderFormService.search(model, cri, request);
   	return "/order2/orderListSearch";
   	}
    
    //거래내역
    @RequestMapping("/transaction")
    public String transaction() {
        return "/order2/transaction";
    }
    
    
    //중복체크
  	@GetMapping("/check")
  	public @ResponseBody int check(OrderJoin orderJoin) {
  		System.out.println(orderJoin.getMechanic_id());
  		int result = orderFormService.check(orderJoin);
  		return result;
  	}
  	
  	//정비사 등록
  	@PostMapping("/join")
  	public String join(OrderJoin orderJoin, RedirectAttributes rttr, HttpSession session) {
  		return orderFormService.join(orderJoin, rttr, session);
  	}
  	
  	//카테고리선택
  	@PostMapping("/categoryAjax")
	public @ResponseBody List<OrderForm> categoryAjax(HttpServletRequest request, Model model) {
		return orderFormService.category(request, model);
	}
  	
  	@GetMapping("/orderAjax")
	public @ResponseBody int orderList(@Param("pageNum")int pageNum){
		System.out.println(pageNum);
		return pageNum;
	}
  	//지도
  	@GetMapping("/map")
    public String mapTest(){
        return "/map/map";
    }
    //상세페이지
    @RequestMapping("/productDetail")
    public String detail(Model model, String id, OrderForm orderForm, HttpSession session) {
		String member_id = (String) session.getAttribute("member");
		Review reviewDetail =mainRepository.findReview(member_id, id);
		System.out.println("reviewList = " + reviewDetail);
    	orderFormService.orderDetail(model, id);
    	orderFormService.readCount(orderForm);
    	return "/order2/productDetail";
    }
}

