package com.surion.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.surion.entity.OrderForm;
import com.surion.entity.OrderJoin;


@Mapper
public interface OrderFormRepository {
	//정비사 게시물 폼 저장
	@Insert("insert into suri_orderForm VALUES(#{member_id}, #{shopName}, #{intro}, #{img}, #{startTime}, #{endTime}, #{experience}, #{category}, #{address}, #{mechanic_id})")
	public void save(OrderForm orderForm);
	
	@Update("update suri_orderForm set img = #{img} where member_id = #{member_id}")
	public void update(OrderForm orderForm);
	
	//정비사 게시물 리스트 
	@Select("select * from suri_orderForm")
	public List<OrderForm> findByAll();
	//사업자번호 중복검사
	@Select("select count(*) from suri_orderJoin where mechanic_id = #{mechanic_id}")
	public int check(OrderJoin orderJoin);

	@Insert("insert into suri_orderJoin (member_id, mechanic_id, name, shopName, address) VALUES ('aa', #{mechanic_id},#{name}, #{shopName}, #{address})")
	public void join(OrderJoin orderJoin);
	//정비사 등록시 suri_member테이블의 값을 가져옴
//	@Update("UPDATE suri_orderJoin JOIN suri_member sm ON #{oj.member_id} = #{sm.id} SET #{oj.email} = #{sm.email}, #{oj.phone} = #{sm.phone}, #{oj.grade} = #{sm.grade}")
//	public void update(OrderJoin orderJoin);
}

	
	//하나의 게시글 데이터를 반환 메서드
	//@Select("select * from suri_orderForm where member_id = #{member_id}")
	//public OrderForm findByBoard(@Param("member_id") String member_id);

