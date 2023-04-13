package com.surion.repository;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.surion.entity.Member;

@Mapper
public interface MemberRepository {
	
	//회원가입
	@Insert("INSERT INTO suri_member(idx, Id, PASSWORD, NAME, email) SELECT IFNULL(MAX(idx)+1, 1), #{id}, #{password}, #{name}, #{email} FROM suri_member")
	public void save(Member m);
	
	//로그인
	@Select("select * from suri_member where Id = #{id} and password = #{password}")
	public Member findById(Member m);
	
	//증복확인
	@Select("select count(*) from suri_member where Id = #{id}")
	public int check(Member m);
	
	//정보찾기
	@Select("select * from suri_member where Id = #{id}")
	public Member findByUser(@Param("id") String id);
	
	//프로필 업데이트
	@Update("update suri_member set name = #{name}, email = #{email}, password = #{password}, address = #{address}, phone = #{phone}, imgurl = #{imgurl} where Id = #{id}")
	public void updateProfile(Member m);
	

}
