package com.surion.controller;

import com.surion.service.MemberService;
import com.surion.service.PhotoService;
import com.surion.service.ReviewRegisterService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class ReviewRegisterControllerTest {
    @Autowired
    ReviewRegisterService reviewRegisterService;
    @Autowired MemberService memberService;
    @Autowired  PhotoService photoService;

    @Test
    public String 입력테스트 (){

        return "a";
    }




}