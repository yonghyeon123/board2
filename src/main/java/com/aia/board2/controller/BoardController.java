package com.aia.board2.controller;

import com.aia.board2.model.BoardDTO;
import com.aia.board2.model.MemberDTO;
import com.aia.board2.service.BoardService;
import com.aia.board2.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/board/")
public class BoardController {
    @Autowired
    BoardService boardService;
    @Autowired
    ReplyService replyService;
    private final int PAGE_SIZE = 15;

    @GetMapping(value = "showAll/{pageNo}")
    public String showAll(HttpSession session, Model model, @PathVariable int pageNo) {
        MemberDTO logIn = (MemberDTO) session.getAttribute("logIn");

        if (logIn == null) {
            return "redirect:/";
        }

        List<Map<Object, Object>> list = boardService.selectAll(pageNo, PAGE_SIZE);
        model.addAttribute("list", list);

        int totalCount = boardService.countAll();
        int totalPage = totalCount / PAGE_SIZE;
        if (totalCount % PAGE_SIZE != 0) {
            totalPage++;
        }

        int startPage = 1;
        int endPage = 5;

        if (pageNo > 3) {
            startPage = pageNo - 2;
            endPage = pageNo + 2;
        }
        if (pageNo > totalPage - 3) {
            startPage = totalPage - 4;
            endPage = totalPage;
        }
        if (totalPage < 5) {
            startPage = 1;
            endPage = totalPage;
        }
        Map replyBoardMap = replyService.countByBoardId();

        model.addAttribute("replyMap", replyBoardMap);
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("currentPage", pageNo);
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);

        return "/board/printAll";
    }

    @GetMapping("showOne/{id}")
    public String showOne(HttpSession session, Model model, @PathVariable int id) {
        if (session.getAttribute("logIn") == null) {
            return "redirect:/";
        }
        model.addAttribute("logIn", (MemberDTO) session.getAttribute("logIn"));

        if (boardService.selectOne(id) == null) {
            return "redirect:/board/selectAll";
        }

        model.addAttribute("boardDTO", boardService.selectOne(id));

        model.addAttribute("replyList", replyService.selectAll(id));

        return "/board/printOne";
    }

    @GetMapping("write")
    public String moveToWritePage() {
        return "/board/upsert";
    }

    @GetMapping("update/{id}")
    public String moveToUpsertPage(Model model, @PathVariable int id) {
        if (boardService.selectOne(id) != null) {
            model.addAttribute("boardDTO", boardService.selectOne(id));
            return "/board/upsert";
        }

        return "redirect:/";
    }

    @PostMapping("upsert")
    public String upsert(HttpSession session, BoardDTO boardDTO) {
        MemberDTO logIn = (MemberDTO) session.getAttribute("logIn");
        if (logIn == null) {
            return "redirect:/";
        }

        if (boardDTO.getId() == 0) {
            boardDTO.setWriterId(logIn.getId());
            boardService.insert(boardDTO);
        } else {
            Map<Object, Object> original = boardService.selectOne(boardDTO.getId());
            Integer writerId = (Integer) original.get("writerId");
            if (writerId == logIn.getId()) {
                boardService.update(boardDTO);
            }
        }

        return "redirect:/board/showOne/" + boardDTO.getId();
    }

    @GetMapping("delete/{id}")
    public String delete(@PathVariable int id) {
        boardService.delete(id);
        return "redirect:/board/showAll/1";
    }
}














