package com.surion.service;

import com.surion.domain.member.Grade;
import com.surion.domain.member.Member;
import com.surion.domain.order.Order;
import com.surion.domain.repair.RepairItem;
import com.surion.domain.review.Review;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;


@SpringBootTest
class MemberServiceTest {
    @Autowired
    MemberService memberService;
    @Autowired
    EntityManager entityManager;

    @Test
    @Transactional
    void save() {
        List<Member> members = new ArrayList<>();

        for (int i = 0; i < 30; i++) {
            Member member = new Member();
            member.setId("member" + i);
            member.setPassword("password" + i);
            member.setName("name" + i);
            member.setEmail("email" + i + "@example.com");
            member.setAddress("address" + i);
            member.setPhone("phone" + i);
            member.setImgurl("imgurl" + i);
            member.setGrade(1);
            member.setPoint(0);

            // 연관된 Review 객체 생성
            Review review = new Review();
            review.setContent("Review Content " + i);
            review.setScore(5);
            review.setMember(member);

            // 연관된 Order 객체 생성
            Order order = new Order();
            order.setId((long) i);
            order.setMember(member);

            // 연관된 RepairItem 객체 생성
            RepairItem repairItem = new RepairItem();
            repairItem.setId((long) i);
            repairItem.setMember(member);

            member.setReviews(Collections.singletonList(review));
            member.setOrders(Collections.singletonList(order));
            member.setRepairItems(Collections.singletonList(repairItem));
            members.add(member);
        }
    }
}