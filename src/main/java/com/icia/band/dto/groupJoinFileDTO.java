package com.icia.band.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class groupJoinFileDTO {
    private Long            id;
    private String          groupName;
    private String          groupInfo;
    private String          createMemberNickname;
    private String          createMemberLocal;
    private MultipartFile   groupProfileFile;
    private String          originalFileName;
    private String          storedFileName;
    private Long            groupId;
}
