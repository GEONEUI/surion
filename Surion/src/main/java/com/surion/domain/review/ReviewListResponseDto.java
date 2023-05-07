package com.surion.domain.review;

import com.surion.domain.Image.Photo;
import lombok.Getter;

import java.util.List;

@Getter
public class ReviewListResponseDto {
    private Long id;
    private String member;
    private String title;
    private String content;
    private List<Photo> file;

    //     public BoardResponseDto(Board entity) {
    public ReviewListResponseDto(Review entity, List<Photo> file) {
        this.id = 1L;
//        this.id = entity.getId();
        this.member = entity.getMember().getName();
        this.content = entity.getContent();
        this.file = file;
    }
}
