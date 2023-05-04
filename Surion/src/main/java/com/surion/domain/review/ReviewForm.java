package com.surion.domain.review;

import com.surion.domain.Image.Photo;
import com.surion.domain.member.Member;
import lombok.*;


import java.util.List;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ReviewForm {
    Member member;
    String type;
    String action;
    Long reviewId;
    int point;
    String content;
    List<Photo> photo;
    String MemberId;
    String MechanicId;
}