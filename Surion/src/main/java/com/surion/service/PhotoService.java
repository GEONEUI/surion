package com.surion.service;

import com.surion.domain.Image.Photo;
import com.surion.domain.Image.PhotoDto;
import com.surion.repository.PhotoRepository;
import lombok.RequiredArgsConstructor;
import lombok.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Service
@RequiredArgsConstructor
public class PhotoService {
    private final PhotoRepository photoRepository;

    public List<Photo> findAll() { return photoRepository.findAll();
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

    @Transactional(readOnly = true)
    public PhotoDto findByFileId(Long id) {
        Photo entity = photoRepository.findById(id).orElseThrow(
                () -> new IllegalArgumentException("해당 파일이 존재하지 않습니다.")
        );
        PhotoDto photoDto = PhotoDto.builder()
                .origFileName(entity.getOrigFileName())
                .filePath(entity.getFilePath())
                .fileSize(entity.getFileSize())
                .build();
        return photoDto;
    }
}
