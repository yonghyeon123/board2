package com.aia.board2.service;

import com.aia.board2.model.ReplyDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class ReplyService {
    @Autowired
    private SqlSession session;
    private final String NAMESPACE = "board2.ReplyMapper";

    public List selectAll(int boardId) {
        return session.selectList(NAMESPACE + ".selectAll", boardId);
    }

    public void insert(ReplyDTO replyDTO) {
        session.insert(NAMESPACE + ".insert", replyDTO);
    }

    public void update(ReplyDTO replyDTO) {
        session.update(NAMESPACE + ".update", replyDTO);
    }

    public void delete(int id) {
        session.delete(NAMESPACE + ".delete", id);
    }

    public Map countByBoardId() {
        return session.selectMap(NAMESPACE + ".countByBoardId", "boardId");
    }
}















