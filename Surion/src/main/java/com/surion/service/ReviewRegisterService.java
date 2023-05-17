package com.surion.service;


import com.surion.domain.Image.Photo;
import com.surion.domain.mechanic.Mechanic;
import com.surion.entity.Member;
import com.surion.domain.review.*;
import com.surion.repository.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


import javax.servlet.http.HttpSession;
import java.util.List;

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
    private final MemberRepository memberRepository;
    private final MechanicService mechanicService;


    // 이미지게시판자료

    /*
     ** 게시글 저장
     */
    @Transactional
    public void create(MultipartHttpServletRequest mtfRequest, HttpSession session) throws Exception {

        Member member = (Member) session.getAttribute("member");
        List<MultipartFile> fileList = mtfRequest.getFiles("files");
        String mechanicId = mtfRequest.getParameter("mechanicId");
//        Mechanic mechanic = mechanicService.findById(mechanicId);
        Mechanic mechanic = new Mechanic();
        mechanic.setId("44");

        for(int i = 0; i<fileList.size() ;i++) {
            System.out.println(fileList.get(i).getName());
        }

        Review review = Review.builder()
                .member(member)
                .mechanic(mechanic)
                .content(mtfRequest.getParameter("content"))
                .score(Integer.parseInt(mtfRequest.getParameter("score")))
                .build();

        System.out.println("review = " + review.toString());
        System.out.println("member ==== " + member.getId());
        System.out.println("mechanic ==== " + mechanicId);
        System.out.println("review = " + review.getId());

        List<Photo> photoList = fileHandler.parseFileInfo(review,fileList);
        System.out.println("photoList = " + photoList);

        // 파일이 존재할 때에만 처리
        if(!photoList.isEmpty()) {
            for(Photo photo : photoList) {
                // 파일을 DB에 저장
                review.addPhoto(photoRepository.save(photo));
            }
        }
        reviewRegisterRepository.save(review);
    }




    // 게시글 업데이트
    @Transactional
    public void update(
            Long id,
            ReviewUpdateRequestDto requestDto,
            List<MultipartFile> files
    ) throws Exception {
        Review review = reviewRegisterRepository.findById(id)
                .orElseThrow(() -> new
                        IllegalArgumentException("해당 게시글이 존재하지 않습니다."));

        List<Photo> photoList = fileHandler.parseFileInfo(review, files);

        if(!photoList.isEmpty()) {
            for(Photo photo : photoList) {
                photoRepository.save(photo);
            }
        }
        review.update(requestDto.getScore(), requestDto.getContent());
    }

    // 게시글 지우기
    @Transactional
    public void delete(Long id) {
        Review review = reviewRegisterRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("해당 게시물이 존재하지 않습니다.")
                );
        reviewRegisterRepository.delete(review);
    }

    // 게시글 전체 조회
    public List<Review> findAll() {
        return reviewRegisterRepository.findAll();
    }

    // 게시글 전체 조회 ( 정렬 : 작성일 최신순 )
    public List<Review> findAllByOrderByCreatedAtDesc() {
        return reviewRegisterRepository.findAllByOrderByCreatedAtDesc();
    }

    // 게시글 개별 조회
    @Transactional(readOnly = true)
    public ReviewResponseDto searchById(Long id, List<Long> fileId) {
        Review entity = reviewRegisterRepository.findById(id).orElseThrow(()
                -> new IllegalArgumentException("해당 게시글이 존재하지 않습니다."));

        return new ReviewResponseDto(entity, fileId);
    }











