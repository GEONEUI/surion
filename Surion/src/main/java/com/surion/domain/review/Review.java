package com.surion.domain.review;

import com.surion.domain.member.Mechanic;
import com.surion.domain.member.Member;
import com.surion.domain.order.Order;
import com.surion.domain.repair.Repair;
import lombok.Getter;
import lombok.Setter;
import org.apache.ibatis.annotations.One;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.*;
import java.time.LocalDateTime;

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
    private int point;
    private String content;

    private String attachedPhotoIds;

    private String placeId;
    private String userId;

    @CreationTimestamp
    private LocalDateTime createTime;


    @UpdateTimestamp
    private LocalDateTime updateTime;

    private LocalDateTime deleteTime;

    private int isDelete;


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
