package com.icia.band.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/group")
public class GroupController {

    @GetMapping("/list")
    public String groupList(@RequestParam("memberLocal") String memberLocal) {
        return "/groupPages/list";
    }
}
