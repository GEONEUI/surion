package com.surion.domain.review;

import com.surion.domain.Image.Photo;
import lombok.Getter;

import java.util.List;

@Getter
public class ReviewListResponseDto {
    private Long id;
    private String memberId;
    private String mechanicId;
    private String content;
    private List<Photo> file;


    public ReviewListResponseDto(Review entity, List<Photo> file) {
        this.id = entity.getId();
        this.memberId = entity.getMember().getId();
        this.mechanicId = entity.getMechanic().getId();
        this.content = entity.getContent();
        this.file = file;
    }
}
