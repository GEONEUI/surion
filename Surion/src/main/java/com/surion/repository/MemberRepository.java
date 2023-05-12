package com.surion.repository;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.surion.domain.member.Member;

@Mapper
public interface MemberRepository {
	
	//회원가입
	@Insert("INSERT INTO suri_member(idx, Id, PASSWORD, NAME, email) SELECT IFNULL(MAX(idx)+1, 1), #{id}, #{password}, #{name}, #{email} FROM suri_member")
	public void save(Member m);
	
	//로그인
	@Select("select * from suri_member where id = #{id} AND password = #{password}")
	public Member login(Member m);
	
	//로그인한 회원 정보 불러오기
	@Select("SELECT e1.id, e1.password, e1.email, e1.address, e1.phone, e1.grade, e1.imgurl, e2.name, e2.shopName, e2.office "
			+ "FROM suri_member e1, suri_orderJoin e2 "
			+ "WHERE e1.id = e2.id AND e1.id = #{id}")
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
