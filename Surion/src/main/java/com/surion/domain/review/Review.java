package com.surion.domain.review;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Getter
@Setter
@Table(name="suri_review")
public class Review {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "review_id")
    private Long id;
    private String content;
    private String score;
    @Enumerated(EnumType.STRING)
    private ReviewStatus reviewStatus;
}
