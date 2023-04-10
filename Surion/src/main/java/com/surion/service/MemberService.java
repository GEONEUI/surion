package com.surion.service;

import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.surion.entity.Member;

public interface MemberService {
	public void join(Member m, RedirectAttributes rttr);
	public void findOne(Member m, HttpSession session, RedirectAttributes rttr);
	public void logout(Member m, HttpSession session, RedirectAttributes rttr);
	public void check(Member m);
}
