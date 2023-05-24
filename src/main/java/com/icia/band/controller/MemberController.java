package com.icia.band.controller;

import com.icia.band.dto.MemberDTO;
import com.icia.band.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/member")
public class MemberController {
    @Autowired
    private MemberService memberService;

    @GetMapping("/save")
    public String saveForm() {
        return "/memberPages/save";
    }

    @PostMapping("/emailCheck")
    public ResponseEntity emailCheck(@RequestParam("memberEmail") String memberEmail) {
        System.out.println("memberEmail = " + memberEmail);
        MemberDTO memberDTO = memberService.emailCheck(memberEmail);
        System.out.println("memberDTO = " + memberDTO);
        if (memberDTO == null) {
//            System.out.println("memberDTO = " + memberDTO);
            return new ResponseEntity<>(HttpStatus.OK);
        } else {
//            System.out.println("memberDTO = " + memberDTO);
            return new ResponseEntity<>(HttpStatus.CONFLICT);
        }
    }

    @PostMapping("/nicknameCheck")
    public ResponseEntity nicknameCheck(@RequestParam("memberNickname") String memberNickname) {
        System.out.println("memberNickname = " + memberNickname);
        MemberDTO memberDTO = memberService.nicknameCheck(memberNickname);
        System.out.println("memberDTO = " + memberDTO);
        if (memberDTO == null) {
            return new ResponseEntity<>(HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.CONFLICT);
        }
    }

    @PostMapping("/save")
    public String memberSave(@ModelAttribute MemberDTO memberDTO) {
        memberService.memberSave(memberDTO);
        return "/memberPages/login";
    }

    @PostMapping("login")
    public ResponseEntity login(@ModelAttribute MemberDTO memberDTO, HttpSession session) {
        MemberDTO dto = memberService.loginCheck(memberDTO);
        if (dto == null) {
            return new ResponseEntity<>(HttpStatus.CONFLICT);
        } else {
            session.setAttribute("loginNickname", dto.getMemberNickname());
            session.setAttribute("loginAddress", dto.getMemberLocal());
            return new ResponseEntity<>(HttpStatus.OK);
        }
    }



}