package com.surion.service;

import java.io.File;
import java.text.DecimalFormat;
import java.util.List;
import java.util.Map;

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
import com.surion.entity.OrderJoin;
import com.surion.entity.OrderListPaging;
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
	public void save(OrderForm orderForm) {
		orderFormRepository.save(orderForm);
	}
	
	@Override
	public void orderList(Model model, OrderListPaging pa, HttpServletRequest request, HttpSession session) {
		// 현재 보는 페이지를 설정하기 위한 초기값
				Member member = (Member) session.getAttribute("member");
				String pageNum = request.getParameter("pageNum");
				if(pageNum == null) {
					pageNum = "1";
				}
				int page = Integer.parseInt(pageNum);
//				System.out.println("page : " + page);
				
				int count = orderFormRepository.findByCount(); // 전체 게시글 count
//				System.out.println("전체글--------> : " + count);
				
				pa.setStartValue((page-1) * pa.getPerPageNum()); // LIMIT 앞부분 설정 (value, 12)
//				System.out.println("StartValue : " + pa.getStartValue());
//				-----------------------------------쿼리 실행 확인-------------------------------
				
				pa.setCurrentPage(page); // 초기 페이지를 1로 설정
//				System.out.println("CurrentPage : " + pa.getCurrentPage());
				
				pa.setLastPage((int) Math.ceil(count / (double) pa.getPerPageNum())); // 마지막 페이지로 만듬
//				System.out.println("Lastpage : " + pa.getLastPage());
				
				
				// 뭘 보든 끝페이지 남기기 ex) 6 클릭해도 1~10, 13 클릭해도 11~20
				// 6 / 10 = 0.6 (Math.ceil) = 1 * 10(DisPageNum) = 10 
				pa.setEndNum((int) (Math.ceil(pa.getCurrentPage() / (double) pa.getDisPageNum()) * pa.getDisPageNum()));
//				System.out.println("EndNum : " + pa.getEndNum());
				
				//  시작 페이지 번호를 1로 시작하게 만듬 ex) 1, 11, 21, 31
				pa.setStartNum(pa.getEndNum() - pa.getDisPageNum() + 1);
//				System.out.println("StartNum : "+ pa.getStartNum());
				
				// 마지막 페이지가 ex)46번 이런식이면 endNum을 재셋팅해줌.
				// EndNum은 77번 라인의 주석 때문에 항상 10의 자리이기 때문
				if(pa.getLastPage() < pa.getEndNum()) {
					pa.setEndNum(pa.getLastPage());
				}
				
				// 이전 버튼 : 게시글 1이 아닐 때 무조건 나타나게 함.
				if(pa.getStartNum() != 1) {
					pa.setPrev(true);
				}
				
				// 다음 버튼 : 현재의 마지막 번호가 전체 마지막 숫자보다 작을 때 
				if(pa.getEndNum() < pa.getLastPage()) {
					pa.setNext(true);
				}
		OrderForm orderForm = new OrderForm();
		orderForm.setId(member.getId());
		
		model.addAttribute("paging", pa);
		List<OrderForm> lst = orderFormRepository.findByAll();
		int result = orderFormRepository.findByBoard(member.getId());
		int check = orderFormRepository.findByMechanic(member.getId());
		model.addAttribute("check", check);
		model.addAttribute("list", lst);
		model.addAttribute("result", result);
	}
	
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
	   
		
		//정상적으로 업로드가 되면
		if(newFile != null) {
			String lastName = newFile.getName().substring(newFile.getName().lastIndexOf(".")+1).toUpperCase();
			//이전의 올린 게시글에  정보를 불러오는 메서드가 있어야한다.
			//OrderForm oldBoard = orderFormRepository.findByBoard(member_id);
			//File oldFile = new File(Save + "/" + 예전파일이름);
			
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
		
		return "redirect:/order2/orderList";
	}
	
	
	@Override
	public int check(OrderJoin orderJoin) {
		int result = orderFormRepository.check(orderJoin);
		return result;
	}

	//정비사등록
	@Override
	public String join(OrderJoin orderJoin, RedirectAttributes rttr, HttpSession session) {
		Member member = (Member) session.getAttribute("member");
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
	            
	            Member member2 = memberRepository.findById(member);
	            
	            rttr.addFlashAttribute("msgTitle", "Success Message!");
	            rttr.addFlashAttribute("msg", "정비사등록 성공!");
	            session.setAttribute("result", result);

	            member.setOffice(member2.getOffice());
	            session.setAttribute("member", member);
	            return "redirect:/";
	        } catch (Exception e) {
	            e.printStackTrace();
	            rttr.addFlashAttribute("msgTitle", "Error Message!");
	            rttr.addFlashAttribute("msg", "정비사등록 중 오류가 발생했습니다.");
	            return "redirect:/order2/orderJoin";
	        }
	    }
	}

	@Override
	public void update1(OrderJoin orderJoin) {
		orderFormRepository.update1(orderJoin);
	}

	@Override
	public void readCount(OrderForm orderForm) {
		orderFormRepository.increaseCount(orderForm);
		
	}

	@Override
	public void search(Model model, OrderListPaging pa ,HttpServletRequest request) {
		// 현재 보는 페이지를 설정하기 위한 초기값
				String pageNum = request.getParameter("pageNum");
				if(pageNum == null) {
					pageNum = "1";
				}
				int page = Integer.parseInt(pageNum);
				int count = orderFormRepository.searchCount(pa); // 전체 게시글 count
				pa.setStartValue((page-1) * pa.getPerPageNum()); // LIMIT 앞부분 설정 (value, 12)
//				-----------------------------------쿼리 실행 확인-------------------------------
				pa.setCurrentPage(page); // 초기 페이지를 1로 설정
				pa.setLastPage((int) Math.ceil(count / (double) pa.getPerPageNum())); // 마지막 페이지로 만듬
				pa.setEndNum((int) (Math.ceil(pa.getCurrentPage() / (double) pa.getDisPageNum()) * pa.getDisPageNum()));
				pa.setStartNum(pa.getEndNum() - pa.getDisPageNum() + 1);
				if(pa.getLastPage() < pa.getEndNum()) {
					pa.setEndNum(pa.getLastPage());
				}
				if(pa.getStartNum() != 1) {
					pa.setPrev(true);
				}
				if(pa.getEndNum() < pa.getLastPage()) {
					pa.setNext(true);
				}
				
		model.addAttribute("paging", pa);
		List<OrderForm> lst = orderFormRepository.search(pa);
		model.addAttribute("list", lst);
	}
	//게시물 상세보기
	@Override
	public void orderDetail(Model model, OrderForm orderForm) {
		OrderForm pro = orderFormRepository.findById(orderForm);
		model.addAttribute("profile", pro);
	}
	
}



	

	


	
