package com.icia.band.repository;

import com.icia.band.dto.GroupDTO;
import com.icia.band.dto.GroupFileDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GroupRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public String groupNameCheck(String groupName) {
        return sql.selectOne("Group.groupNameCheck", groupName);
    }

    public GroupDTO save(GroupDTO groupDTO) {
        sql.insert("Group.save", groupDTO);
        return groupDTO;
    }

    public void saveFile(GroupFileDTO groupFileDTO) {
        sql.insert("Group.saveFile", groupFileDTO);
    }
}
