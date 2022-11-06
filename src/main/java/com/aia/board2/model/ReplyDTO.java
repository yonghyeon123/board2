package com.aia.board2.model;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class ReplyDTO {
    private int id;
    private String content;
    private int boardId;
    private int writerId;
    private Timestamp entryDate;
    private Timestamp modifyDate;
}
