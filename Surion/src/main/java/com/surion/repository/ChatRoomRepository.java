package com.surion.repository;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.websocket.server.PathParam;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.hibernate.annotations.Parent;

import com.surion.domain.chat.ChatRoom;
import com.surion.domain.chat.Message;
import com.surion.entity.Member;
import com.surion.entity.MemberChatRoomMessageJoin;
import com.surion.entity.MessageAndSendTime;
import com.surion.entity.OrderFormRepairOfferJoin;
import com.surion.entity.OrderRoomMemberJoin;

import lombok.Delegate;

@Mapper
public interface ChatRoomRepository {
	
	@Insert("insert into suri_message(message, send_time, room_id, member_id) values(#{message}, #{send_time}, #{room_id}, #{member_id})")
	public void insertMessage(Message message);
	
	@Insert("insert into suri_chatroom(room_id, member_id, othermem_id) values(#{room_id}, #{member_id}, #{othermem_id})")
	public int createChatRoom(ChatRoom chatRoom);
	
	//채팅목록정보
	@Select("SELECT c.room_id, c.othermem_id, m.imgurl, s.message, s.send_time, m.roll"
			+ " FROM suri_chatroom c"
			+ " JOIN suri_member m "
			+ " ON m.id = c.othermem_id"
			+ " JOIN suri_message s"
			+ " ON s.member_id = c.othermem_id"
			+ " WHERE c.member_id = #{member_id}"
			+ " GROUP BY c.othermem_id"
			+ " ORDER BY s.message DESC")
	public List<MemberChatRoomMessageJoin> findAllRooms(@Param("member_id") String memberId);
	
	
	//신규채팅방용 조인 조건 맞추기
	@Insert("INSERT INTO suri_message(member_id) VALUES (#{member_id})")
	public void fakeInsertMsg(@Param("member_id") String memberId);
	
	@Select("SELECT shopName from suri_orderForm where id = #{othermem_id}")
	public String findShopNameByid(MemberChatRoomMessageJoin join);

	//채팅목록 최신 대화내용
	@Select("SELECT message, send_time"
			+ " FROM suri_message"
			+ " WHERE room_id = #{room_id}"
			+ " ORDER BY id DESC"
			+ " LIMIT 1")
	public MessageAndSendTime findMessageByRoomId(@Param("room_id") String room_id);
	
	@Select("select * from suri_message where room_id=#{room_id}")
	public List<Message> findRoomById(String roomId);
	
	@Select("select member_id from suri_chatroom where room_id=#{room_id}")
	public List<String> findMemberByRoomId(String roomId);
	
	//채팅방 내 엔지니어 상세정보
	@Select("SELECT DISTINCT c.othermem_id, c.room_id, c.state, m.imgurl, o.startTime, o.endTime, o.office, o.shopName, o.intro"
			+ " FROM suri_orderForm o"
			+ " INNER JOIN suri_chatroom c"
			+ " ON c.othermem_id = o.id"
			+ " JOIN suri_member m"
			+ " ON o.id = m.id"
			+ " WHERE c.othermem_id = #{othermem_id}"
			+ " AND c.member_id = #{member_id}")
	public OrderRoomMemberJoin findOrderJoinByIds(@Param("othermem_id") String othermem_id,@Param("member_id") String memberId);

	@Select("SELECT DISTINCT state from suri_chatroom where member_id = #{member_id} and othermem_id = #{othermem_id}")
	public String findStateById(@Param("member_id") String memberId, @Param("othermem_id") String othermemId);
	
	//내가 받은견적 리스트용 엔지니어 상세정보
	@Select("SELECT m.idx, m.imgurl, o.startTime, o.endTime, o.office, o.shopName, o.intro, r.estimate, r.mechanic_id, r.member_id"
			+ " FROM suri_orderForm o"
			+ " INNER JOIN suri_repairOffer r"
			+ " ON r.mechanic_id = o.id"
			+ " JOIN suri_member m"
			+ " ON o.id = m.id"
			+ " WHERE r.member_id = #{id}")
	public List<OrderFormRepairOfferJoin> findOrderJoinByMemberId(Member member);
	
	@Delete("delete from suri_repairOffer where member_id = #{id}")
	public int deleteOfferListByMemberId(Member member);

	//거래완료 버튼 클릭 후 state = 거래완료로 변환
	@Update("update suri_chatroom set state = #{state} where room_id = #{room_id} and member_id = #{member_id}")
	public void stateUpdate(ChatRoom chatRoom);
	
	@Select("select state from suri_chatroom where member_id = #{othermem_id} and room_id = #{room_id}")
	public String checkState(ChatRoom chatRoom);
	
	
}
