package com.surion.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.surion.entity.OrderForm;
import com.surion.entity.Member;
import com.surion.entity.RepairForm;

public interface MypageService {
	
	String myinfo(Model model, HttpServletRequest request, HttpSession session);
	public String boardUpdate(Model model, HttpServletRequest request);
	public String boardUpdated(Model model, HttpServletRequest request, RedirectAttributes rttr);
	public String boardDelete(RepairForm form);
	public String updateProfile(HttpServletRequest request, HttpSession session, RedirectAttributes rttr);
	public int offerDelete(Member member);
}
