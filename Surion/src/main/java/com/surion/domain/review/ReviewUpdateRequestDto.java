package com.surion.domain.review;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class ReviewUpdateRequestDto {

    private String memberId;
    private String mechanicId;
    private String content;
    private int score;

    @Builder
    public ReviewUpdateRequestDto(String memberId, String mechanicId, String content, int score) {
        this.memberId = memberId;
        this.mechanicId = mechanicId;
        this.content = content;
        this.score = score;
    }
}