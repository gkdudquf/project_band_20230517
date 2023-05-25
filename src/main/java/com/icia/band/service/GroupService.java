package com.icia.band.service;

import com.icia.band.dto.GroupDTO;
import com.icia.band.repository.GroupRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GroupService {
    @Autowired
    private GroupRepository groupRepository;

    public GroupDTO groupNameCheck(String groupName) {
        return groupRepository.groupNameCheck(groupName);
    }
}
