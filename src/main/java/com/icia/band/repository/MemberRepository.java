package com.icia.band.repository;

import com.icia.band.dto.JoinMemberDTO;
import com.icia.band.dto.MemberDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberRepository {

    @Autowired
    private SqlSessionTemplate sql;

    public MemberDTO emailCheck(String memberEmail) {
        return sql.selectOne("Member.emailCheck", memberEmail);
    }
    public MemberDTO loginCheck(MemberDTO memberDTO) {
        return sql.selectOne("Member.loginCheck", memberDTO);
    }


    public MemberDTO nicknameCheck(String memberNickname) {
        return sql.selectOne("Member.nicknameCheck", memberNickname);
    }

    public void memberSave(MemberDTO memberDTO) {
        sql.insert("Member.memberSave", memberDTO);
    }


    public void joinMemberSave(JoinMemberDTO joinMemberDTO) {
        sql.insert("Member.joinMemberSave", joinMemberDTO);
    }
}