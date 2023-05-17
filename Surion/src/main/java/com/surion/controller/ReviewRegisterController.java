package com.surion.controller;

import com.surion.domain.Image.Photo;
import com.surion.domain.Image.PhotoDto;
import com.surion.domain.Image.PhotoResponseDto;
import com.surion.domain.review.*;
import com.surion.entity.Member;
import com.surion.service.MechanicService;
import com.surion.service.MemberService;
import com.surion.service.PhotoService;
import com.surion.service.ReviewRegisterService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/review/*")
public class ReviewRegisterController {

    static String add = "ADD";
    static String mod = "MOD";
    static String delete = "DELETE";
    private final ReviewRegisterService reviewRegisterService;
    private final MemberService memberService;
    private final MechanicService mechanicService;
    private final PhotoService fileService;


    // 리뷰 작성 진입
    @GetMapping("/review")
    public String reviewForm(Model model, HttpSession session) {
        Member member = (Member) session.getAttribute("member");
        model.addAttribute("member", member);
        System.out.println("리뷰진입");
        return "review/reviewForm";
    }

    // 게시판 등록
    @PostMapping("/upload")
    public String create(MultipartHttpServletRequest mtfRequest, HttpSession session) throws Exception {
        reviewRegisterService.create(mtfRequest, session);
        return "review/reviewList";
    }


    // 업데이트
    @PutMapping("/review/update/{id}")
    public String update(@PathVariable Long id, MultipartHttpServletRequest mtfRequest) throws Exception {

        ReviewUpdateRequestDto requestDto =
                ReviewUpdateRequestDto
                        .builder()
                        .memberId(mtfRequest.getParameter("memberId"))
                        .mechanicId(mtfRequest.getParameter("mechanicId"))
                        .content(mtfRequest.getParameter("content"))
                        .score(Integer.parseInt(mtfRequest.getParameter("score")))
                        .build();

        // DB에 저장된 파일 불러오기
        List<PhotoResponseDto> dbPhotoList = fileService.findAllByBoard(id);
        // List<Photo> dbPhotoList = fileService.findAllByBoard(id);

        // 전달받은 파일
        List<MultipartFile> multipartList = mtfRequest.getFiles("files");

        // 새롭게 전달되어온 파일들의 목록을 저장할 List
        List<MultipartFile> addFileList = new ArrayList<>();

        if(CollectionUtils.isEmpty(dbPhotoList)) {  // DB에 아예 존재하지 않는다면
            if(!CollectionUtils.isEmpty(multipartList)) {   // 전달받은 파일이 하나라도 존재한다면
                for(MultipartFile multipartFile : multipartList)
                    addFileList.add(multipartFile); // 저장할 파일 목록에 추가해줌
            }
        } else {    // DB에 한 장 이상 존재한다면
            // DB에 저장된 파일 원본명 목록
            List<String> dbOriginNameList = new ArrayList<>();

            // DB 파일 원본명 추출
            for(PhotoResponseDto dbPhoto : dbPhotoList) {
                // file id로 DB에 저장된 파일 정보 가져오기
                PhotoDto dbPhotoDto = fileService.findByFileId(dbPhoto.getFileId());
                // DB 파일 원본명 가져오기
                String dbOrigFileName = dbPhotoDto.getOrigFileName();

                if(!multipartList.contains(dbOrigFileName)) {   // 서버에 저장된 파일 중 전달받은 파일이 존재하지 않을 때
                    fileService.deletePhoto(dbPhoto.getFileId());   // 파일 삭제
                } else {
                    dbOriginNameList.add(dbOrigFileName);   // DB에 저장할 파일 목록에 추가하기
                }
            }

            for(MultipartFile multipartFile : multipartList) {  // 전달받은 파일을 하나씩 검사
                // 파일 원본명 얻기
                String multipartOrigName = multipartFile.getOriginalFilename();
                if(!dbOriginNameList.contains(multipartOrigName)) { // DB에 없는 파일일 때
                    addFileList.add(multipartFile);     // DB에 저장할 파일 목록에 추가하기
                }
            }
        }

        // 각각의 인자로 게시글의 id, 수정할 정보, DB에 저장할 파일 목록 넘겨주기
        reviewRegisterService.update(id, requestDto, addFileList);
        return "/review/reviewDetail";
    }


    //조회 ( 전체 목록 )
    @GetMapping("/reviews")
    @ResponseBody
    public String searchAllDesc(Model model) {
        // 게시글 전체 조회
        List<Review> reviewList = reviewRegisterService.findAllByOrderByCreatedAtDesc();

        System.out.println("reviewList = " + reviewList);

        // 반환할 List<BoardListResponseDto> 생성
        List<Photo> fileList = fileService.findAll();
        List<ReviewListResponseDto> responseDtoList = new ArrayList<>();

        // 전체 조회하여 획득한 각 게시글 객체를 이용해 BoardListResponseDto 생성
        for (Review review : reviewList) {
            ReviewListResponseDto responseDto = new ReviewListResponseDto(review, fileList);
            responseDtoList.add(responseDto);
        }
        System.out.println("responseDtoList = " + responseDtoList);

        model.addAttribute("reviewList", responseDtoList);

        return "/review/reviewList";
    }

    // 조회 ( 개별 )
    @GetMapping("/review/{id}")
    public String searchById(@PathVariable Long id, Model model) {
        // 게시글 id로 해당 게시글 첨부파일 전체 조회
        List<PhotoResponseDto> photoResponseDtoList = fileService.findAllByBoard(id);
        System.out.println("photoResponseDtoList.toString() = " + photoResponseDtoList.toString());
        // 게시글 첨부파일 id 담을 List 객체 생성
        List<Long> photoId = new ArrayList<>();
        // 각 첨부파일 id 추가
        for (PhotoResponseDto photoResponseDto : photoResponseDtoList)
            photoId.add(photoResponseDto.getFileId());

        // 게시글 id와 첨부파일 id 목록을 전달받아 결과 반환
        ReviewResponseDto reviewResponseDto = reviewRegisterService.searchById(id, photoId);
        model.addAttribute("review", reviewResponseDto);
        model.addAttribute("photoList", photoResponseDtoList);

        System.out.println("reviewResponseDto+photoResponseDtoList = " + reviewResponseDto + photoResponseDtoList);
        return "/review/reviewDetail";
    }

    // 삭제
    @DeleteMapping("/review/{id}")
    public void delete(@PathVariable Long id) {
        reviewRegisterService.delete(id);
    }


}




