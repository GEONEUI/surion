package com.surion.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.surion.entity.OrderForm;
import com.surion.entity.OrderJoin;


@Mapper
public interface OrderFormRepository {
	//정비사 게시물 폼 저장
	@Insert("insert into suri_orderForm VALUES(#{id}, #{shopName}, #{intro}, #{img}, #{startTime}, #{endTime}, #{experience}, #{category}, #{office}, #{mechanic_id})")
	public void save(OrderForm orderForm);
	
	@Update("update suri_orderForm set img = #{img} where id = #{id}")
	public void update(OrderForm orderForm);
	
	//정비사 게시물 리스트 
	@Select("select * from suri_orderForm")
	public List<OrderForm> findByAll();
	//사업자번호 중복검사
	@Select("select count(*) from suri_orderJoin where mechanic_id = #{mechanic_id}")
	public int check(OrderJoin orderJoin);

	@Insert("insert into suri_orderJoin (id, mechanic_id, name, shopName, office) VALUES (#{id}, #{mechanic_id}, #{name}, #{shopName}, #{office})")
	public void join(OrderJoin orderJoin);
	
	@Update("update suri_orderJoin JOIN suri_member sm ON suri_orderJoin.id = sm.id SET suri_orderJoin.email = sm.email, suri_orderJoin.phone = sm.phone, suri_orderJoin.grade = sm.grade")
	public void update1(OrderJoin orderJoin);
	
	@Select("select count(*) from suri_orderJoin where id = #{id}")
	public int findByMechanic(@Param("id") String id);
	
}
	
	//하나의 게시글 데이터를 반환 메서드
	//@Select("select * from suri_orderForm where member_id = #{member_id}")
	//public OrderForm findByBoard(@Param("member_id") String member_id);

