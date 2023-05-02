package com.surion.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.surion.entity.Member;
import com.surion.entity.OrderForm;
import com.surion.entity.OrderJoin;
import com.surion.entity.OrderListPaging;
import com.surion.service.OrderFormService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/order2/*")
public class OrderTwoController {

	
	@Autowired
	OrderFormService orderFormService;
	
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
    public String orderList(Model model, OrderListPaging pa, HttpServletRequest request, HttpSession session) {
    	orderFormService.orderList(model, pa, request, session);
        return "/order2/orderList";
    }
    
    // RepairList 검색 
   	@RequestMapping("/orderListSearch")
   	public String repairListSearch(Model model, OrderListPaging pa, HttpServletRequest request) {
   	orderFormService.search(model, pa, request);
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
  	
  	@RequestMapping("/orderMyPage")
  	public String orderMy() {
  		return "/order2/orderMyPage";
  	}

}

