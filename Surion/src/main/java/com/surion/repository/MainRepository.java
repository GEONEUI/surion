package com.surion.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.surion.entity.Community;
import com.surion.entity.Popular;

@Mapper
public interface MainRepository {
	//카테고리 조회수별로 가져오기
	@Select("SELECT choice1 AS category, count(choice1)AS count from suri_repairForm GROUP BY choice1 ORDER BY count(choice1) desc")
	public List<Popular> findPopular(Popular popular);
	//커뮤니티 조회수별로 가져오기
	@Select("SELECT * FROM suri_board ORDER BY readcount desc")
	public List<Community> findBoardAll();
	
}
