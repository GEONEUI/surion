package com.surion.controller;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.surion.domain.review.Review;
import com.surion.domain.review.ReviewCreateRequestDto;
import com.surion.domain.review.ReviewFileVO;
import com.surion.domain.review.ReviewForm;
import com.surion.domain.member.Member;
import com.surion.service.MemberService;
import com.surion.service.PhotoService;
import com.surion.service.ReviewRegisterService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.tagext.TryCatchFinally;
import java.io.File;
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


    @PostMapping("/upload")
    @ResponseStatus(HttpStatus.CREATED)
    public Long create(ReviewFileVO reviewFileVO, HttpServletRequest request) throws Exception {
        MultipartRequest multi = null;
        int maxSize = 1024*1024*5;
        String savaPath = request.getRealPath("/resources/images");

        try{
            multi= new MultipartRequest(request,savaPath,maxSize,"utf-8",new DefaultFileRenamePolicy());
            System.out.println("savaPath = " + savaPath);
        } catch ( Exception e){
            e.printStackTrace();
        }

        File file = multi.getFile("files");
        String lastName = file.getName().substring(file.getName().lastIndexOf(".")+1).toUpperCase();
        System.out.println("lastName = " + file.getName());
        if (multi!=null){
            if(lastName.equals("PNG")||lastName.equals("JPG")){
            } else {
                if(file.exists()){
                    file.delete();
                }
            }
        }
        ReviewFileVO reviewFileVO1 = new ReviewFileVO();

        reviewFileVO1.setMemberId(multi.getParameter("memberId"));
        reviewFileVO1.setPoint(Integer.parseInt(multi.getParameter("point")));
        reviewFileVO1.setContent(multi.getParameter("content"));
        reviewFileVO1.setFiles(file.getName());

        System.out.println("reviewFileVO1 = " + reviewFileVO1);
        

        return 1L;






//
//
//        // Member id로 조회하는 메소드 존재한다고 가정하에 진행
//        System.out.println("reviewFileVO = " + reviewFileVO);
//        Member member = memberService.findById(
//                reviewFileVO.getMemberId());
//
//        ReviewCreateRequestDto reviewCreateRequestDto =
//                ReviewCreateRequestDto.builder()
//                        .member(member)
//                        .content(reviewFileVO.getContent())
//                        .point(reviewFileVO.getPoint())
//                        .build();
//
//        return reviewRegisterService.create(reviewCreateRequestDto, reviewFileVO.getFiles());
    }


    @PostMapping("/events")
    @ResponseBody
    public ResponseEntity<Map> reviewRegister(@RequestBody ReviewForm reviewForm) {
        System.out.println(reviewForm);


        String result = "";


        System.out.println(reviewForm);

        if (add.equals(reviewForm.getAction())) {
            result = reviewRegisterService.reviewRegister(reviewForm);
        } else if (mod.equals(reviewForm.getAction())) {
            result = reviewRegisterService.reviewUpdate(reviewForm);
        } else if (delete.equals(reviewForm.getAction())) {
            result = reviewRegisterService.reviewDelete(reviewForm);
        }
        System.out.println("result = " + result);

        Map<String, String> response = new HashMap<>();
        if (result.equals("SUCCESS")) {
            response.put("result", "SUCCESS");
        } else {
            response.put("result", "FAIL");
        }
        return ResponseEntity.ok(response);
    }
















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