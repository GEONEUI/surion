package com.surion.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.surion.entity.Member;
import com.surion.entity.OrderForm;
import com.surion.entity.OrderJoin;
import com.surion.entity.OrderListPaging;


@Mapper
public interface OrderFormRepository {
	//정비사 게시물 폼 저장
	@Insert("insert into suri_orderForm VALUES(#{id}, #{shopName}, #{intro}, #{img}, #{startTime}, #{endTime}, #{experience}, #{category}, #{office}, #{mechanic_id}, 0)")
	public void save(OrderForm orderForm);
	
	@Update("update suri_orderForm set img = #{img} where id = #{id}")
	public void update(OrderForm orderForm);
	
	//정비사 게시물 리스트 
	@Select("select * from suri_orderForm")
	public List<OrderForm> findByAll();
	
	// OrderList 전체 숫자 카운팅
	@Select("select count(*) from suri_orderForm")
	public int findByCount();
	
	// 검색 전체 숫자 카운팅
	@Select("select count(*) from suri_orderForm where shopName LIKE CONCAT ('%',#{keyword},'%')")
	public int searchCount(OrderListPaging pa);
	
	// OrderList 검색
	@Select("select * from suri_orderForm where shopName LIKE CONCAT ('%',#{keyword},'%') LIMIT #{startValue}, #{perPageNum}")
	public List<OrderForm> search(OrderListPaging pa);
	
	// OrderList 조회수 증가
	@Update("update suri_orderForm set readCount = readCount +1 where id = #{id}")
	public void increaseCount(OrderForm orderForm);
	
	//사업자번호 중복검사
	@Select("select count(*) from suri_orderJoin where mechanic_id = #{mechanic_id}")
	public int check(OrderJoin orderJoin);
	//정비사 등록
	@Insert("insert into suri_orderJoin (id, mechanic_id, name, shopName, office) VALUES (#{id}, #{mechanic_id}, #{name}, #{shopName}, #{office})")
	public void join(OrderJoin orderJoin);
	
	@Update("update suri_orderJoin JOIN suri_member sm ON suri_orderJoin.id = sm.id SET suri_orderJoin.email = sm.email, suri_orderJoin.phone = sm.phone, suri_orderJoin.grade = sm.grade")
	public void update1(OrderJoin orderJoin);
	//프로필 상세보기
	@Select("select * from suri_orderForm where id = #{id}")
	public  OrderForm findById(OrderForm orderForm);
	
	@Select("SELECT COUNT(*) from suri_orderForm WHERE id = #{id}")
	public int findByBoard(@Param("id") String id);
	
	@Select("select COUNT(*) from suri_orderJoin where id= #{id}")
	public int findByMechanic(@Param("id") String id);
	
	@Update("UPDATE suri_member SET office = #{office} WHERE id = #{id}")
	public void updateOffice(@Param("id") String id, @Param("office") String office);
	
	@Update("UPDATE suri_orderForm JOIN suri_orderJoin ON suri_orderForm.id = suri_orderJoin.id SET suri_orderForm.mechanic_id = suri_orderJoin.mechanic_id")
	void updateMechanic(OrderForm orderForm);
}

//@Select("select shopName, office from suri_orderJoin where id = #{id}")
//public void findByMechanic(@Param("id") String id);

	//하나의 게시글 데이터를 반환 메서드
	//@Select("select * from suri_orderForm where member_id = #{member_id}")
	//public OrderForm findByBoard(@Param("member_id") String member_id);

