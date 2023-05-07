package com.surion.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.surion.domain.member.Member;

public interface MemberService {
	public String join(Member m, RedirectAttributes rttr);
	public String findOne(Member m, HttpSession session, RedirectAttributes rttr);
	public Member findById(String id);
	public void logout(Member m, HttpSession session, RedirectAttributes rttr);
	public int check(Member m);
	public String updateProfile(HttpServletRequest requeset, HttpSession session, RedirectAttributes rttr);
	public Long findByMemberById(String id);

	Long findByMemberById(Long id);

    void save(Member member);
}
