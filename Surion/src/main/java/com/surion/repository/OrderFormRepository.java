package com.surion.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.surion.domain.review.Review;
import com.surion.entity.Criteria;
import com.surion.entity.OrderForm;
import com.surion.entity.OrderJoin;


@Mapper
public interface OrderFormRepository {
	//정비사 게시물 폼 저장
	@Insert("insert into suri_orderForm VALUES(null, #{id}, #{shopName}, #{intro}, #{img}, #{startTime}, #{endTime}, #{experience}, #{category}, #{office}, #{mechanic_id}, 0)")
	public void save(OrderForm orderForm);
	//정비사로 등급변환
	@Update("UPDATE suri_member SET roll = 'engineer' WHERE id = #{id}")
	public void rollUpdate(OrderForm orderForm);
	
	@Update("update suri_orderForm set img = #{img} where id = #{id}")
	public void update(OrderForm orderForm);
	
	//정비사 게시물 리스트 
	@Select("select * from suri_orderForm order by idx asc limit #{startValue}, #{endValue}")
	public List<OrderForm> findByAll(Criteria cri);
	
	// OrderList 전체 숫자 카운팅
	@Select("select count(*) from suri_orderForm")
	public int findByCount();
	
	// 검색 전체 숫자 카운팅
	@Select("select count(*) from suri_orderForm where shopName LIKE CONCAT ('%',#{keyword},'%')")
	public int searchCount(Criteria cri);
	
	//OrderList 검색
	@Select("select * from suri_orderForm where shopName LIKE CONCAT ('%',#{keyword},'%') LIMIT #{startValue}, #{endValue}")
	public List<OrderForm> search(Criteria cri);
	
	// OrderList 조회수 증가
	@Update("update suri_orderForm set readCount = readCount +1 where id = #{id}")
	public void increaseCount(OrderForm orderForm);
	
	//사업자번호 중복검사
	@Select("select count(*) from suri_mechanic where mechanic_id = #{mechanic_id}")
	public int check(OrderJoin orderJoin);
	
	//정비사 등록
	@Insert("insert into suri_mechanic (id, mechanic_id, name, shopName, office) VALUES (#{id}, #{mechanic_id}, #{name}, #{shopName}, #{office})")
	public void join(OrderJoin orderJoin);
	
	//정비사등록시 남은정보 멤버테이블에서 가져오기
	@Update("update suri_mechanic JOIN suri_member sm ON suri_mechanic.id = sm.id SET suri_mechanic.email = sm.email, suri_mechanic.phone = sm.phone, suri_mechanic.grade = sm.grade")
	public void update1(OrderJoin orderJoin);
	
	//프로필 상세보기
	@Select("select * from suri_orderForm where id = #{id}")
	public  OrderForm findById(@Param("id")String id);
	
	//게시물 등록했는지 확인
	@Select("SELECT COUNT(*) from suri_orderForm WHERE id = #{id}")
	public int findByBoard(@Param("id") String id);
	
	//정비사 등록했는지 확인
	@Select("select COUNT(*) from suri_mechanic where id= #{id}")
	public int findByMechanic(@Param("id") String id);
	
	//정비사 등록시 멤버테이블 office에 값전달
	@Update("UPDATE suri_member SET office = #{office} WHERE id = #{id}")
	public void updateOffice(@Param("id") String id, @Param("office") String office);
	
	//프로필 등록시 order_Join테이블에서 mechanic_id가져오기
	@Update("UPDATE suri_orderForm JOIN suri_mechanic ON suri_orderForm.id = suri_mechanic.id SET suri_orderForm.mechanic_id = suri_mechanic.mechanic_id")
	void updateMechanic(OrderForm orderForm);
	
	//프로필 업데이트
	@Update("update suri_orderForm set shopName = #{shopName}, mechanic_id = #{mechanic_id}, intro = #{intro}, office = #{office}, startTime = #{startTime}, endTime = #{endTime}, img = #{img} where id = #{id}")
	public void updateOrder(OrderForm orderForm);
	
	// 프로필 삭제
	@Delete("delete from suri_orderForm where mechanic_id = #{mechanic_id}")
	public void deleteOrder(OrderForm orderForm);
	
	//Ajax Sql ----------------------------------
	
	// Ajax로 카테고리 선택
	@Select("select * from suri_orderForm where category = #{kind}")
	public List<OrderForm> category(String kind); 
	// 최신순
	@Select("select * from suri_orderForm order by idx desc")
	public List<OrderForm> categoryRecent(); 
	// 인기순
	@Select("select * from suri_orderForm order by readCount desc")
	public List<OrderForm> categoryPopular(); 
	
	@Select("SELECT * FROM tsuri_review WHERE mechanic_id = #{id}")
	public List<Review> findAllReview(@Param("id") String id);
	
}



