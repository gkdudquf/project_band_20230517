package com.icia.band.service;

import com.icia.band.dto.*;
import com.icia.band.repository.GroupRepository;
import com.icia.band.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.IOException;
import java.util.List;

@Service
public class GroupService {
    @Autowired
    private GroupRepository groupRepository;
    @Autowired
    private MemberRepository memberRepository;

    public String groupNameCheck(String groupName) {
        return groupRepository.groupNameCheck(groupName);
    }

    public void save(GroupDTO groupDTO, MemberDTO memberDTO) throws IOException {
        JoinMemberDTO joinMemberDTO = new JoinMemberDTO();
        joinMemberDTO.setJoinMemberId(memberDTO.getId());
        joinMemberDTO.setJoinMemberNickname(memberDTO.getMemberNickname());
        joinMemberDTO.setJoinGroupId(groupDTO.getId());
        joinMemberDTO.setJoinGroupName(groupDTO.getGroupName());
        memberRepository.joinMemberSave(joinMemberDTO);

        if (groupDTO.getGroupProfileFile().isEmpty()) {
            groupDTO.setCreateMemberNickname(memberDTO.getMemberNickname());
            groupDTO.setCreateMemberLocal(memberDTO.getMemberLocal());
            groupRepository.save(groupDTO);

        } else {
            groupDTO.setCreateMemberNickname(memberDTO.getMemberNickname());
            groupDTO.setCreateMemberLocal(memberDTO.getMemberLocal());
            GroupDTO dto = groupRepository.save(groupDTO);
            String originalFilename = groupDTO.getGroupProfileFile().getOriginalFilename();
            String storedFileName = System.currentTimeMillis() + "-" + originalFilename;
            GroupFileDTO groupFileDTO = new GroupFileDTO();
            groupFileDTO.setOriginalFileName(originalFilename);
            groupFileDTO.setStoredFileName(storedFileName);
            groupFileDTO.setGroupId(dto.getId());
            String savePath = "C:\\Users\\user\\Desktop\\인천일보\\2. 수업\\5.개인프로젝트(band)\\groupProfileFile\\" + storedFileName;
            groupDTO.getGroupProfileFile().transferTo(new File(savePath));
            groupRepository.saveFile(groupFileDTO);
        }
    }

    public List<groupJoinFileDTO> groupFindAll() {
        return groupRepository.groupFindAll();
    }


}
