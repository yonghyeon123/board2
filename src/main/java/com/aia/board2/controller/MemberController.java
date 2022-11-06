package com.aia.board2.controller;

import com.aia.board2.model.MemberDTO;
import com.aia.board2.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/member/")
public class MemberController {
    @Autowired
    MemberService service;

    // 1. 회원 가입 페이지 이동 메소드
    @RequestMapping(value = "register", method = RequestMethod.GET)
    public String moveToRegister() {
        return "/member/register";
    }

    // 2. 회원 가입 메소드
    @PostMapping(value = "register")
    public String register(Model model, MemberDTO memberDTO) {
        if (!service.validateUsername(memberDTO)) {
            model.addAttribute("message", "중복된 아이디입니다.");
            model.addAttribute("memberDTO", memberDTO);

            return "/member/register";
        }

        service.register(memberDTO);

        return "redirect:/";
    }

    // 3. 로그인 메소드
    @PostMapping(value = "auth")
    public String auth(HttpSession session, Model model, MemberDTO memberDTO) {
        MemberDTO logIn = service.auth(memberDTO);
        if (logIn != null) {
            session.setAttribute("logIn", logIn);
            return "redirect:/board/showAll/1";
        } else {
            return "redirect:/";
        }
    }

    // 4. 회원 정보 수정 페이지 이동 메소드
    @GetMapping("update")
    public String moveUpdatePage(HttpSession session, Model model) {
        if (session.getAttribute("logIn") == null) {
            return "redirect:/";
        }

        model.addAttribute("memberDTO", (MemberDTO) session.getAttribute("logIn"));

        return "/member/update";
    }

    // 5. 회원 정보 수정 메소드
    @PostMapping("update")
    public String update(HttpSession session, Model model, MemberDTO memberDTO, String newPassword) {
        System.out.println(memberDTO);
        if (service.auth(memberDTO) == null) {
            model.addAttribute("memberDTO", (MemberDTO) session.getAttribute("logIn"));
            model.addAttribute("message", "기존 비밀번호가 틀렸습니다.");
            return "/member/update";
        }

        MemberDTO logIn = (MemberDTO) session.getAttribute("logIn");
        if (!newPassword.isEmpty()) {
            logIn.setPassword(newPassword);
        }

        logIn.setNickname(memberDTO.getNickname());

        service.update(logIn);

        session.removeAttribute("logIn");
        return "redirect:/";
    }

    // 6. 회원 로그아웃 메소드
    @GetMapping("logOut")
    public String logOut(HttpSession session) {
        session.removeAttribute("logIn");
        return "redirect:/";
    }
}













