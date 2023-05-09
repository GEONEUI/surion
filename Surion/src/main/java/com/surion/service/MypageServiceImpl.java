package com.surion.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

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
import com.surion.entity.OrderFormRepairOfferJoin;
import com.surion.entity.RepairForm;
import com.surion.repository.ChatRoomRepository;
import com.surion.repository.OrderFormRepository;
import com.surion.repository.RepairFormRepository;

@Service
public class MypageServiceImpl implements MypageService {

	private final RepairFormRepository repairFormRepository;
	private final ChatRoomRepository chatRoomRepository;
	private final OrderFormRepository orderFormRepository;

	@Autowired
	public MypageServiceImpl(RepairFormRepository repairFormRepository, ChatRoomRepository chatRoomRepository, OrderFormRepository orderFormRepository) {
		this.repairFormRepository = repairFormRepository;
		this.chatRoomRepository = chatRoomRepository;
		this.orderFormRepository = orderFormRepository;
	}

	@Override
	public String myinfo(Model model, HttpServletRequest request, HttpSession session) {
		List<RepairForm> list = new ArrayList<>();
		Member member = (Member) session.getAttribute("member");
		OrderForm orderForm = orderFormRepository.findById(member.getId());

		String pagev = request.getParameter("pageview");
		if (pagev == null)
			pagev = "1";
		else if (pagev.equals("2")) {
			list = repairFormRepository.findByMemberId(member.getId());
			model.addAttribute("myBorList", list);
		
		} else if (pagev.equals("4")) {
			List<OrderFormRepairOfferJoin> joinList = chatRoomRepository.findOrderJoinByMemberId(member);
			model.addAttribute("joinList", joinList);
		} 

		int pageview = Integer.parseInt(pagev);
		
		model.addAttribute("orderForm", orderForm);
		model.addAttribute("pageview", pageview);
		model.addAttribute("member", member);
		return "/mypage/mypage";
	}

	@Override
	public String boardUpdate(Model model, HttpServletRequest request) {
		RepairForm m = new RepairForm();
		int idx = Integer.parseInt(request.getParameter("idx"));
		m.setIdx(idx);
		m = repairFormRepository.findById(m);
		model.addAttribute("m", m);
		return "/mypage/updateRepair";
	}

	@Override
	public String boardUpdated(Model model, HttpServletRequest request, RedirectAttributes rttr) {
		MultipartRequest multi = null;

		int maxSize = 1024 * 1024 * 5; // 5mb용량체크
		String save = request.getRealPath("/resources/repairImages");

		try {
			multi = new MultipartRequest(request, save, maxSize, "UTF-8", new DefaultFileRenamePolicy());
			System.out.println(save);
		} catch (Exception e) {
			e.printStackTrace();
		}

		File newFile = multi.getFile("image");
		int idx = Integer.parseInt(multi.getParameter("idx"));
		String title = multi.getParameter("title");
		String date = multi.getParameter("date");
		String estimate = multi.getParameter("estimate");
		String content = multi.getParameter("content");
		String updateFileName = null;
		RepairForm rForm = new RepairForm();
		rForm.setIdx(idx);
		rForm = repairFormRepository.findById(rForm);
		System.out.println(rForm);

		System.out.println("newFile ------------------------------------>" + newFile);

		if (newFile != null) {
			updateFileName = newFile.getName();
			String imgLastName = newFile.getName().substring(newFile.getName().lastIndexOf(".") + 1).toUpperCase();
			if (imgLastName.equals("PNG") || imgLastName.equals("JPG")) {
//				if(oldFile.exists()) {
//					oldFile.delete();
//				}
			} else {
				if (newFile.exists()) {
					newFile.delete();
				}

				rttr.addFlashAttribute("msgTitle", "Error Message!");
				rttr.addFlashAttribute("msg", "이미지는 PNG, JPG만 업로드 가능합니다.");
				return "redirect:/mypage/myinfo";
			}
		} else {
			File oldFile = new File(save + "/" + rForm.getImage().substring(11));
			updateFileName = oldFile.getName();
		}

		RepairForm form = RepairForm.builder().date(date).estimate(estimate).title(title).content(content)
				.image("C:\\fakepath\\" + updateFileName).idx(idx).build();

		// 업데이트
		System.out.println("--------------------------------------> " + form.toString());
		repairFormRepository.updateRepair(form);

		rttr.addFlashAttribute("updateMsg", "업데이트가 완료 되었습니다.");

		return "redirect:/mypage/myinfo?pageview=2";
	}

	@Override
	public String boardDelete(RepairForm form) {
		repairFormRepository.deleteRepair(form);
		return "redirect:/mypage/myinfo?pageview=2";
	}

	
	@Override
	public String updateProfile(HttpServletRequest request, HttpSession session, RedirectAttributes rttr) {
		MultipartRequest multi = null;
		
		int maxSize = 1024 * 1024 *5; //5mb용량체크
		String save = request.getRealPath("/resources/images/order");
		
		
		try {
			multi = new MultipartRequest(request, save, maxSize, "UTF-8", new DefaultFileRenamePolicy());
			System.out.println(save);
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		File newFile =  multi.getFile("img");
		String id = multi.getParameter("id");
		String shopName = multi.getParameter("shopName");
		String mechanic_id = multi.getParameter("mechanic_id");
		String intro = multi.getParameter("intro");
		String startTime = multi.getParameter("startTime");
		String endTime = multi.getParameter("endTime");
		String office = multi.getParameter("office");
		String updateFileName = null;
		OrderForm ord = orderFormRepository.findById(id);
		
		if(newFile == null) {
			updateFileName = ord.getImg();
		}
		
		if(newFile != null) {
			updateFileName = newFile.getName();
			String imgLastName = newFile.getName().substring(newFile.getName().lastIndexOf(".")+1).toUpperCase();
			File oldFile = new File(save + "/" + ord.getImg());
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
				return "redirect:/mypage/myinfo?pageview=5";
			}
		}
		
		OrderForm od = new OrderForm();
		od.setId(id);
		od.setShopName(shopName);
		od.setMechanic_id(mechanic_id);
		od.setIntro(intro);
		od.setOffice(office);
		od.setImg(updateFileName);
		od.setStartTime(startTime);
		od.setEndTime(endTime);
		
		//업데이트
		orderFormRepository.updateOrder(od);
		
		OrderForm orderForm = orderFormRepository.findById(id);

		session.setAttribute("orderForm", orderForm);
		session.setMaxInactiveInterval(60*20);
		
		
		
		rttr.addFlashAttribute("updateMsg", "업데이트가 완료 되었습니다.");

		return "redirect:/mypage/myinfo?pageview=5";
	}
	
	
	@Override
	public int offerDelete(Member member) {
		return chatRoomRepository.deleteOfferListByMemberId(member);
	}

}
