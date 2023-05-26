package com.icia.band.dto;

import lombok.Data;


@Data
public class JoinMemberDTO {
    private Long    id;
    private Long    joinMemberId;
    private String  joinMemberNickname;
    private Long    joinGroupId;
    private String  joinGroupName;
}
