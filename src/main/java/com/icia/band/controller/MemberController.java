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

    @GetMapping("save")
    public String saveForm() {
        return "/memberPages/save";
    }

    @PostMapping("/emailCheck")
    public ResponseEntity emailCheck(@RequestParam("memberEmail") String memberEmail) {
        MemberDTO memberDTO = memberService.emailCheck(memberEmail);
        if (memberDTO == null) {
            return new ResponseEntity<>(HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.CONFLICT);
        }
    }


    @PostMapping("login")
    public ResponseEntity login(@ModelAttribute MemberDTO memberDTO, HttpSession session) {
        MemberDTO dto = memberService.loginCheck(memberDTO);
    }

    @GetMapping("/mypages")
    public String mypage(@RequestParam("email") String email) {

    }
}
