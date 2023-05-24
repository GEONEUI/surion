package com.surion.domain.Image;

import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class PhotoResponseDto {
    private Long fileId;
    private String origFileName;
    private String filePath;
    private Long fileSize;

    public PhotoResponseDto(Photo entity){
        this.fileId = entity.getId();
        this.origFileName = entity.getOrigFileName();
        this.filePath = entity.getFilePath();
        this.fileSize = entity.getFileSize();
    }

    @Override
    public String toString() {
        return "PhotoResponseDto{" +
                "fileId=" + fileId +
                ", origFileName='" + origFileName + '\'' +
                ", filePath='" + filePath + '\'' +
                ", fileSize=" + fileSize +
                '}';
    }
}
