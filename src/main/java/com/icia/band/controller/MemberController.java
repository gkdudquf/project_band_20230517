package com.icia.band.controller;

import com.icia.band.dto.MemberDTO;
import com.icia.band.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.lang.reflect.Member;

@Controller
@RequestMapping("/member")
public class MemberController {
    @Autowired
    private MemberService memberService;


    @PostMapping("/emailCheck")
    public ResponseEntity emailCheck(@RequestParam("memberEmail") String memberEmail) {
        System.out.println("memberEmail = " + memberEmail);
        MemberDTO memberDTO = memberService.emailCheck(memberEmail);
        System.out.println("memberDTO = " + memberDTO);
        if (memberDTO == null) {
            return new ResponseEntity<>(HttpStatus.OK);
        } else {
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

    @GetMapping("/save")
    public String saveForm() {
        return "/memberPages/memberSave";
    }

    @PostMapping("/save")
    public String memberSave(@ModelAttribute MemberDTO memberDTO) {
        memberService.memberSave(memberDTO);
        return "/memberPages/memberLogin";
    }


    @PostMapping("/login")
    public ResponseEntity login(@ModelAttribute MemberDTO memberDTO, HttpSession session) {
        MemberDTO dto = memberService.loginCheck(memberDTO);
        System.out.println("dto = " + dto);

        return new ResponseEntity<>(dto,HttpStatus.OK);

    }




//    @PostMapping("/login")
//    public String login(@ModelAttribute MemberDTO memberDTO, HttpSession session) {
//        MemberDTO dto = memberService.loginCheck(memberDTO);
//        System.out.println("dto = " + dto);
//        if (dto == null) {
//            return "/index";
//        } else {
//            session.setAttribute("loginNickname", dto.getMemberNickname());
//            session.setAttribute("loginLocal", dto.getMemberLocal());
//            return "/groupPages/myGroupList";
//        }
//    }


    @GetMapping("/myInfo")
    public String myPageForm(HttpSession session, Model model) {
        String memberNickname = (String) session.getAttribute("loginNickname");
        MemberDTO memberDTO = memberService.nicknameCheck(memberNickname);
        model.addAttribute("member", memberDTO);
        return "/memberPages/myInfo";
    }

    @GetMapping("logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }



}