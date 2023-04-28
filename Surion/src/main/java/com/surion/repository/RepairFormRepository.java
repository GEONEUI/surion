package com.surion.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.ui.Model;

import com.surion.entity.RepairForm;
import com.surion.entity.RepairListPaging;

import lombok.Delegate;

@Mapper
public interface RepairFormRepository{
	
	// 견적 폼 저장
	@Insert("Insert into suri_repairForm VALUES ("
			+ " 'NULL', #{member_id}, #{choice1}, #{choice2}, #{deliveryType}, "
			+ "#{date}, #{image}, #{title}, #{content}, #{estimate}, #{itemcategory_id}, 0)")
	public void save(RepairForm m);

	// RepairList 페이징하여 뿌리기
	@Select("select * from suri_repairForm order by idx desc LIMIT #{startValue}, #{perPageNum}")
	public List<RepairForm> findByAll(RepairListPaging pa);
	
	// RepairList 전체 숫자 카운팅
	@Select("select count(*) from suri_repairForm")
	public int findByCount();
	
	// RepairDetail 상세보기
	@Select("select * from suri_repairForm where idx = #{idx}")
	public RepairForm findById(RepairForm m);
	
	// RepairList 조회수 증가
	@Update("update suri_repairForm set readCount = readCount +1 where idx = #{idx}")
	public void increaseCount(RepairForm m);
	
	// RepairList 검색
	@Select("select * from suri_repairForm where title LIKE CONCAT ('%',#{keyword},'%') LIMIT #{startValue}, #{perPageNum}")
	public List<RepairForm> search(RepairListPaging pa);
	
	// 검색 전체 숫자 카운팅
	@Select("select count(*) from suri_repairForm where title LIKE CONCAT ('%',#{keyword},'%')")
	public int searchCount(RepairListPaging pa);
	
	
	//마이페이지용 검색
	@Select("select * from suri_repairForm where member_id = #{member_id}")
	public List<RepairForm> findByMemberId(@Param("member_id") String id);
	
	//마이페이지용 수정
	@Update("update suri_repairForm set image = #{image}, title = #{title}, "
			+ "content = #{content}, estimate=#{estimate} where idx = #{idx}")
	public void updateRepair(RepairForm repairForm);
	
	//삭제
	@Delete("delete from suri_repairForm where idx = #{idx}")
	public void deleteRepair(RepairForm form);
}
