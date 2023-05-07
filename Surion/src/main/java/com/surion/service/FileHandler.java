package com.surion.service;

import com.surion.domain.Image.Photo;
import com.surion.domain.Image.PhotoDto;
import com.surion.domain.review.Review;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;
import org.springframework.util.ObjectUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

/**
 * 목적 : 멀티파트를 이용한 파일업로드 처리 컴포넌트화
 * 주요 로직 :
 * 1. 전달된 MultipartFile 리스트에서 파일 데이터 추출
 * 2. 파일 확장자 및 파일명을 지정 ( 파일명 : 파일명 중복을 피하기 위해 나노초와 파일명 결합 )
 * 3. 파일 저장 경로 지정 ( 폴더명 : 날짜형식 YYYYMM, 경로 : resources/images/YYYYMM )
 * 4. 파일 저장 경로가 존재하지 않을 경우 폴더 생성
 * 5. 업로드한 파일 데이터를 저장 경로에 저장
 * 6. 파일 정보를 Photo 객체로 변환 후, 리스트에 추가
 * 7. Photo 객체 리스트 반환
 */


@Component
public class FileHandler {
    private final HttpServletRequest request;

    private final PhotoService photoService;

    public FileHandler(PhotoService photoService, HttpServletRequest request) {
        this.photoService = photoService;
        this.request = request;
    }


    public List<Photo> parseFileInfo(
            Review review,
            List<MultipartFile> multipartFiles
    )    throws Exception {
        List<Photo> fileList = new ArrayList<>();   // 반환할 파일 리스트


        /*
         ** 멀티파트 파일 존재할 경우, 값 처리 메소드
         */
        if(!CollectionUtils.isEmpty(multipartFiles)) {

            /*
             * 시간 선언 - ( 목적 : 폴더 이름으로 사용 )
             */
            LocalDateTime now = LocalDateTime.now();
            DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyyMMdd");
            String current_date = now.format(dateTimeFormatter);

            /*
             * 절대 경로 선언 - ( 프로젝트 디렉토리 내 저장을 위한 절대 경로 설정 )
             */
            String absolutePath = request.getSession().getServletContext().getRealPath("/");
            System.out.println("absolutePath = " + absolutePath);

            /*
             * 절대 경로 세부 지정 - ( 파일 저장할 세부 경로 지정 )
             */
            String path = "resources" + File.separator + "images" + File.separator + current_date;
            File file = new File(absolutePath + path);
            System.out.println("path = " + path);

            /*
             ** 다중 파일 저장
             */
            for(MultipartFile multipartFile : multipartFiles) {

                // 파일 확장자 추출
                String originalFileExtension;
                String contentType = multipartFile.getContentType();

                // 확장자명이 존재하지 않을 경우 처리하지 않음
                if(ObjectUtils.isEmpty(contentType)) {
                    break;
                } else {    // 확장자가 jpeg, png인 파일들만 받아 처리
                    if(contentType.contains("image/jpeg"))
                        originalFileExtension = ".jpg";
                    else if(contentType.contains("image/png"))
                        originalFileExtension = ".png";
                    else    // 다른 확장자일 경우 처리하지 않음
                        break;
                }

                // 파일 이름 변경 ( 파일명 중복 회피 위한 나노초 추출 및 조합 )
                String new_file_name = System.nanoTime() + originalFileExtension;

                // 파일 DTO 생성
                PhotoDto photoDto = PhotoDto.builder()
                        .origFileName(multipartFile.getOriginalFilename())
                        .filePath(path + File.separator + new_file_name)
                        .fileSize(multipartFile.getSize())
                        .build();

                // 파일 DTO를 이용해 Photo 엔티티 생성
                Photo photo = new Photo(
                        photoDto.getOrigFileName(),
                        photoDto.getFilePath(),
                        photoDto.getFileSize()
                );

                System.out.println("photo = " + photo);

                // 게시글에 존재하지 않는다면, 게시글에 사진 정보 저장
                if(review.getId() != null)
                    photo.setReview(review);

                // 생성 후 리스트에 추가
                fileList.add(photo);

                // 업로드 한 파일 데이터를 지정한 파일에 저장
                file = new File(absolutePath + path + File.separator + new_file_name);
                multipartFile.transferTo(file);

                System.out.println("photo = " + photo.getFilePath());
                System.out.println("file = " + file);

                // 파일 권한 설정(쓰기, 읽기)
                file.setWritable(true);
                file.setReadable(true);
            }
        } else {
            System.out.println("fileList + \"???\" = " + fileList + "???");
        }
        return fileList;
    }
}