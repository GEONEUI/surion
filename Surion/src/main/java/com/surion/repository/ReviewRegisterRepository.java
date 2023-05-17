package com.surion.repository;


import com.surion.domain.review.Review;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReviewRegisterRepository extends JpaRepository<Review, Long> {
    Review save(Review review);

    boolean existsByMechanicId(String mechanicId);

    List<Review> findByMemberIdAndMechanicId(String memberId, String mechanicId);

    List<Review> findAll();

    // 리뷰 조회 (리뷰 작성 최신순으로 정렬)
    List<Review> findAllByOrderByCreatedAtDesc();


    //Review findByBetweenCreatedAt(LocalDateTime from, LocalDateTime to);

}