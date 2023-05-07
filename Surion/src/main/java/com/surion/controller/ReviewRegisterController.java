package com.surion.controller;

import com.surion.domain.Image.Photo;
import com.surion.domain.Image.PhotoResponseDto;
import com.surion.domain.mechanic.Mechanic;
import com.surion.domain.review.*;
import com.surion.domain.member.Member;
import com.surion.service.MechanicService;
import com.surion.service.MemberService;
import com.surion.service.PhotoService;
import com.surion.service.ReviewRegisterService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/review/*")
public class ReviewRegisterController {

    static String add = "ADD";
    static String mod = "MOD";
    static String delete = "DELETE";
    private final ReviewRegisterService reviewRegisterService;
    private final MemberService memberService;
    private final MechanicService mechanicService;
    private final PhotoService fileService;


    // 리뷰 작성 진입
    @GetMapping("/review")
    public String asdf() {
        System.out.println("리뷰진입");
        return "review/reviewForm";
    }

    // 게시판 등록
    @PostMapping("/upload")
    public String create(MultipartHttpServletRequest mtfRequest) throws Exception {
        System.out.println("mtfRequest = " + mtfRequest);

        List<MultipartFile> fileList = mtfRequest.getFiles("files");

        ReviewCreateRequestDto reviewCreateRequestDto = ReviewCreateRequestDto.builder()
//                .memberId(mtfRequest.getParameter("memberId"))
//                .mechanicId(mtfRequest.getParameter("mechanicId"))
                .memberId("33")
                .mechanicId("44")
                .content(mtfRequest.getParameter("content"))
                .score(Integer.parseInt(mtfRequest.getParameter("score")))
                .build();
        System.out.println("reviewCreateRequestDto = " + reviewCreateRequestDto.getMechanicId());

        reviewRegisterService.create(reviewCreateRequestDto, fileList);

        return "review/reviewList";
    }

    //조회 ( 전체 목록 )
    @GetMapping("/reviews")
    @ResponseBody
    public String searchAllDesc(Model model) {
        // 게시글 전체 조회
        List<Review> reviewList = reviewRegisterService.findAllByOrderByCreatedAtDesc();

        System.out.println("reviewList = " + reviewList);

        // 반환할 List<BoardListResponseDto> 생성
        List<Photo> fileList = fileService.findAll();
        List<ReviewListResponseDto> responseDtoList = new ArrayList<>();

        // 전체 조회하여 획득한 각 게시글 객체를 이용해 BoardListResponseDto 생성
        for (Review review : reviewList) {
            ReviewListResponseDto responseDto = new ReviewListResponseDto(review, fileList);
            responseDtoList.add(responseDto);
        }
        System.out.println("responseDtoList = " + responseDtoList);

        model.addAttribute("reviewList", responseDtoList);

        return "/review/reviewList";
    }

    // 조회 ( 개별 )
    @GetMapping("/review/{id}")
    public String searchById(@PathVariable Long id, Model model) {
        // 게시글 id로 해당 게시글 첨부파일 전체 조회
        List<PhotoResponseDto> photoResponseDtoList = fileService.findAllByBoard(id);
        System.out.println("photoResponseDtoList.toString() = " + photoResponseDtoList.toString());
        // 게시글 첨부파일 id 담을 List 객체 생성
        List<Long> photoId = new ArrayList<>();
        // 각 첨부파일 id 추가
        for (PhotoResponseDto photoResponseDto : photoResponseDtoList)
            photoId.add(photoResponseDto.getFileId());

        // 게시글 id와 첨부파일 id 목록을 전달받아 결과 반환
        ReviewResponseDto reviewResponseDto = reviewRegisterService.searchById(id, photoId);
        model.addAttribute("review", reviewResponseDto);
        model.addAttribute("photoList", photoResponseDtoList);

        System.out.println("reviewResponseDto+photoResponseDtoList = " + reviewResponseDto + photoResponseDtoList);
        return "/review/reviewDetail";
    }
}




