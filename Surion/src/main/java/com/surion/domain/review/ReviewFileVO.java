package com.surion.domain.review;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Data
public class ReviewFileVO {
    private String memberId;
    private String mechanicId;
    private String content;
    private int score;
    private String files;
}