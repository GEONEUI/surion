package com.surion.repository;

import com.surion.domain.member.Member;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MemberPointRepository extends JpaRepository<Member, String> {
        Member save(Member member);
        }
