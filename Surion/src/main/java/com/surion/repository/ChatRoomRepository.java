package com.surion.repository;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.websocket.server.PathParam;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.surion.domain.chat.ChatRoom;
import com.surion.domain.chat.Message;
import com.surion.entity.Member;
import com.surion.entity.MemberChatRoomMessageJoin;
import com.surion.entity.OrderFormRepairOfferJoin;

import lombok.Delegate;

@Mapper
public interface ChatRoomRepository {
	
	@Insert("insert into suri_message(message, send_time, room_id, member_id) values(#{message}, #{send_time}, #{room_id}, #{member_id})")
	public void insertMessage(Message message);
	
	@Insert("insert into suri_chatroom(room_id, member_id, mechanic_id) values(#{room_id}, #{member_id}, ${mechanic_id})")
	public int createChatRoom(ChatRoom chatRoom);
	
	@Select("SELECT c.room_id, c.mechanic_id, m.imgurl, s.message, s.send_time, o.shopName"
			+ " FROM suri_member m"
			+ " INNER JOIN suri_chatroom c"
			+ " ON m.id = c.mechanic_id"
			+ " JOIN suri_message s"
			+ " ON s.member_id = c.mechanic_id"
			+ " JOIN suri_orderForm o"
			+ " ON c.mechanic_id = o.id"
			+ " where c.member_id = #{member_id}"
			+ " GROUP BY c.mechanic_id")
	public List<MemberChatRoomMessageJoin> findAllRooms(@Param("member_id") String member_id);

	
	@Select("select * from suri_message where room_id=#{room_id}")
	public List<Message> findRoomById(String roomId);
	
	@Select("select member_id from suri_chatroom where room_id=#{room_id}")
	public List<String> findMemberByRoomId(String roomId);
	
	//채팅방 내 엔지니어 상세정보 받아오는 sql
	@Select("SELECT m.idx, m.imgurl, o.startTime, o.endTime, o.office, o.shopName, o.intro, r.estimate, r.mechanic_id, r.member_id"
			+ " FROM suri_orderForm o"
			+ " INNER JOIN suri_repairOffer r"
			+ " ON r.mechanic_id = o.id"
			+ " JOIN suri_member m"
			+ " ON o.id = m.id"
			+ " WHERE r.member_id = #{member_id}"
			+ " AND r.mechanic_id = #{mechanic_id}")
	public List<OrderFormRepairOfferJoin> findOrderJoinByIds(OrderFormRepairOfferJoin join);

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

}
