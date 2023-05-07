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
import com.surion.entity.Community;
import com.surion.entity.CommunityReply;
import com.surion.entity.Member;
import com.surion.repository.CommRepository;

@Service
public class CommServiceImpl implements CommService{

	
	@Autowired
	private CommRepository commRepository;
	
	@Override
	public List<Community> listAll() {
		// TODO Auto-generated method stub
		return null;
	}

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
		String comm_list = multi.getParameter("comm_list");
		String title = multi.getParameter("title");
		String suri_list = multi.getParameter("suri_list");
		String content = multi.getParameter("content");
		String fileName = newFile.getName();
		String id = multi.getParameter("id");
		
		System.out.println("content ----- > " + content);
		
		
		
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
		
		
		Community community = new Community();
		community.setComm_list(comm_list);
		community.setTitle(title);
		community.setSuri_list(suri_list);
		community.setContent(content);
		community.setImg(fileName);
		community.setId(id);
		
		
		commRepository.save(community);
		System.out.println(community.getSuri_list() + "수리리스트 확인");
		
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

	@Override
	public void saveReply(CommunityReply communityReply) {
		commRepository.saveReply(communityReply);
	}

	@Override
	public void ReplyDelete(CommunityReply communityReply) {
		commRepository.deleteReply(communityReply);
	}

	@Override
	public void deleteBoard(int idx) {
		commRepository.deleteBoard(idx);
	}




}
