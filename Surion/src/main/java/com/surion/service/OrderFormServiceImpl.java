package com.surion.service;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.surion.entity.Criteria;
import com.surion.entity.Member;
import com.surion.entity.OrderForm;
import com.surion.entity.OrderJoin;
import com.surion.entity.OrderListPaging;
import com.surion.entity.PageMaker;
import com.surion.repository.MemberRepository;
import com.surion.repository.OrderFormRepository;

@Service
public class OrderFormServiceImpl implements OrderFormService{
 	@Autowired
	OrderFormRepository orderFormRepository;
	
	@Autowired
	MemberRepository memberRepository;

	
	
	//게시물 등록폼 저장
	@Override
	public void save(OrderForm orderForm, HttpSession session) {
		orderFormRepository.save(orderForm);
		orderFormRepository.rollUpdate(orderForm);

	}
	

	//거래내역
	@Override
	public void transaction(Model model) {
		// TODO Auto-generated method stub
		
	}
	
	
	//이미지 업로드 되는 메소드
	@Override
	public String upload(HttpServletRequest request, RedirectAttributes rttr, HttpSession session) {
		MultipartRequest multi = null;
		Member member = (Member) session.getAttribute("member");
		String Save = request.getRealPath("/resources/images/order");
		int MaxSize = 1024 * 1024 * 5;
		
		try {
			multi = new MultipartRequest(request, Save, MaxSize, "UTF-8", new DefaultFileRenamePolicy());
			System.out.println(Save);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		File newFile = multi.getFile("imageUp");
		String experience = multi.getParameter("experience");
	    String shopName = multi.getParameter("shopName");
	    String intro = multi.getParameter("intro");
	    String startTime = multi.getParameter("startTime");
	    String endTime = multi.getParameter("endTime");
	    String category = multi.getParameter("category");
	    String office = multi.getParameter("office");
	    String imgname = null;
	    if (member == null) { // 로그인하지 않은 경우
	        return "redirect:${cpath}/common/login";
	    }
	    //프로필을 등록했는지 확인 
	    int count = orderFormRepository.findByBoard(member.getId());

	    // 이미 등록된 OrderForm 정보가 있다면 알림 메시지 출력
	    if (count != 0) {
	        rttr.addFlashAttribute("msg", "이미 등록된 정보가 있습니다.");
	        return "redirect:/";
	    }
		//정상적으로 업로드가 되면
		if(newFile != null) {
			String lastName = newFile.getName().substring(newFile.getName().lastIndexOf(".")+1).toUpperCase();

			
			rttr.addFlashAttribute("msg", "등록이 완료되었습니다.");
			if(lastName.equals("PNG") || lastName.equals("JPG")) {
				imgname = newFile.getName();
				
			}else {
				if(newFile.exists()) {
					newFile.delete();
				}
				
				rttr.addFlashAttribute("er", "er");
				System.out.println("삭제");
				rttr.addFlashAttribute("msg", "이미지파일은 PNG, JPG만 가능합니다.");
				return "redirect:/order2/orderFormProc";
			}
		}else {
			rttr.addFlashAttribute("er", "er");
			rttr.addFlashAttribute("msg", "이미지 전송이 실패하였습니다.");
			return "redirect:/order2/orderFormProc";
		}

		
		OrderForm orderForm = new OrderForm();
	    orderForm.setId(member.getId());
	    orderForm.setShopName(shopName);
	    orderForm.setIntro(intro);
	    orderForm.setStartTime(startTime);
	    orderForm.setEndTime(endTime);
	    orderForm.setCategory(category);
	    orderForm.setExperience(experience);
	    orderForm.setImg(imgname);
	    orderForm.setOffice(office);
		System.out.println(member.getId());
		orderFormRepository.save(orderForm);
		orderFormRepository.updateMechanic(orderForm);
		return "redirect:/order2/orderList";
	}
	
	//사업자번호 중복체크
	@Override
	public int check(OrderJoin orderJoin) {
		int result = orderFormRepository.check(orderJoin);
		return result;
	}

	//정비사등록
	@Override
	public String join(OrderJoin orderJoin, RedirectAttributes rttr, HttpSession session) {
		Member member = (Member) session.getAttribute("member");
		Member mechanic = (Member) session.getAttribute("mechanic");
		orderJoin.setId(member.getId());
		System.out.println(member.getId());
		int result = orderFormRepository.findByBoard(member.getId());
	    if (orderJoin.getMechanic_id().isEmpty() ||
	            orderJoin.getShopName().isEmpty() ||
	            orderJoin.getName().isEmpty() ||
	            orderJoin.getOffice().isEmpty()) {
	        rttr.addFlashAttribute("msgTitle", "Error Message!");
	        rttr.addFlashAttribute("msg", "입력창에 공백이 있습니다.");
	        rttr.addFlashAttribute("mechanic", orderJoin.getMechanic_id());
	        rttr.addFlashAttribute("shop", orderJoin.getShopName());
	        rttr.addFlashAttribute("na", orderJoin.getName());
	        rttr.addFlashAttribute("of", orderJoin.getOffice());
	        
	        return "redirect:/order2/orderJoin";
	    } else { 
	        try {
	            orderFormRepository.join(orderJoin);
	            orderFormRepository.update1(orderJoin);
	            orderFormRepository.updateOffice(member.getId(), orderJoin.getOffice());
	                        
	            rttr.addFlashAttribute("msgTitle", "Success Message!");
	            rttr.addFlashAttribute("msg", "정비사등록 성공!");
	            member = memberRepository.findById(member);
	            member.setOffice(orderJoin.getOffice());
	            mechanic = memberRepository.findById(member);
	            result = orderFormRepository.findByBoard(member.getId());
	            session.removeAttribute("result");
	            session.setAttribute("result", result);
	            session.removeAttribute("member");
	            session.setAttribute("member", member);
	            session.removeAttribute("mechanic");
	            session.setAttribute("mechanic", mechanic);
	            
	            return "redirect:/";
	        } catch (Exception e) {
	            e.printStackTrace();
	            rttr.addFlashAttribute("msgTitle", "Error Message!");
	            rttr.addFlashAttribute("msg", "정비사등록 중 오류가 발생했습니다.");
	            return "redirect:/order2/orderJoin";
	        }
	    }
	}
	
	//정비사등록시 멤버테이블 정보가져오기
	@Override
	public void update1(OrderJoin orderJoin) {
		orderFormRepository.update1(orderJoin);
	}
	//조회수 증가
	@Override
	public void readCount(OrderForm orderForm) {
		orderFormRepository.increaseCount(orderForm);
		
	}
	//업체 검색
	@Override
	public void search(Model model, Criteria cri ,HttpServletRequest request) {
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(orderFormRepository.searchCount(cri));
		List<OrderForm> list = orderFormRepository.search(cri);
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pageMaker);			
	}
	//프로필 상세보기
	@Override
	public void orderDetail(Model model, String id) {
		OrderForm orderForm = orderFormRepository.findById(id);
		model.addAttribute("profile", orderForm);
	}
	
