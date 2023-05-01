package com.surion.service;


import java.text.DecimalFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.internal.build.AllowSysOut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.surion.entity.RepairForm;
import com.surion.entity.RepairListPaging;
import com.surion.repository.RepairFormRepository;

@Service
public class RepairFormServiceImpl implements RepairFormService{

	@Autowired
	RepairFormRepository repairFormRepository;
	
	// 의뢰자가 orderForm 날리는 거 저장 // 
	@Override
	public void save(RepairForm m) {
		repairFormRepository.save(m);	
	}

	// DB : suri_repairForm 전체 리스트 가져와서 페이징
	@Override
	public void repairList(Model model, RepairListPaging pa, HttpServletRequest request) {
		// 현재 보는 페이지를 설정하기 위한 초기값
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null) {
			pageNum = "1";
		}
		int page = Integer.parseInt(pageNum);
//		System.out.println("page : " + page);
		
		int count = repairFormRepository.findByCount(); // 전체 게시글 count
//		System.out.println("전체글--------> : " + count);
		
		pa.setStartValue((page-1) * pa.getPerPageNum()); // LIMIT 앞부분 설정 (value, 12)
//		System.out.println("StartValue : " + pa.getStartValue());
//		-----------------------------------쿼리 실행 확인-------------------------------
		
		pa.setCurrentPage(page); // 초기 페이지를 1로 설정
//		System.out.println("CurrentPage : " + pa.getCurrentPage());
		
		pa.setLastPage((int) Math.ceil(count / (double) pa.getPerPageNum())); // 마지막 페이지로 만듬
//		System.out.println("Lastpage : " + pa.getLastPage());
		
		
		// 뭘 보든 끝페이지 남기기 ex) 6 클릭해도 1~10, 13 클릭해도 11~20
		// 6 / 10 = 0.6 (Math.ceil) = 1 * 10(DisPageNum) = 10 
		pa.setEndNum((int) (Math.ceil(pa.getCurrentPage() / (double) pa.getDisPageNum()) * pa.getDisPageNum()));
//		System.out.println("EndNum : " + pa.getEndNum());
		
		//  시작 페이지 번호를 1로 시작하게 만듬 ex) 1, 11, 21, 31
		pa.setStartNum(pa.getEndNum() - pa.getDisPageNum() + 1);
//		System.out.println("StartNum : "+ pa.getStartNum());
		
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
		
		model.addAttribute("paging", pa);
		List<RepairForm> lst = repairFormRepository.findByAll(pa);
		model.addAttribute("list", lst);	
	}
	
	// 의뢰목록에서 1개만 열어서 보기 //
	@Override
	public void repairDetail(Model model, RepairForm m) {
		DecimalFormat decFormat = new DecimalFormat("###,###");
		RepairForm lst = repairFormRepository.findById(m);
		
		
		if(lst.getEstimate().equals("협의")) {
			model.addAttribute("money", "협의");
		}else {
			int lstMoney = Integer.parseInt(lst.getEstimate());
			String money = decFormat.format(lstMoney);
			model.addAttribute("money", money);
		}
		model.addAttribute("m", lst);
	}
	
	// orderForm에서 이미지 업로드 되는 메소드 //
	@Override
	public void upload(HttpServletRequest request) {
		MultipartRequest multi = null;
		
		String save = request.getRealPath("/resources/repairImages");
		int maxSize = 1024 * 1024 * 5;
		try {
			multi = new MultipartRequest(request, save, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void readCount(RepairForm m) {
		repairFormRepository.increaseCount(m);
	}

	@Override
	public void search(Model model, RepairListPaging pa ,HttpServletRequest request) {
		// 현재 보는 페이지를 설정하기 위한 초기값
				String pageNum = request.getParameter("pageNum");
				if(pageNum == null) {
					pageNum = "1";
				}
				int page = Integer.parseInt(pageNum);
				int count = repairFormRepository.searchCount(pa); // 전체 게시글 count
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
		List<RepairForm> lst = repairFormRepository.search(pa);
		model.addAttribute("list", lst);
	}
	


	
	
}
