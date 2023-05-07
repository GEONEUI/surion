
package com.surion.domain.review;

import lombok.Getter;

import java.util.List;

@Getter
public class ReviewResponseDto {
    private Long id;
    private String memberId;
    private String mechanicId;
    private int score;
    private String content;
    private List<Long> fileId;

    //     public BoardResponseDto(Board entity) {
    public ReviewResponseDto(Review entity, List<Long> fileId) {
        this.id = entity.getId();
        this.memberId = entity.getMember().getId();
        this.mechanicId = entity.getMechanic().getId();
        this.content = entity.getContent();
        this.score = entity.getScore();
        this.fileId = fileId;
    }
}