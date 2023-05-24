package com.surion.service;

import com.surion.domain.Image.Photo;
import com.surion.domain.Image.PhotoDto;
import com.surion.domain.Image.PhotoResponseDto;
import com.surion.repository.PhotoRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityNotFoundException;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class PhotoService {
    private final PhotoRepository photoRepository;


    // 사진 저장
    public Photo save(Photo photo) {
        return photoRepository.save(photo);
    }

    // 개별 조회 ( 사진 아이디로 조회 )
    @Transactional(readOnly = true)
    public PhotoDto findByFileId(Long id) {
        Photo entity = photoRepository.findById(id)
                .orElseThrow(
                () -> new IllegalArgumentException("해당 파일이 존재하지 않습니다.")
        );
        PhotoDto photoDto = PhotoDto.builder()
                .origFileName(entity.getOrigFileName())
                .filePath(entity.getFilePath())
                .fileSize(entity.getFileSize())
                .build();
        return photoDto;
    }

    // 개별 조회 ( 리뷰 아이디로 조회 )
    @Transactional(readOnly = true)
    public List<Photo> findByReviewId(Long id) {
        return photoRepository.findByReviewId(id);
    }


    // 전체 조회
    @Transactional(readOnly = true)
    public List<Photo> findAll() { return photoRepository.findAll();
    }


    // 전체 조회 - 리뷰 아이디 기반 조회
    @Transactional(readOnly = true)
    public List<PhotoResponseDto> findAllByReviewId(Long reviewId) {
        List<Photo> photoList = photoRepository.findAllByReviewId(reviewId);

        return photoList.stream()
                .map(PhotoResponseDto::new)
                .collect(Collectors.toList());
    }

    // 삭제
    public void deletePhoto(Long fileId) {
        Photo photo = photoRepository.findById(fileId)
                .orElseThrow(() -> new EntityNotFoundException("Photo not found with id " + fileId));
        photoRepository.delete(photo);
    }



    //    public List<Photo> findAllById(Long reviewId){return photoRepository.findAllByReviewId(reviewId)};
//    @Value("${image.upload.dir}") // application.properties에서 이미지 업로드 경로 지정
//    private String uploadDir;

//    public void saveImages(List<MultipartFile> files) throws IOException {
//        for (MultipartFile file : files) {
//            String uploadDir ="/Users/deukkwonpark/_dev/soorion/SurionVer1/Surion/src/main/webapp/resources/images";
//            String fileName = file.getOriginalFilename();
//            File dest = new File(uploadDir + fileName);
//            file.transferTo(dest);
//        }
//    }


}
