package com.aia.board2.service;

import com.aia.board2.model.MemberDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberService {
    @Autowired
    private SqlSession session;
    private final String NAMESPACE = "board2.MemberMapper";

    public boolean validateUsername(MemberDTO memberDTO) {
        return session.selectOne(NAMESPACE + ".validateUsername", memberDTO) == null;
    }

    public void register(MemberDTO memberDTO) {
        session.insert(NAMESPACE + ".register", memberDTO);
    }

    public MemberDTO auth(MemberDTO memberDTO) {
        return session.selectOne(NAMESPACE + ".auth", memberDTO);
    }

    public void update(MemberDTO memberDTO) {
        session.update(NAMESPACE + ".update", memberDTO);
    }
}

















