package com.icia.band.service;

import com.icia.band.dto.MemberDTO;
import com.icia.band.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {

    @Autowired
    private MemberRepository memberRepository;

    public MemberDTO emailCheck(String memberEmail) {
        return memberRepository.emailCheck(memberEmail);
    }
    public MemberDTO loginCheck(MemberDTO memberDTO) {
        return memberRepository.loginCheck(memberDTO);
    }


}
