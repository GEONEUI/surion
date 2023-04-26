package com.surion.domain.review;

import com.surion.domain.member.Mechanic;
import com.surion.domain.member.Member;
import com.surion.domain.order.Order;
import com.surion.domain.repair.Repair;
import lombok.Getter;
import lombok.Setter;
import org.apache.ibatis.annotations.One;

import javax.persistence.*;

@Entity
@Getter
@Setter
@Table(name="Tsuri_review")
public class Review {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "review_id")
    private Long id;
    private String name;
    private String score;
    private String content;

    @Enumerated(EnumType.STRING)
    private ReviewStatus reviewStatus;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "mechanic_id")
    private Mechanic mechanic;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "member_id" )
    private Member member;

    @OneToOne(mappedBy = "review", fetch = FetchType.LAZY)
    private Order order;

    @OneToOne(mappedBy = "review", fetch = FetchType.LAZY)
    private Repair repair;

}
