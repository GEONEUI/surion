package com.surion.service;


import com.surion.domain.Image.Photo;
import com.surion.domain.Image.PhotoDto;
import com.surion.domain.member.Mechanic;
import com.surion.domain.member.Member;
import com.surion.domain.review.Point;
import com.surion.domain.review.Review;
import com.surion.domain.review.ReviewCreateRequestDto;
import com.surion.domain.review.ReviewForm;
import com.surion.repository.MemberPointRepository;
import com.surion.repository.PhotoRepository;
import com.surion.repository.PointRewardRepository;
import com.surion.repository.ReviewRegisterRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.util.ObjectUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.transaction.Transactional;
import java.io.File;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Slf4j
@Service
@RequiredArgsConstructor
public class ReviewRegisterService {

    static int CONTENT = 1;
    static int PHOTO = 2;
    static int FIRSTPLACE = 3;
    static int POINT_INCREMENT = 1;
    static int POINT_DECREMENT = 2;
    static int YES = 1;
    static int NO = 0;
    private final ReviewRegisterRepository reviewRegisterRepository;
    private final PointRewardRepository pointRewardRepository;
    private final MemberPointRepository memberPointRepository;
    private final PhotoRepository photoRepository;
    private final FileHandler fileHandler;
    private final MemberService memberService;
    private final MechanicService mechanicService;


    // 이미지게시판자료
    @Transactional
    public Long create(
            ReviewCreateRequestDto requestDto,
            List<MultipartFile> files
    ) throws Exception {

        System.out.println("requestDto = " + requestDto);

        // 파일 처리를 위한 Board 객체 생성
        Review review = new Review(
                requestDto.getMember(),
                requestDto.getContent(),
                requestDto.getPoint()
        );


        System.out.println("review = " + review);

        List<Photo> photoList = fileHandler.parseFileInfo(review,files);

        System.out.println("photoList = " + photoList);

        // 파일이 존재할 때에만 처리
        if(!photoList.isEmpty()) {
            for(Photo photo : photoList) {
                // 파일을 DB에 저장
                review.addPhoto(photoRepository.save(photo));
            }
        }

        return reviewRegisterRepository.save(review).getId();
    }




    // 점수시스템 자료
    public String reviewRegister(ReviewForm reviewForm) {
        Member memberEntity = memberService.findById(reviewForm.getMemberId());
        Mechanic mechanicEntity = mechanicService.findOne(reviewForm.getMechanicId());

        if (reviewRegisterRepository.existsById(reviewForm.getReviewId())) {
            return "FAIL";
        }

        int point_sum = 0;

        Point firstPlacePointEntity = new Point();
        if (reviewRegisterRepository.existsByMechanicId(reviewForm.getMechanicId()) == false) {
            firstPlacePointEntity.setType(FIRSTPLACE);
            firstPlacePointEntity.setPoint(1);
            firstPlacePointEntity.setMark(POINT_INCREMENT);
            firstPlacePointEntity.setReviewId(reviewForm.getReviewId());
            firstPlacePointEntity.setUserId(reviewForm.getMemberId());

            point_sum += 1;
            pointRewardRepository.save(firstPlacePointEntity);
        }

        Review reviewEntity = new Review();
        reviewEntity.setContent(reviewForm.getContent());
        reviewEntity.setId(reviewForm.getReviewId());
        reviewEntity.setPhoto(reviewForm.getPhoto());
        reviewEntity.setMember(memberEntity);
        reviewEntity.setMechanic(mechanicEntity);

        reviewRegisterRepository.save(reviewEntity);

        Point contentPointEntity = new Point();
        if (reviewForm.getContent().length() > 1)     // 내용 1자 이상
        {
            contentPointEntity.setType(CONTENT);
            contentPointEntity.setPoint(1);
            contentPointEntity.setMark(POINT_INCREMENT);
            contentPointEntity.setReviewId(reviewForm.getReviewId());
            contentPointEntity.setUserId(reviewForm.getMemberId());

            point_sum += 1;
        }

        Point photoPointEntity = new Point();
        if (reviewForm.getPhoto().size() > 1)   // 1장 이상
        {
            photoPointEntity.setType(PHOTO);
            photoPointEntity.setPoint(1);
            photoPointEntity.setMark(POINT_INCREMENT);
            photoPointEntity.setReviewId(reviewForm.getReviewId());
            photoPointEntity.setUserId(reviewForm.getMemberId());

            point_sum += 1;
        }

        pointRewardRepository.save(contentPointEntity);
        pointRewardRepository.save(photoPointEntity);


        // 회원가입을 하면 user_id 를 받을테니, null 일수는 없지만
        // 회원가입을 하지 않은 회원이, user_id를 가지고 리뷰를 쓸 경우라고 판단하여 작성
        // 회원가입 관련 기능이 명세되어 있지 않으므로, 새로운 user면 저장하였음.
        Optional<Member> member = memberPointRepository.findById(reviewForm.getMemberId());

        if (member.isPresent()) {
            member.get().setPoint(member.get().getPoint() + point_sum);

            memberPointRepository.save(member.get());
        } else {
            Member userEntity = new Member();

            userEntity.setId(reviewForm.getMemberId());
            userEntity.setPoint(point_sum);

            memberPointRepository.save(userEntity);
        }

        return "SUCCESS";
    }


