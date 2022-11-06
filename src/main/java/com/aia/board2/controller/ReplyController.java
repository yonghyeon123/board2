package com.aia.board2.controller;

import com.aia.board2.model.MemberDTO;
import com.aia.board2.model.ReplyDTO;
import com.aia.board2.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/reply/")
public class ReplyController {
    @Autowired
    private ReplyService replyService;

    @PostMapping("write/{boardId}")
    public String write(HttpSession session, ReplyDTO replyDTO) {
        MemberDTO logIn = (MemberDTO) session.getAttribute("logIn");
        if (logIn == null) {
            return "redirect:/";
        }


        replyDTO.setWriterId(logIn.getId());

        System.out.println(replyDTO);

        replyService.insert(replyDTO);

        return "redirect:/board/showOne/" + replyDTO.getBoardId();
    }
}
















