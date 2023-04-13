package com.surion.repository;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import com.surion.entity.RepairForm;

@Mapper
public interface RepairFormRepository{
	
	// 견적 폼 저장
	@Insert("Insert into suri_repairForm VALUES ("
			+ "NULL, 'ff', #{choice1}, #{choice2}, #{deliveryType}, #{data}, #{image}, #{title}, #{content}, #{estimate}, 1);")
	public void save(RepairForm repairForm);
	
	
}
