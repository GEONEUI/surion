package com.surion.repository;

import java.util.List;

import javax.servlet.http.HttpServlet;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.surion.entity.Community;
import com.surion.entity.CommunityReply;
import com.surion.entity.Member;

@Mapper
public interface CommRepository{
	
	@Select("select * from suri_board order by idx DESC")
	public List<Community> listAll();
	
	@Insert("INSERT INTO suri_board(idx, id, title, content, img, suri_list, comm_list) select IFNULL(MAX(idx)+1,1),"
			+ " #{id}, #{title}, #{content}, #{img}, #{suri_list}, #{comm_list} FROM suri_board")
	public void save(Community community);
	
	//하나의 게시글 가져오기
	@Select("select * from suri_board where idx = #{idx}")
	public Community findByBoard(@Param("idx") int idx);
	
	//게시글 주인의 정보를 가져오기
	@Select("select * from suri_member where id = #{id}")
	public Member findById(Community id);
	
	//게시글 조회수 업데이트
	@Update("update suri_board set readcount = readcount + 1 where idx = #{idx}")
	public void updateBoard(@Param("idx") int idx);
	
	//게시글 삭제하기
	@Delete("delete from suri_board where idx = #{idx}")
	public void deleteBoard(@Param("idx") int idx);
	
	//댓글 불러오기
	@Select("SELECT e2.num, e2.id, e2.context, e2.indate, e1.imgurl as img FROM suri_member e1, suri_communityReply e2 WHERE e1.id = e2.id AND e2.idx = #{idx}")
	public List<CommunityReply> findReply(@Param("idx")int idx);
	
	//댓글 입력하기
	@Insert("INSERT INTO suri_communityReply(idx, id, context) VALUES(#{idx}, #{id}, #{context})")
	public void	saveReply(CommunityReply communityReply);
	
	//댓글 삭제하기
	@Delete("delete from suri_communityReply where num = ${num}")
	public void deleteReply(CommunityReply communityReply);
	

	
}
