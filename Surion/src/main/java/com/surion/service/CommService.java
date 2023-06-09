package com.surion.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.surion.entity.CommunCriteria;
import com.surion.entity.Community;
import com.surion.entity.CommunityReply;


public interface CommService {
	//커뮤니티 메인페이지
	public void board(Model model, CommunCriteria cri);
	//글 작성
	public String register(HttpServletRequest request, RedirectAttributes rttr);
	//하나을 게시글 보기
	public void getOneBoard(@Param("idx") int idx, Model model);
	//댓글보기
	public List<CommunityReply> findReply(int idx);
	//게시글 삭제하기
	public void ReplyDelete(CommunityReply communityReply);
	//댓글가져오기
	public void saveReply(CommunityReply communityReply);
	//댓글삭제하기
	public void deleteBoard(@Param("idx") int idx);
	//게시글 한개 가져오기
	public void update(int idx, Model model);
	//게시글 업데이트
	public String update(HttpServletRequest request, RedirectAttributes rttr);
}