    public String reviewUpdate(ReviewForm reviewForm) {

        Review reviewEntity = new Review();
        Optional<Review> review = reviewRegisterRepository.findById(reviewForm.getReviewId());
        Member memberEntity = memberService.findById(reviewForm.getMemberId());
        Mechanic mechanicEntity = mechanicService.findOne(reviewForm.getMechanicId());

        review.ifPresent(selectReview -> {
            reviewEntity.setContent(reviewForm.getContent());
            reviewEntity.setId(reviewForm.getReviewId());
            reviewEntity.setPhoto(reviewForm.getPhoto()); // get이었음
            reviewEntity.setMember(memberEntity);
            reviewEntity.setMechanic(mechanicEntity);

        });
        reviewRegisterRepository.save(reviewEntity);

        // 리뷰를 수정하면 수정한 내용에 맞는 내용 점수를 계산하여 점수를 부여하거나
        //        글만 작성한 리뷰에 사진을 추가하면 1점을 부여합니다.
        // 글만 작성한 리뷰
        // 리뷰아이디로 리뷰를 가져와
        // 글만 작성? == 사진이 null
        // 요청값에서 사진이 있는지 확인?
        int checkContent = 0;
        if (reviewForm.getContent().length() > 1) {
            checkContent = 1;
        }

        int checkPhoto = 0;
//        if (reviewForm.getPhoto().length() > 1) {
//            checkPhoto = 1;
//        }


        // 포인트 테이블에서 reviewId 로 조회를 해야해.
        // 조회 해서 type
        Point contentPoint = pointRewardRepository.findByReviewIdAndTypeAndMarkAndRetrievedIdIsNull(reviewForm.getReviewId(), CONTENT, POINT_INCREMENT);

        Point photoPoint = pointRewardRepository.findByReviewIdAndTypeAndMarkAndRetrievedIdIsNull(reviewForm.getReviewId(), PHOTO, POINT_INCREMENT);

        //- checkcontent 1, contentPoint 조회 값 있음 : 그냥 넘어감
        //- checkcontent 0, contentPoint 조회 값 있음 : 포인트 회수
        //- checkcontent 1, contentPoint 조회 값 없음 : 포인트 +1
        //- checkcontent 0, contentPoint 조회 값 없음 : 그냥 넘어감


        if (checkContent == 1 && contentPoint != null) {
            //그냥 넘어감.
        } else if (checkContent == 0 && contentPoint != null) {
            int retrievedPointId = pointRetrieved(CONTENT, reviewForm.getMemberId());

            contentPoint.setRetrievedId(retrievedPointId);
            pointRewardRepository.save(contentPoint);
        } else if (checkContent == 1 && contentPoint == null) {
            Optional<Member> member = memberPointRepository.findById(reviewForm.getMemberId());
            Point contentPointEntity = new Point();
            contentPointEntity.setUserId(reviewForm.getMemberId());
            contentPointEntity.setType(CONTENT);
            contentPointEntity.setPoint(1);
            contentPointEntity.setMark(POINT_INCREMENT);
            contentPointEntity.setReviewId(reviewForm.getReviewId());

            member.get().setPoint(member.get().getPoint() + 1);

            pointRewardRepository.save(contentPointEntity);
            memberPointRepository.save(member.get());
        } else if (checkContent == 0 && contentPoint == null) {
            //그냥 넘어감.
        }


        //- checkphoto 1, photoPoint 조회 값 있음 : 그냥 넘어감
        //- checkphoto 0, photoPoint 조회 값 있음 : 포인트 회수
        //- checkphoto 1, photoPoint 조회 값 없음 : 포인트 +1
        //- checkphoto 0, photoPoint 조회 값 없음 : 그냥 넘어감

        if (checkPhoto == 1 && photoPoint != null) {
            //그냥 넘어감.
        } else if (checkPhoto == 0 && photoPoint != null) {
            int retrievedPointId = pointRetrieved(PHOTO, reviewForm.getMemberId());

            photoPoint.setRetrievedId(retrievedPointId);
            pointRewardRepository.save(photoPoint);
        } else if (checkPhoto == 1 && photoPoint == null) {
            Optional<Member> user2 = memberPointRepository.findById(reviewForm.getMemberId());
            Point photoPointEntity = new Point();
            photoPointEntity.setUserId(reviewForm.getMemberId());
            photoPointEntity.setType(PHOTO);
            photoPointEntity.setPoint(1);
            photoPointEntity.setMark(POINT_INCREMENT);
            photoPointEntity.setReviewId(reviewForm.getReviewId());

            user2.get().setPoint(user2.get().getPoint() + 1);

            pointRewardRepository.save(photoPointEntity);
            memberPointRepository.save(user2.get());
        } else if (checkPhoto == 0 && photoPoint == null) {
            //그냥 넘어감.
        }


        return "SUCCESS";
    }