//
//
//    // 점수시스템 자료
//
//    /*
//    리뷰 등록 + 리뷰 점수 시스템
//     */
//    public String reviewRegister(ReviewForm reviewForm) {
//        Member member1 = new Member();
//        member1.setId(reviewForm.getMemberId());
//
//        Member memberEntity = memberRepository.findById(member1);
//        Mechanic mechanicEntity = mechanicService.findById(reviewForm.getMechanicId());
//
//        if (reviewRegisterRepository.existsById(reviewForm.getReviewId())) {
//            return "FAIL";
//        }
//
//        int point_sum = 0;
//
//        Point firstPlacePointEntity = new Point();
//        if (reviewRegisterRepository.existsByMechanicId(reviewForm.getMechanicId()) == false) {
//            firstPlacePointEntity.setType(FIRSTPLACE);
//            firstPlacePointEntity.setPoint(1);
//            firstPlacePointEntity.setMark(POINT_INCREMENT);
//            firstPlacePointEntity.setReviewId(reviewForm.getReviewId());
//            firstPlacePointEntity.setMemberId(reviewForm.getMemberId());
//
//            point_sum += 1;
//            pointRewardRepository.save(firstPlacePointEntity);
//        }
//
//        Review reviewEntity = new Review();
//        reviewEntity.setContent(reviewForm.getContent());
//        reviewEntity.setId(reviewForm.getReviewId());
//        reviewEntity.setPhoto(reviewForm.getPhoto());
//        reviewEntity.setMember(memberEntity);
//        reviewEntity.setMechanic(mechanicEntity);
//
//        reviewRegisterRepository.save(reviewEntity);
//
//        Point contentPointEntity = new Point();
//        if (reviewForm.getContent().length() > 1)     // 내용 1자 이상
//        {
//            contentPointEntity.setType(CONTENT);
//            contentPointEntity.setPoint(1);
//            contentPointEntity.setMark(POINT_INCREMENT);
//            contentPointEntity.setReviewId(reviewForm.getReviewId());
//            contentPointEntity.setMemberId(reviewForm.getMemberId());
//
//            point_sum += 1;
//        }
//
//        Point photoPointEntity = new Point();
//        if (reviewForm.getPhoto().size() > 1)   // 1장 이상
//        {
//            photoPointEntity.setType(PHOTO);
//            photoPointEntity.setPoint(1);
//            photoPointEntity.setMark(POINT_INCREMENT);
//            photoPointEntity.setReviewId(reviewForm.getReviewId());
//            photoPointEntity.setMemberId(reviewForm.getMemberId());
//
//            point_sum += 1;
//        }
//
//        pointRewardRepository.save(contentPointEntity);
//        pointRewardRepository.save(photoPointEntity);
//
//
//        // 회원가입을 하면 user_id 를 받을테니, null 일수는 없지만
//        // 회원가입을 하지 않은 회원이, user_id를 가지고 리뷰를 쓸 경우라고 판단하여 작성
//        // 회원가입 관련 기능이 명세되어 있지 않으므로, 새로운 user면 저장하였음.
//        Optional<Member> member = memberPointRepository.findById(reviewForm.getMemberId());
//
//        if (member.isPresent()) {
//            member.get().setPoint(member.get().getPoint() + point_sum);
//
//            memberPointRepository.save(member.get());
//        } else {
//            Member userEntity = new Member();
//
//            userEntity.setId(reviewForm.getMemberId());
//            userEntity.setPoint(point_sum);
//
//            memberPointRepository.save(userEntity);
//        }
//
//        return "SUCCESS";
//    }
//
//
//    /*
//     리뷰 업데이트 + 점수 시스템
//     */
//    public String
//    reviewUpdate(ReviewForm reviewForm) {
//
//        Review reviewEntity = new Review();
//        Optional<Review> review = reviewRegisterRepository.findById(reviewForm.getReviewId());
//        Member memberEntity = memberService.findById(reviewForm.getMemberId());
//        Mechanic mechanicEntity = mechanicService.findById(reviewForm.getMechanicId());
//
//        review.ifPresent(selectReview -> {
//            reviewEntity.setContent(reviewForm.getContent());
//            reviewEntity.setId(reviewForm.getReviewId());
//            reviewEntity.setPhoto(reviewForm.getPhoto()); // get이었음
//            reviewEntity.setMember(memberEntity);
//            reviewEntity.setMechanic(mechanicEntity);
//
//        });
//        reviewRegisterRepository.save(reviewEntity);
//
//        // 리뷰를 수정하면 수정한 내용에 맞는 내용 점수를 계산하여 점수를 부여하거나
//        // 글만 작성한 리뷰에 사진을 추가하면 1점을 부여합니다.
//        // 글만 작성한 리뷰
//        // 리뷰아이디로 리뷰를 가져와
//        // 글만 작성? == 사진이 null
//        // 요청값에서 사진이 있는지 확인?
//        int checkContent = 0;
//        if (reviewForm.getContent().length() > 1) {
//            checkContent = 1;
//        }
//
//        int checkPhoto = 0;
//        if (reviewForm.getPhoto().size() > 1) {
//            checkPhoto = 1;
//        }
//
//
//        // 포인트 테이블에서 reviewId 로 조회를 해야해.
//        // 조회 해서 type
//        Point contentPoint = pointRewardRepository.findByReviewIdAndTypeAndMarkAndRetrievedIdIsNull(reviewForm.getReviewId(), CONTENT, POINT_INCREMENT);
//
//        Point photoPoint = pointRewardRepository.findByReviewIdAndTypeAndMarkAndRetrievedIdIsNull(reviewForm.getReviewId(), PHOTO, POINT_INCREMENT);
//
//        //- checkcontent 1, contentPoint 조회 값 있음 : 그냥 넘어감
//        //- checkcontent 0, contentPoint 조회 값 있음 : 포인트 회수
//        //- checkcontent 1, contentPoint 조회 값 없음 : 포인트 +1
//        //- checkcontent 0, contentPoint 조회 값 없음 : 그냥 넘어감
//
//
//        if (checkContent == 1 && contentPoint != null) {
//            //그냥 넘어감.
//        } else if (checkContent == 0 && contentPoint != null) {
//            int retrievedPointId = pointRetrieved(CONTENT, reviewForm.getMemberId());
//
//            contentPoint.setRetrievedId(retrievedPointId);
//            pointRewardRepository.save(contentPoint);
//        } else if (checkContent == 1 && contentPoint == null) {
//            Optional<Member> member = memberPointRepository.findById(reviewForm.getMemberId());
//            Point contentPointEntity = new Point();
//            contentPointEntity.setMemberId(reviewForm.getMemberId());
//            contentPointEntity.setType(CONTENT);
//            contentPointEntity.setPoint(1);
//            contentPointEntity.setMark(POINT_INCREMENT);
//            contentPointEntity.setReviewId(reviewForm.getReviewId());
//
//            member.get().setPoint(member.get().getPoint() + 1);
//
//            pointRewardRepository.save(contentPointEntity);
//            memberPointRepository.save(member.get());
//        } else if (checkContent == 0 &&
//                contentPoint == null) {
//            //그냥 넘어감.
//        }
//
//
//        //- checkphoto 1, photoPoint 조회 값 있음 : 그냥 넘어감
//        //- checkphoto 0, photoPoint 조회 값 있음 : 포인트 회수
//        //- checkphoto 1, photoPoint 조회 값 없음 : 포인트 +1
//        //- checkphoto 0, photoPoint 조회 값 없음 : 그냥 넘어감
//
//        if (checkPhoto == 1 && photoPoint != null) {
//            //그냥 넘어감.
//        } else if (checkPhoto == 0 && photoPoint != null) {
//            int retrievedPointId = pointRetrieved(PHOTO, reviewForm.getMemberId());
//
//            photoPoint.setRetrievedId(retrievedPointId);
//            pointRewardRepository.save(photoPoint);
//        } else if (checkPhoto == 1 && photoPoint == null) {
//            Optional<Member> user2 = memberPointRepository.findById(reviewForm.getMemberId());
//            Point photoPointEntity = new Point();
//            photoPointEntity.setMemberId(reviewForm.getMemberId());
//            photoPointEntity.setType(PHOTO);
//            photoPointEntity.setPoint(1);
//            photoPointEntity.setMark(POINT_INCREMENT);
//            photoPointEntity.setReviewId(reviewForm.getReviewId());
//
//            user2.get().setPoint(user2.get().getPoint() + 1);
//
//            pointRewardRepository.save(photoPointEntity);
//            memberPointRepository.save(user2.get());
//        } else if (checkPhoto == 0 && photoPoint == null) {
//            //그냥 넘어감.
//        }
//
//
//        return "SUCCESS";
//    }
//
//    /*
//    리뷰 삭제
//     */
//    public String reviewDelete(ReviewForm reviewForm) {
//
//        Optional<Review> review = reviewRegisterRepository.findById(reviewForm.getReviewId());
//
//        // 리뷰 삭제
//        review.ifPresent(selectReview -> {
//            selectReview.setDeleteAt(LocalDateTime.now());
//            selectReview.setIsDelete(YES);
//        });
//
//
//        //content point 회수
//        Point contentPoint = pointRewardRepository.findByReviewIdAndTypeAndMarkAndRetrievedIdIsNull(reviewForm.getReviewId(), CONTENT, POINT_INCREMENT);
//
//        if (contentPoint != null) {
//            int retrievedPointId = pointRetrieved(CONTENT, reviewForm.getMemberId());
//
//            contentPoint.setRetrievedId(retrievedPointId);
//            pointRewardRepository.save(contentPoint);
//        }
//
//
//        //photo point 회수
//        Point photoPoint = pointRewardRepository.findByReviewIdAndTypeAndMarkAndRetrievedIdIsNull(reviewForm.getReviewId(), PHOTO, POINT_INCREMENT);
//
//        if (photoPoint != null) {
//            int retrievedPointId = pointRetrieved(PHOTO, reviewForm.getMemberId());
//
//            photoPoint.setRetrievedId(retrievedPointId);
//            pointRewardRepository.save(photoPoint);
//        }
//
//        //firstplace point 회수
//        Point firstplacePoint = pointRewardRepository.findByReviewIdAndTypeAndMarkAndRetrievedIdIsNull(reviewForm.getReviewId(), FIRSTPLACE, POINT_INCREMENT);
//
//        if (firstplacePoint != null) {
//            int retrievedPointId = pointRetrieved(FIRSTPLACE, reviewForm.getMemberId());
//
//            firstplacePoint.setRetrievedId(retrievedPointId);
//            pointRewardRepository.save(firstplacePoint);
//        }
//        return "SUCCESS";
//    }
//
//    private int pointRetrieved(int pointType, String userId) {
//        Point retrievedPointEntity = new Point();
//        retrievedPointEntity.setMemberId(userId);
//        retrievedPointEntity.setType(pointType);
//        retrievedPointEntity.setPoint(1);
//        retrievedPointEntity.setMark(POINT_DECREMENT);
//        retrievedPointEntity.setReviewId(retrievedPointEntity.getReviewId());
//
//        Optional<Member> user3 = memberPointRepository.findById(userId);
//        user3.get().setPoint(user3.get().getPoint() - 1);
//
//        Point savedRetrievedPoint = pointRewardRepository.save(retrievedPointEntity);
//
//        memberPointRepository.save(user3.get());
//        return savedRetrievedPoint.getId();
//    }

    public Review findByMemberIdAndMechanicId(String id, String id1) {
        return findByMemberIdAndMechanicId(id, id1);
    }
}