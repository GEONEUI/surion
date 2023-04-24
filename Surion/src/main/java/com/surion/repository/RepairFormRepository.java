package com.surion.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.ui.Model;

import com.surion.entity.RepairForm;
import com.surion.entity.RepairListPaging;

@Mapper
public interface RepairFormRepository{
	
	// 견적 폼 저장
	@Insert("Insert into suri_repairForm VALUES ("
			+ "NULL, 'ff', #{choice1}, #{choice2}, #{deliveryType}, #{date}, #{image}, #{title}, #{content}, #{estimate}, 1);")
	public void save(RepairForm m);

	// RepairList 페이징하여 뿌리기
	@Select("select * from suri_repairForm LIMIT #{startValue}, #{perPageNum}")
	public List<RepairForm> findByAll(RepairListPaging pa);
	
	// RepairList 전체 숫자 카운팅
	@Select("select count(*) from suri_repairForm")
	public int findByCount();
	
	// RepairDetail 상세보기
	@Select("select * from suri_repairForm where idx = #{idx}")
	public RepairForm findById(RepairForm m);
	
	// RepairList 조회수
	@Update("update suri_repairForm set readCount = readCount +1 where idx = #{idx}")
	public void increaseCount(RepairForm m);
	
	// RepairList 검색
	@Select("select * from suri_repairForm where title like '%#{keyword}%'")
	public List<RepairForm> search(String keyword);
}
