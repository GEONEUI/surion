package com.surion.domain.review;

import com.surion.domain.mechanic.Mechanic;
import com.surion.domain.member.Member;
import com.surion.service.MechanicService;
import com.surion.service.MemberService;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Getter
@NoArgsConstructor
public class ReviewCreateRequestDto {
    private String memberId;
    private String mechanicId;
    private String content;
    private int score;


    @Builder
    public ReviewCreateRequestDto(String memberId, String mechanicId, String content, int score) {
        this.memberId = memberId;
        this.mechanicId = mechanicId;
        this.content = content;
        this.score = score;
    }
}

