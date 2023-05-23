package com.icia.band.repository;

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
        return sql.selectOne("Member.save", memberDTO);
    }


}