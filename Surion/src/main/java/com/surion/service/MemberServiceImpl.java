package com.surion.service;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.surion.entity.Member;
import com.surion.entity.OrderForm;
import com.surion.repository.MemberRepository;
import com.surion.repository.OrderFormRepository;

import lombok.RequiredArgsConstructor;

@Service
public class MemberServiceImpl implements MemberService{

	
	@Autowired
	MemberRepository memberRepository;
	
	@Autowired
	OrderFormRepository orderFormRepository;
	
	@Override
	//회원가입
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
	
	//로그인
	@Override
	public String login(Member m, HttpSession session, RedirectAttributes rttr) {
			Member member = memberRepository.login(m);
			//아이디 있음
			if(member != null) {
				//정비사등록 확인
				Member mechanic = memberRepository.findById(member);
				//정비사등록 이후 글 작성했는지 판단
				int result = orderFormRepository.findByBoard(member.getId());
				//로그인정보
				session.setAttribute("member", member);
				//로그인한 유저의 사업자정보
				session.setAttribute("mechanic", mechanic);
				//정비사등록확인
				session.setAttribute("result", result);
				session.setMaxInactiveInterval(60*100);
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





	
	




	
	

}
