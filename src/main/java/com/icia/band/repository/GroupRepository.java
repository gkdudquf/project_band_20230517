package com.icia.band.repository;

import com.icia.band.dto.GroupDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GroupRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public GroupDTO groupNameCheck(String groupName) {
        return sql.selectOne("Group.groupNameCheck", groupName);
    }
}
