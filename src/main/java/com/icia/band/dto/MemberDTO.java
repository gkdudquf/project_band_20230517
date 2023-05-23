package com.icia.band.dto;

import lombok.Data;

@Data
public class MemberDTO {
    private Long id;
    private String memberEmail;
    private String memberPassword;
    private String memberNickname;
    private String memberName;
    private String memberBirth;
    private String memberAddress;
    private String memberGender;
    private String memberMobile;
}
