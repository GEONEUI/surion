package com.surion.repository;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.surion.entity.Member;

@Mapper
public interface MemberRepository {
	
	//회원가입
	@Insert("INSERT INTO suri_member(idx, Id, PASSWORD, NAME, email) SELECT IFNULL(MAX(idx)+1, 1), #{id}, #{password}, #{name}, #{email} FROM suri_member")
	public void save(Member m);
	
	//로그인
	@Select("select * from suri_member where Id = #{id} and password = #{password}")
	public Member findById(Member m);
	
	//
	

}
