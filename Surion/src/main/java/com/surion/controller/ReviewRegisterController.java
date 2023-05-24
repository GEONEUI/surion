package com.surion.controller;

import com.surion.domain.Image.Photo;
import com.surion.domain.Image.PhotoResponseDto;
import com.surion.domain.review.*;
import com.surion.entity.Member;
import com.surion.service.MechanicService;
import com.surion.service.MemberService;
import com.surion.service.PhotoService;
import com.surion.service.ReviewRegisterService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;

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
    public String reviewForm(Model model, HttpSession session) {
        Member member = (Member) session.getAttribute("member");
        model.addAttribute("member", member);
        System.out.println("리뷰진입");
        return "review/reviewForm";
    }


    // 게시판 등록
    @PostMapping("/upload")
    public String create(MultipartHttpServletRequest mtfRequest, HttpSession session) throws Exception {
        reviewRegisterService.create(mtfRequest, session);
        System.out.println("mtfRequest = " + mtfRequest);
        System.out.println("mtfRequest = " + mtfRequest.toString());
        return "review/reviewDetail";
    }


    // 삭제
    @GetMapping("/delete/{id}")
    public String deleteReview(@PathVariable Long id) {
        reviewRegisterService.delete(id);
        return "redirect:/review/reviews";
    }

    @GetMapping("/update/{id}")
    public String showUpdateForm(@PathVariable Long id,Model model) throws Exception {

        // 게시판 id로 해당 게시글 첨부파일 전체 조회
        List<PhotoResponseDto> photoResponseDtoList = fileService.findAllByReviewId(id);

        // 게시글 id와 첨부파일 id 목록을 전달받아 결과 반환
        ReviewResponseDto reviewResponseDto = reviewRegisterService.searchAndSaveReviewById(id, photoResponseDtoList);

        System.out.println("photoResponseDtoList = " + photoResponseDtoList);
        System.out.println("photoResponseDtoList = " + photoResponseDtoList.toString());

        model.addAttribute("review", reviewResponseDto);
        model.addAttribute("photoList", photoResponseDtoList);

        return "review/reviewUpdateForm";
    }

    @PostMapping("/update/{id}")
    public String updateReview(@PathVariable Long id, MultipartHttpServletRequest mtfRequest) throws Exception {
        reviewRegisterService.update(id, mtfRequest);
        return "redirect:/review/detail/"+id;
    }


//    @GetMapping("detail/{id}")
//    public String searchById(@PathVariable Long id, Model model) {
//        // 게시글 id로 해당 게시글 첨부파일 전체 조회
//        List<PhotoResponseDto> photoResponseDtoList = fileService.findAllByReviewId(id);
//        System.out.println("photoResponseDtoList.toString() = " + photoResponseDtoList.toString());
//        // 게시글 첨부파일 id 담을 List 객체 생성
//        List<Long> photoId = new ArrayList<>();
//        // 각 첨부파일 id 추가
//        for (PhotoResponseDto photoResponseDto : photoResponseDtoList)
//            photoId.add(photoResponseDto.getFileId());
//
//        // 게시글 id와 첨부파일 id 목록을 전달받아 결과 반환
//        ReviewResponseDto reviewResponseDto = reviewRegisterService.searchById(id, photoId);
//        model.addAttribute("review", reviewResponseDto);
//        model.addAttribute("photoList", photoResponseDtoList);
//
//        System.out.println("reviewResponseDto+photoResponseDtoList = " + reviewResponseDto + photoResponseDtoList);
//        return "/review/reviewDetail";
//    }







    //조회 ( 전체 목록 )
    @GetMapping("/reviews")
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
    @GetMapping("detail/{id}")
    public String searchAndSaveById(@PathVariable Long id, Model model) {

        // 게시판 id로 해당 게시글 첨부파일 전체 조회
        List<PhotoResponseDto> photoResponseDtoList = fileService.findAllByReviewId(id);

        // 게시글 id와 첨부파일 id 목록을 전달받아 결과 반환
        ReviewResponseDto reviewResponseDto = reviewRegisterService.searchAndSaveReviewById(id, photoResponseDtoList);

        model.addAttribute("review", reviewResponseDto);
        model.addAttribute("photoList", photoResponseDtoList);


        System.out.println("reviewResponseDto+photoResponseDtoList = " + reviewResponseDto + photoResponseDtoList);
        return "/review/reviewDetail";
    }
}




