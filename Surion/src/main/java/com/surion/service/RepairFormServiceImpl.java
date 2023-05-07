package com.surion.service;


import java.io.File;
import java.text.DecimalFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.surion.entity.RepairForm;
import com.surion.entity.RepairListPaging;
import com.surion.entity.RepairOffer;
import com.surion.repository.RepairFormRepository;

@Service
public class RepairFormServiceImpl implements RepairFormService{

	@Autowired
	RepairFormRepository repairFormRepository;
	
	// ��猶곗��媛� orderForm ��由щ�� 嫄� ���� // 
	@Override
	public void save(RepairForm m) {
		repairFormRepository.save(m);	
	}

	// DB : suri_repairForm ��泥� 由ъ�ㅽ�� 媛��몄���� ���댁�
	@Override
	public void repairList(Model model, RepairListPaging pa, HttpServletRequest request) {
		// ���� 蹂대�� ���댁�瑜� �ㅼ����湲� ���� 珥�湲곌�
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null) {
			pageNum = "1";
		}
		int page = Integer.parseInt(pageNum);
//		System.out.println("page : " + page);
		
		int count = repairFormRepository.findByCount(); // ��泥� 寃���湲� count
//		System.out.println("��泥닿�--------> : " + count);
		
		pa.setStartValue((page-1) * pa.getPerPageNum()); // LIMIT ��遺�遺� �ㅼ�� (value, 12)
//		System.out.println("StartValue : " + pa.getStartValue());
//		-----------------------------------荑쇰━ �ㅽ�� ����-------------------------------
		
		pa.setCurrentPage(page); // 珥�湲� ���댁�瑜� 1濡� �ㅼ��
//		System.out.println("CurrentPage : " + pa.getCurrentPage());
		
		pa.setLastPage((int) Math.ceil(count / (double) pa.getPerPageNum())); // 留�吏�留� ���댁�濡� 留���
//		System.out.println("Lastpage : " + pa.getLastPage());
		
		
		// 萸� 蹂대�� �����댁� �④린湲� ex) 6 �대┃�대�� 1~10, 13 �대┃�대�� 11~20
		// 6 / 10 = 0.6 (Math.ceil) = 1 * 10(DisPageNum) = 10 
		pa.setEndNum((int) (Math.ceil(pa.getCurrentPage() / (double) pa.getDisPageNum()) * pa.getDisPageNum()));
//		System.out.println("EndNum : " + pa.getEndNum());
		
		//  ���� ���댁� 踰��몃�� 1濡� ������寃� 留��� ex) 1, 11, 21, 31
		pa.setStartNum(pa.getEndNum() - pa.getDisPageNum() + 1);
//		System.out.println("StartNum : "+ pa.getStartNum());
		
		// 留�吏�留� ���댁�媛� ex)46踰� �대�곗���대㈃ endNum�� �ъ�����댁�.
		// EndNum�� 77踰� �쇱�몄�� 二쇱�� ��臾몄�� ���� 10�� ��由ъ�닿린 ��臾�
		if(pa.getLastPage() < pa.getEndNum()) {
			pa.setEndNum(pa.getLastPage());
		}
		
		// �댁�� 踰��� : 寃���湲� 1�� ���� �� 臾댁“嫄� ������寃� ��.
		if(pa.getStartNum() != 1) {
			pa.setPrev(true);
		}
		
		// �ㅼ�� 踰��� : ���ъ�� 留�吏�留� 踰��멸� ��泥� 留�吏�留� �レ��蹂대�� ���� �� 
		if(pa.getEndNum() < pa.getLastPage()) {
			pa.setNext(true);
		}
		
		String type = request.getParameter("type");
		if(type == null) {
			type = "";
		}
		
		model.addAttribute("type", type);
		model.addAttribute("paging", pa);
		List<RepairForm> lst = repairFormRepository.findByAll(pa);
		model.addAttribute("list", lst);	
	}
	
	// ��猶곕ぉ濡����� 1媛�留� �댁�댁�� 蹂닿린 //
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
	
	// orderForm���� �대�몄� ��濡��� ���� 硫����� //
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
		
		File newFile = multi.getFile("file");
	
		//업로드 성공!
		if(multi != null) {
			String imgLastName = newFile.getName().substring(newFile.getName().lastIndexOf(".")+1).toUpperCase();
			if(imgLastName.equals("PNG") || imgLastName.equals("JPG")) {
				
			}else {
				if(newFile.exists()) {
					newFile.delete();
				}
			}
		}
		
		
		
	}

	@Override
	public void readCount(RepairForm m) {
		repairFormRepository.increaseCount(m);
	}

	@Override
	public void search(Model model, RepairListPaging pa ,HttpServletRequest request) {
		// ���� 蹂대�� ���댁�瑜� �ㅼ����湲� ���� 珥�湲곌�
				String pageNum = request.getParameter("pageNum");
				if(pageNum == null) {
					pageNum = "1";
				}
				int page = Integer.parseInt(pageNum);
				int count = repairFormRepository.searchCount(pa); // ��泥� 寃���湲� count
				pa.setStartValue((page-1) * pa.getPerPageNum()); // LIMIT ��遺�遺� �ㅼ�� (value, 12)
//				-----------------------------------荑쇰━ �ㅽ�� ����-------------------------------
				pa.setCurrentPage(page); // 珥�湲� ���댁�瑜� 1濡� �ㅼ��
				pa.setLastPage((int) Math.ceil(count / (double) pa.getPerPageNum())); // 留�吏�留� ���댁�濡� 留���
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

	@Override
	public void offer(RepairOffer offer) {
		repairFormRepository.offer(offer);
	}

	@Override
	public List<RepairForm> category(HttpServletRequest request, Model model) {
		int kind = Integer.parseInt(request.getParameter("kind"));   
		if(kind == 7) {
			List<RepairForm> lst = repairFormRepository.categoryRecent(kind);
			return lst;
		}
		if(kind == 8) {
			List<RepairForm> lst = repairFormRepository.categoryPopular(kind);
			return lst;
		} else {
			List<RepairForm> lst = repairFormRepository.category(kind);
			return lst;
		}
	}

	
	
}
