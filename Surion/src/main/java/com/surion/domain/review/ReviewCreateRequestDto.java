package com.surion.domain.review;

import com.surion.domain.member.Member;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class ReviewCreateRequestDto {
    private Member member;
    private String content;
    private int point;

    @Builder
    public ReviewCreateRequestDto(Member member, String content, int point) {
        this.member = member;
        this.content = content;
        this.point = point;
    }

    public Review toEntity() {
        return Review.builder()
                .member(member)
                .content(content)
                .build();
    }
}
