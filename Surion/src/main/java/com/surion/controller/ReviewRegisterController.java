package com.surion.controller;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.surion.domain.Image.Photo;
import com.surion.domain.board.Board;
import com.surion.domain.review.*;
import com.surion.domain.member.Member;
import com.surion.service.MemberService;
import com.surion.service.PhotoService;
import com.surion.service.ReviewRegisterService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.tagext.TryCatchFinally;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    private final PhotoService photoService;


    // 리뷰 작성 진입
    @GetMapping("/review")
    public String asdf (){
        System.out.println("리뷰진입");
            return "/review/review";
    }
//
//
//    @ResponseBody
//    @PostMapping("/api/review")
//    public ReviewForm ddd(ReviewForm reviewForm){
//        System.out.println("add = " + reviewForm);
//        return reviewForm;
//    }

    @Value("${file.dir}")
    private String fileDir;


    // 게시판 등록
    @PostMapping("/upload")
    @ResponseBody
    public long create(MultipartHttpServletRequest mtfRequest) throws Exception {
        System.out.println("mtfRequest = " + mtfRequest);

        List<MultipartFile> fileList = mtfRequest.getFiles("files");
        Member member = memberService.findById(mtfRequest.getParameter("memberId"));

        ReviewCreateRequestDto reviewCreateRequestDto = ReviewCreateRequestDto.builder()
                .member(member)
                .content(mtfRequest.getParameter("content"))
                .point(Integer.parseInt(mtfRequest.getParameter("point")))
                .build();

        System.out.println("reviewCreateRequestDto = " + reviewCreateRequestDto);

        return reviewRegisterService.create(reviewCreateRequestDto,fileList);
    }

    //전체 조회(목록)
    @GetMapping("/getreviews")
    @ResponseBody
    public List<ReviewListResponseDto> searchAllDesc() {
        // 게시글 전체 조회
        List<Review> reviewList = reviewRegisterService.findAllByOrderByCreatedAtDesc();
//        List<Review> boardList = itemService.searchAllDesc();
        // 반환할 List<BoardListResponseDto> 생성
        List<Photo> fileList = photoService.findAll();
        List<ReviewListResponseDto> responseDtoList = new ArrayList<>();


        for(Review review : reviewList) {
            // 전체 조회하여 획득한 각 게시글 객체를 이용해 BoardListResponseDto 생성
            ReviewListResponseDto responseDto = new ReviewListResponseDto(review,fileList);
            responseDtoList.add(responseDto);
        }
        return responseDtoList;
//        return boardService.searchAllDesc();
    }




//
//    @PostMapping("/events")
//    @ResponseBody
//    public ResponseEntity<Map> reviewRegister(MultipartHttpServletRequest mtfRequest) {
//
//        String result = "";
//
//        if (add.equals(mtfRequest.getAction())) {
//            result = reviewRegisterService.reviewRegister(mtfRequest);
//        } else if (mod.equals(mtfRequest.getAction())) {
//            result = reviewRegisterService.reviewUpdate(mtfRequest);
//        } else if (delete.equals(mtfRequest.getAction())) {
//            result = reviewRegisterService.reviewDelete(mtfRequest);
//        }
//        System.out.println("result = " + result);
//
//        Map<String, String> response = new HashMap<>();
//        if (result.equals("SUCCESS")) {
//            response.put("result", "SUCCESS");
//        } else {
//            response.put("result", "FAIL");
//        }
//        return ResponseEntity.ok(response);
//    }
















    @GetMapping("/review/")
    public ModelAndView getReviews() {
        List<Review> reviews = reviewRegisterService.findAll();
        double average = reviews.stream().mapToInt(Review::getPoint).average().orElse(0.0);
        ModelAndView modelAndView = new ModelAndView("reviews");
        modelAndView.addObject("reviews", reviews);
        modelAndView.addObject("average", average);
        return modelAndView;
    }

    @GetMapping("/review/reviews")
    public String getReviews(Model model) {
        List<Review> reviews = reviewRegisterService.findAll();
        double average = reviews.stream().mapToInt(Review::getPoint).average().orElse(0.0);
        model.addAttribute("reviews", reviews);
        model.addAttribute("average", average);
        return "/review/reviews";
    }
}