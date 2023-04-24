package com.surion.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.surion.entity.Member;
import com.surion.repository.MemberRepository;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	MemberRepository memberRepository;
	
	@Override
	//
	public String join(Member m, RedirectAttributes rttr) {
		if(m.getId().equals("") || m.getId() == "" ||
		   m.getPassword().equals("") || m.getPassword() == "" ||
		   m.getName().equals("") || m.getName() == "" ||
	       m.getEmail().equals("") || m.getEmail() == "") {
			rttr.addFlashAttribute("msgTitle", "Error Message!");
			rttr.addFlashAttribute("msg", "입력창에 공백이 있습니다.");
			rttr.addFlashAttribute("id", m.getId());
			rttr.addFlashAttribute("pw", m.getPassword());
			rttr.addFlashAttribute("na", m.getName());
			rttr.addFlashAttribute("em", m.getEmail());
			return "redirect:/member/join";
		}else {
			memberRepository.save(m);
			rttr.addFlashAttribute("msgTitle", "Success Message!");
			rttr.addFlashAttribute("msg", "회원가입 성공!");
			return "redirect:/";
		}
		
	}

	@Override
	public void findOne(Member m, HttpSession session, RedirectAttributes rttr) {
		Member member = memberRepository.findById(m);
		//아이디 있음
		if(member != null) {
			session.setAttribute("member", member); 
			session.setMaxInactiveInterval(60*10);
			rttr.addFlashAttribute("msgTitle", "Success Message!");
			rttr.addFlashAttribute("msg", "로그인 성공!");
		}else { // 아이디 틀리거나 없음
			rttr.addFlashAttribute("msgTitle", "Error Message!");
			rttr.addFlashAttribute("msg", "로그인 실패!");
		}
	}

	@Override
	public void logout(Member m, HttpSession session, RedirectAttributes rttr) {
		session.invalidate();
		rttr.addFlashAttribute("msgTitle", "Success Message!");
		rttr.addFlashAttribute("msg", "로그아웃 성공!");
	}

	@Override
	public int check(Member m) {
		int result = memberRepository.check(m);
		return result;
	}


	
	

}
