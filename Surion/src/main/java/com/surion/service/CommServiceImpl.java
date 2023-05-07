package com.surion.service;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.surion.entity.CommunCriteria;
import com.surion.entity.CommunPageMaker;
import com.surion.entity.Community;
import com.surion.entity.CommunityReply;
import com.surion.entity.Member;
import com.surion.repository.CommRepository;

@Service
public class CommServiceImpl implements CommService{

	
	@Autowired
	private CommRepository commRepository;


	@Override
	public String register(HttpServletRequest request, RedirectAttributes rttr) {
		
		int maxSize = 1024 * 1024 * 5; //5mb 조정
		String save = request.getRealPath("/resources/communityImages");
		
		MultipartRequest multi = null;
		
		
		
		try {
			multi = new MultipartRequest(request, save, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	
		File newFile = multi.getFile("img");
		if(newFile == null) {
			newFile = new File("");
		}
		
		String comm_list = multi.getParameter("comm_list");
		String title = multi.getParameter("title");
		String suri_list = multi.getParameter("suri_list");
		String content = multi.getParameter("content");
		String fileName = newFile.getName();
		String id = multi.getParameter("id");
		
		
		Community community = new Community();
		community.setComm_list(comm_list);
		community.setTitle(title);
		community.setSuri_list(suri_list);
		community.setContent(content);
		community.setImg(fileName);
		community.setId(id);
		
		System.out.println(community);
		
		if(comm_list.equals("") || comm_list == "" ||
		   title.equals("") || title == "" ||
		   suri_list.equals("") || suri_list == "" ||
		   content.equals("") || content == "") {
			rttr.addFlashAttribute("msg", "모든 항목을 선택해주세요. (공백은 불가능합니다)");
			rttr.addFlashAttribute("community", community);
			return "redirect:/community/write";
		}
			
		

		//업로드 성공!
		if(multi != null) {
			String imgLastName = newFile.getName().substring(newFile.getName().lastIndexOf(".")+1).toUpperCase();
			if(imgLastName.equals("PNG") || imgLastName.equals("JPG")) {
				
			}else {
				if(newFile.exists()) {
					newFile.delete();
					rttr.addFlashAttribute("msg", "이미지파일은 PNG, JPG만 가능합니다.");
					return "redirect:/community/write";
				}
			}
		}
		
		

		
		
		commRepository.save(community);
		

		
		rttr.addFlashAttribute("msg", "글작성이 완료되었습니다.");
		return "redirect:/community/board";
		
		
		
		
		
	}


	@Override
	public void getOneBoard(@Param("idx") int idx, Model model) {
		Community community = commRepository.findByBoard(idx);
		Member originMember = commRepository.findById(community);
		commRepository.updateBoard(idx);
		System.out.println("게시글 주인의 정보" + originMember);
		//해당 게시글의정보
		model.addAttribute("community", community);
		//해당 게시글의 정보에 이미지정보가없어서 글 쓴이의 정보를 따로가져옴
		model.addAttribute("originMember", originMember);
	}

	@Override
	public List<CommunityReply> findReply(int idx) {
		List<CommunityReply> lst =  commRepository.findReply(idx);
		return lst;
	}

	
	//댓글 작성하기
	@Override
	public void saveReply(CommunityReply communityReply) {
		commRepository.saveReply(communityReply);
	}

	
	//댓글 삭제하기
	@Override
	public void ReplyDelete(CommunityReply communityReply) {
		commRepository.deleteReply(communityReply);
	}

	
	//게시글 삭제하기
	@Override
	public void deleteBoard(int idx) {
		commRepository.deleteBoard(idx);
	}

	@Override
	public void update(int idx, Model model) {
		Community comm = commRepository.finyOneBoard(idx);
		model.addAttribute("comm", comm);
	}

	//게시글 업데이트
	@Override
	public String update(HttpServletRequest request, RedirectAttributes rttr) {
		
		int maxSize = 1024 * 1024 * 5; //5mb 조정
		String save = request.getRealPath("/resources/communityImages");
		
		MultipartRequest multi = null;
		
		
		try {
			multi = new MultipartRequest(request, save, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		
		File newFile = multi.getFile("img");
		
		if(newFile == null) {
			newFile = new File("");
		}
		
		String comm_list = multi.getParameter("comm_list");
		String title = multi.getParameter("title");
		String suri_list = multi.getParameter("suri_list");
		String content = multi.getParameter("content");
		String fileName = newFile.getName();
		String id = multi.getParameter("id");
		int idx = Integer.parseInt(multi.getParameter("idx"));
		
		
		Community community = new Community();
		community.setComm_list(comm_list);
		community.setTitle(title);
		community.setSuri_list(suri_list);
		community.setContent(content);
		community.setImg(fileName);
		community.setId(id);
		community.setIdx(idx);
		
		System.out.println(community);
		
		if(comm_list.equals("") || comm_list == "" ||
		   title.equals("") || title == "" ||
		   suri_list.equals("") || suri_list == "" ||
		   content.equals("") || content == "") {
			rttr.addFlashAttribute("msg", "모든 항목을 선택해주세요. (공백은 불가능합니다)");
			rttr.addFlashAttribute("community", community);
			return "redirect:/community/update?idx=" + community.getIdx();
		}
		
	
		
		
		//업로드 성공!
		if(multi != null) {
			String imgLastName = newFile.getName().substring(newFile.getName().lastIndexOf(".")+1).toUpperCase();
			if(imgLastName.equals("PNG") || imgLastName.equals("JPG")) {
				
			}else {
				if(newFile.exists()) {
					newFile.delete();
					rttr.addFlashAttribute("msg", "이미지파일은 PNG, JPG만 가능합니다.");
					return "redirect:/community/write";
				}
			}
		}
		
	
	
		commRepository.update(community);
		
		rttr.addFlashAttribute("msg", "업데이트가 완료되었습니다.");
		
		return "redirect:/community/board";
		
	}

	
	//보드 메인페이지
	@Override
	public void board(Model model, CommunCriteria cri) {
		List<Community> lst = commRepository.listAll(cri);
		CommunPageMaker pageMaker = new CommunPageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(commRepository.boardTotalCount());
		
		
		model.addAttribute("lst", lst);
		model.addAttribute("pageMaker", pageMaker);
	}






}
