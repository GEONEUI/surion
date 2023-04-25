package com.surion.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.ui.Model;

import com.surion.entity.RepairForm;

@Mapper
public interface RepairFormRepository{
	
	// 견적 폼 저장
	@Insert("Insert into suri_repairForm VALUES ("
			+ "NULL, 'ff', #{choice1}, #{choice2}, #{deliveryType}, #{date}, #{image}, #{title}, #{content}, #{estimate}, 1);")
	public void save(RepairForm repairForm);

	@Select("select * from suri_repairForm")
	public List<RepairForm> findByAll();
	
	@Select("select * from suri_repairForm where idx = #{idx}")
	public RepairForm findById(RepairForm m);
}
