package com.aia.board2.service;

import com.aia.board2.model.BoardDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class BoardService {
    @Autowired
    private SqlSession session;
    private final String NAMESPACE = "board2.BoardMapper";

    public List<Map<Object, Object>> selectAll(int page, int size) {
        HashMap<String, Integer> limits = new HashMap<>();
        limits.put("start", (page - 1) * size);
        limits.put("size", size);

        return session.selectList(NAMESPACE + ".selectAll", limits);
    }

    public Map selectOne(int id) {
        return session.selectOne(NAMESPACE + ".selectOne", id);
    }

    public void insert(BoardDTO boardDTO) {
        session.insert(NAMESPACE + ".insert", boardDTO);
    }

    public void update(BoardDTO boardDTO) {
        session.update(NAMESPACE + ".update", boardDTO);
    }

    public void delete(int id) {
        session.delete(NAMESPACE + ".delete", id);
    }

    public int countAll() {
        return session.selectOne(NAMESPACE + ".countAll");
    }
}
