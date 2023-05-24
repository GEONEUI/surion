package com.surion.domain.review;

import com.surion.domain.Image.Photo;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.util.List;

@Getter
@NoArgsConstructor
public class ReviewUpdateRequestDto {

    private String memberId;
    private String mechanicId;
    private String content;
    private int score;


//    @Builder
//    public ReviewUpdateRequestDto(String memberId, String mechanicId, String content, int score) {
//        this.memberId = memberId;
//        this.mechanicId = mechanicId;
//        this.content = content;
//        this.score = score;
//    }

    @Builder
    public ReviewUpdateRequestDto(MultipartHttpServletRequest mtfRequest) {
        this.memberId = mtfRequest.getParameter("memberId");
        this.mechanicId = mtfRequest.getParameter("mechanicId");
        this.content = mtfRequest.getParameter("content");
        this.score = Integer.parseInt(mtfRequest.getParameter("score"));

    }
}