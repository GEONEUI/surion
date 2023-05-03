package com.surion.domain.review;

import lombok.*;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class ReviewForm {
    String type;
    String action;
    Long reviewId;
    int point;
    String content;
    String attachedPhotoIds;
    String userId;
    String placeId;
}