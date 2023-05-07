package com.surion.service;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.surion.domain.member.Member;
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
	public String findOne(Member m, HttpSession session, RedirectAttributes rttr) {
		Member member = memberRepository.findById(m);
		//아이디 있음
		if(member != null) {
			session.setAttribute("member", member); 
			session.setMaxInactiveInterval(60*10);
			rttr.addFlashAttribute("msgTitle", "Success Message!");
			rttr.addFlashAttribute("msg", "로그인 성공!");
			return "redirect:/";
		}else { // 아이디 틀리거나 없음
			rttr.addFlashAttribute("msgTitle", "Error Message!");
			rttr.addFlashAttribute("msg", "아이디와 비밀번호를 확인해주세요.");
			return "redirect:/member/login";
		}
	}

	@Override
	public Member findById(String id) {
		return null;
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
	
	
	@Override
	public String updateProfile(HttpServletRequest request, HttpSession session, RedirectAttributes rttr) {
		MultipartRequest multi = null;
		
		int maxSize = 1024 * 1024 *5; //5mb용량체크
		String save = request.getRealPath("/resources/images");
		
		
		try {
			multi = new MultipartRequest(request, save, maxSize, "UTF-8", new DefaultFileRenamePolicy());
			System.out.println(save);
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		File newFile =  multi.getFile("imgurl");
		String id = multi.getParameter("id");
		String password = multi.getParameter("password");
		String name = multi.getParameter("name");
		String email = multi.getParameter("email");
		String phone = multi.getParameter("phone");
		String address = multi.getParameter("address");
		String updateFileName = null;
		Member m = memberRepository.findByUser(id);
		
		if(newFile == null) {
			updateFileName = m.getImgurl();
		}
		
		if(newFile != null) {
			updateFileName = newFile.getName();
			String imgLastName = newFile.getName().substring(newFile.getName().lastIndexOf(".")+1).toUpperCase();
			File oldFile = new File(save + "/" + m.getImgurl());
			if(imgLastName.equals("PNG") || imgLastName.equals("JPG")) {
				if(oldFile.exists()) {
					oldFile.delete();
				}
			}else {
				if(newFile.exists()) {
					newFile.delete();
				}

				rttr.addFlashAttribute("msgTitle", "Error Message!");
				rttr.addFlashAttribute("msg", "이미지는 PNG, JPG만 업로드 가능합니다.");
				return "redirect:/mypage/myinfo";
			}
		}
		
		Member mo = new Member();
		mo.setId(id);
		mo.setPassword(password);
		mo.setEmail(email);
		mo.setPhone(phone);
		mo.setAddress(address);
		mo.setImgurl(updateFileName);
		mo.setName(name);
		
		//업데이트
		memberRepository.updateProfile(mo);
		
		Member member = memberRepository.findByUser(id);

		session.setAttribute("member", member);
		session.setMaxInactiveInterval(60*20);
		
		rttr.addFlashAttribute("updateMsg", "업데이트가 완료 되었습니다.");

		return "redirect:/mypage/myinfo";
	}

	@Override
	public Long findByMemberById(String id) {
		return null;
	}

	@Override
	public Long findByMemberById(Long id) {
		return null;
	}

	@Override
	public void save(Member member) {

	}


}
