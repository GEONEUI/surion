package com.surion.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.surion.entity.Community;

@Mapper
public interface CommRepository{
	@Select("select * from suri_board")
	public List<Community> listAll();
	
	@Insert("INSERT INTO suri_board(idx, id, title, content, loc, suri_list, comm_list) select IFNULL(MAX(idx)+1,1),"
			+ "#{id}, #{title}, #{content}, #{loc},#{suri_list}, #{comm_list} FROM suri_board")
	public void save(Community community);
}
