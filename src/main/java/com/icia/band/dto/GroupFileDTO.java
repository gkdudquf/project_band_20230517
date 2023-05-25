package com.icia.band.dto;

import lombok.Data;

@Data
public class GroupFileDTO {
    private Long id;
    private String originalFileName;
    private String storedFileName;
    private Long groupId;
}
