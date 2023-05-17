package com.surion.service;

import com.surion.entity.Member;
import com.surion.repository.MemberPointRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Slf4j
@Service
@RequiredArgsConstructor
public class PointCheckService {

    private final MemberPointRepository memberPointRepository;

    public int pointCheck(String userId) {
        Optional<Member> member = memberPointRepository.findById(userId);

        if (member.isPresent()) {
            return member.get().getPoint();
        }
        return 0;
    }

}