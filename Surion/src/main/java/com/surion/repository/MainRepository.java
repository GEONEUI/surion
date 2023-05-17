package com.surion.repository;

import java.util.List;

import com.surion.domain.review.Review;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.surion.entity.Community;
import com.surion.entity.Popular;

@Mapper
public interface MainRepository {
	@Select("SELECT choice1 AS category, count(choice1)AS count from suri_repairForm GROUP BY choice1 ORDER BY count(choice1) desc")
	public List<Popular> findPopular(Popular popular);
	@Select("SELECT * FROM suri_board ORDER BY readcount desc")
	public List<Community> findBoardAll();
	@Select("SELECT * FROM tsuri_review WHERE member_id = #{member_id} AND mechanic_id = #{mechanic_id}")
	public Review findReview(@Param("member_id")String member_id, @Param("mechanic_id")String mechanic_id);
}
