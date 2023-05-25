package com.icia.band.controller;

import com.icia.band.dto.GroupDTO;
import com.icia.band.service.GroupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/group")
public class GroupController {

    @Autowired
    private GroupService groupService;

    @GetMapping("/save")
    public String groupSaveForm() {
        return "/groupPages/groupSave";
    }

    @GetMapping("/myGroupList")
    public String myGroupList(HttpSession session, Model model) {
        return "/groupPages/myGroupList";
    }

    @PostMapping("/groupNameCheck")
    public ResponseEntity groupNameCheck (@RequestParam("groupName") String groupName) {
        GroupDTO groupDTO = groupService.groupNameCheck(groupName);
        System.out.println("groupDTO = " + groupDTO);
        if (groupDTO == null) {
            return new ResponseEntity<>(HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.CONFLICT);
        }
    }





}
