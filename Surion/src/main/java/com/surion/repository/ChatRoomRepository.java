package com.surion.repository;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.websocket.server.PathParam;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.surion.domain.chat.ChatRoom;
import com.surion.domain.chat.Message;
import com.surion.entity.OrderFormRepairOfferJoin;

@Mapper
public interface ChatRoomRepository {
	
	@Insert("insert into suri_message(message, send_time, room_id, member_id) values(#{message}, #{send_time}, #{room_id}, #{member_id})")
	public void insertMessage(Message message);
	
	@Insert("insert into suri_chatroom(room_id, member_id) values(#{room_id}, #{member_id})")
	public int createChatRoom(ChatRoom chatRoom);
	
	@Select("select * from suri_chatroom where member_id=#{member_id}")
	public List<ChatRoom> findAllRooms(@Param("member_id") String memberId);
	
	@Select("select * from suri_message where room_id=#{room_id}")
	public List<Message> findRoomById(String roomId);
	
	@Select("select member_id from suri_chatroom where room_id=#{room_id}")
	public List<String> findMemberByRoomId(String roomId);
	
	//채팅방 내 엔지니어 상세정보 받아오는 sql
	@Select("SELECT o.startTime, o.endTime, o.office, o.shopName, o.intro, r.estimate, r.mechanic_id"
			+ "FROM suri_orderForm"
			+ "INNER JOIN suri_repairOffer"
			+ "ON r.mechanic_id = o.mechanic_id"
			+ "WHERE r.member_id = #{member_id}"
			+ "AND r.mechanic_id = #{mechanic_id}")
	public List<OrderFormRepairOfferJoin> findOrderJoinByIds(OrderFormRepairOfferJoin join);

	//채팅 리스트용 엔지니어 상세정보
	@Select("SELECT o.startTime, o.endTime, o.office, o.shopName, o.intro, r.estimate, r.mechanic_id"
			+ "FROM suri_orderForm"
			+ "INNER JOIN suri_repairOffer"
			+ "ON r.mechanic_id = o.mechanic_id"
			+ "WHERE r.member_id = #{member_id}")
	public List<OrderFormRepairOfferJoin> findOrderJoinByMemberId(OrderFormRepairOfferJoin join);
	

}
