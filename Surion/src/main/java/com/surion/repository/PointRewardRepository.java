package com.surion.repository;

import com.surion.domain.review.Point;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PointRewardRepository extends JpaRepository<Point, String> {
    Point save(Point point);

    Point findByReviewId(String reviewId);

    Point findByReviewIdAndTypeAndMarkAndRetrievedIdIsNull(Long reviewId, int type, int mark);
}
