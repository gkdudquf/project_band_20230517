package com.icia.band.controller;

import com.icia.band.dto.GroupDTO;
import com.icia.band.dto.MemberDTO;
import com.icia.band.service.GroupService;
import com.icia.band.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
@RequestMapping("/group")
public class GroupController {

    @Autowired
    private GroupService groupService;
    @Autowired
    private MemberService memberService;

    @GetMapping("/save")
    public String groupSaveForm() {
        return "/groupPages/groupSave";
    }

    @PostMapping("/save")
    public String groupSave(@ModelAttribute GroupDTO groupDTO, HttpSession session) throws IOException {
        String memberNickname = (String) session.getAttribute("loginNickname");
        MemberDTO memberDTO = memberService.nicknameCheck(memberNickname);
        System.out.println("memberDTO = " + memberDTO);
        groupService.save(groupDTO, memberDTO);
        return "redirect:/group/myGroupList";
    }

    @GetMapping("/myGroupList")
    public String myGroupList() {
        return "/groupPages/myGroupList";
    }

    @PostMapping("/groupNameCheck")
    public ResponseEntity groupNameCheck(@RequestParam("groupName") String groupName) {
        System.out.println("groupName = " + groupName);
        String groupNameCheck = groupService.groupNameCheck(groupName);
        System.out.println("groupNameCheck = " + groupNameCheck);
        if (groupNameCheck == null) {
            return new ResponseEntity<>(HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.CONFLICT);
        }
    }





}