	//카테고리
	@Override
	public List<OrderForm> category(HttpServletRequest request, Model model) {
	    String kind = request.getParameter("kind");   
	    if(kind.equals("최신순")) {
	        List<OrderForm> lst = orderFormRepository.categoryRecent();
	        return lst;
	    }
	    else if(kind.equals("인기순")) {
	        List<OrderForm> lst = orderFormRepository.categoryPopular();
	        return lst;
	    }
	    else {
	        List<OrderForm> lst = orderFormRepository.category(kind);
	        return lst;
	    }
	}

	//페이징
	@Override
	public void orderList(Model model, OrderListPaging pa, HttpServletRequest request, HttpSession session,
			Criteria Cri) {
		
		
		Member member = (Member) session.getAttribute("member");
		if(member != null) {
			int result = orderFormRepository.findByBoard(member.getId());
			int check = orderFormRepository.findByMechanic(member.getId());
			model.addAttribute("result", result);
			model.addAttribute("check", check);
		}
		
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(Cri);
		pageMaker.setTotalCount(orderFormRepository.findByCount());
		
		
		
		
		
		List<OrderForm> lst = orderFormRepository.findByAll(Cri);
		System.out.println(lst);
		
		
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("list", lst);
		
	}

	
}

	
	
	



	

	


	
