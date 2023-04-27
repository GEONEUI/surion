package com.surion.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.surion.entity.OrderForm;
import com.surion.entity.OrderJoin;
import com.surion.entity.OrderListPaging;

public interface OrderFormService {
	public void save(OrderForm orderForm);
	public void orderList(Model model, OrderListPaging pa);
	public String upload(HttpServletRequest request, RedirectAttributes rttr);
	public void transaction(Model model);
	public int check(OrderJoin orderJoin);
	public String join(OrderJoin orderJoin, RedirectAttributes rttr);
}