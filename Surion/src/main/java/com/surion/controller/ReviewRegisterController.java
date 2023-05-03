package com.surion.controller;

import com.surion.domain.member.Member;
import com.surion.domain.review.Review;
import com.surion.domain.review.ReviewForm;
import com.surion.service.ReviewRegisterService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

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


    @GetMapping("/review")
    public String asdf (){
        System.out.println("리뷰진입");
            return "/review/review";
    }


    @PostMapping("/events")
    @ResponseBody
    public ResponseEntity<Map> reviewRegister(@RequestBody ReviewForm reviewForm) {
        System.out.println(reviewForm);
        
        
        String result = "";

        reviewForm.setAction(add);
        reviewForm.setUserId("111");
        reviewForm.setReviewId(11L);
        reviewForm.setPlaceId("111");
        reviewForm.setAttachedPhotoIds("10");

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