    public String reviewDelete(ReviewForm reviewForm) {

        Optional<Review> review = reviewRegisterRepository.findById(reviewForm.getReviewId());

        // Review Soft Delete
        review.ifPresent(selectReview -> {
            selectReview.setDeleteAt(LocalDateTime.now());
            selectReview.setIsDelete(YES);
        });


        //content point 회수
        Point contentPoint = pointRewardRepository.findByReviewIdAndTypeAndMarkAndRetrievedIdIsNull(reviewForm.getReviewId(), CONTENT, POINT_INCREMENT);

        if (contentPoint != null) {
            int retrievedPointId = pointRetrieved(CONTENT, reviewForm.getMemberId());

            contentPoint.setRetrievedId(retrievedPointId);
            pointRewardRepository.save(contentPoint);
        }


        //photo point 회수
        Point photoPoint = pointRewardRepository.findByReviewIdAndTypeAndMarkAndRetrievedIdIsNull(reviewForm.getReviewId(), PHOTO, POINT_INCREMENT);

        if (photoPoint != null) {
            int retrievedPointId = pointRetrieved(PHOTO, reviewForm.getMemberId());

            photoPoint.setRetrievedId(retrievedPointId);
            pointRewardRepository.save(photoPoint);
        }

        //firstplace point 회수
        Point firstplacePoint = pointRewardRepository.findByReviewIdAndTypeAndMarkAndRetrievedIdIsNull(reviewForm.getReviewId(), FIRSTPLACE, POINT_INCREMENT);

        if (firstplacePoint != null) {
            int retrievedPointId = pointRetrieved(FIRSTPLACE, reviewForm.getMemberId());

            firstplacePoint.setRetrievedId(retrievedPointId);
            pointRewardRepository.save(firstplacePoint);
        }


        return "SUCCESS";
    }

    private int pointRetrieved(int pointType, String userId) {
        Point retrievedPointEntity = new Point();
        retrievedPointEntity.setUserId(userId);
        retrievedPointEntity.setType(pointType);
        retrievedPointEntity.setPoint(1);
        retrievedPointEntity.setMark(POINT_DECREMENT);
        retrievedPointEntity.setReviewId(retrievedPointEntity.getReviewId());

        Optional<Member> user3 = memberPointRepository.findById(userId);
        user3.get().setPoint(user3.get().getPoint() - 1);

        Point savedRetrievedPoint = pointRewardRepository.save(retrievedPointEntity);

        memberPointRepository.save(user3.get());
        return savedRetrievedPoint.getId();
    }

    public List<Review> findAll() {
    return reviewRegisterRepository.findAll();
    }
    public List<Review> findAllByOrderByCreatedAtDesc() {
        return reviewRegisterRepository.findAllByOrderByCreatedAtDesc();
    }


}