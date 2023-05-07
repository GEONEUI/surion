package com.surion.domain.review;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class ReviewUpdateRequestDto {

    private int score;
    private String content;

    @Builder
    public ReviewUpdateRequestDto(int score, String content) {
        this.score = score;
        this.content = content;
    }
}