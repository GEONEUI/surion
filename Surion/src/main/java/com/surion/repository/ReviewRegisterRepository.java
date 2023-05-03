package com.surion.repository;


import com.surion.domain.review.Review;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReviewRegisterRepository extends JpaRepository<Review, Long> {
    Review save(Review review);

    boolean existsByPlaceId(String placeId);

    List<Review> findByUserIdAndPlaceId(String userId, String placeId);

    List<Review> findAll();

    //Review findByBetweenCreatedAt(LocalDateTime from, LocalDateTime to);

}