package com.surion.controller;

import com.surion.entity.Member;
import com.surion.service.PointCheckService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequiredArgsConstructor
public class PointCheckController {

    private final PointCheckService pointCheckService;

    @GetMapping("/point/check")
    public ResponseEntity<Member> reviewRegister(@RequestParam String userId) {

        int point = pointCheckService.pointCheck(userId);

        Member member = new Member();
        member.setId(userId);
        member.setPoint(point);

        return ResponseEntity.ok(member);

    }

}