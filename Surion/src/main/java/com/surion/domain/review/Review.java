package com.surion.domain.review;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.surion.domain.Image.Photo;
import com.surion.domain.mechanic.Mechanic;
import com.surion.domain.member.Member;
import com.surion.domain.order.Order;
import com.surion.domain.repair.Repair;
import com.surion.service.MechanicService;
import com.surion.service.MemberService;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@Entity
@Table(name="Tsuri_review")
public class Review
//        extends BaseTimeEntity
{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "review_id")
    private Long id;
    private String name;
    private Integer score;
    private String content;

    @CreationTimestamp
    @Column(name="creat_time")
    private LocalDateTime createdAt;
    @UpdateTimestamp
    @Column(name="modified")
    private LocalDateTime updateAt;

    @Column(name="delete_time")
    private LocalDateTime deleteAt;

    private int isDelete;


    @OneToMany(
            mappedBy = "review",
            cascade = {CascadeType.PERSIST, CascadeType.REMOVE},
            orphanRemoval = true
    )
    private List<Photo> photo = new ArrayList<>();

    @Enumerated(EnumType.STRING)
    private ReviewStatus reviewStatus;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "mechanic_id", referencedColumnName = "mechanic_id")
    private Mechanic mechanic;

    @ManyToOne(cascade = CascadeType.MERGE, targetEntity = Member.class)
    @JoinColumn(name = "member_id", referencedColumnName = "member_id", updatable = false)
    @JsonBackReference
    private Member member;

    @OneToOne(mappedBy = "review", fetch = FetchType.LAZY)
    private Order order;

    @OneToOne(mappedBy = "review", fetch = FetchType.LAZY)
    private Repair repair;


    public Review(){};
    @Builder
    public Review(Member member, Mechanic mechanic, String content, int score) {
        this.member = member;
        this.mechanic = mechanic;
        this.content = content;
        this.score = score;
    }

    public void update(int score,String content) {
        this.content = content;
        this.score = score;
    }

    // Board에서 파일 처리 위함
    public void addPhoto(Photo photo) {
        this.photo.add(photo);
        // 게시글에 파일이 저장되어있지 않은 경우
        if(photo.getReview() != this)
            // 파일 저장
            photo.setReview(this);


    }
    public Review toEntity() {
        return Review.builder()
                .member(member)
                .mechanic(mechanic)
                .content(content)
                .score(score)
                .build();
    }
}
