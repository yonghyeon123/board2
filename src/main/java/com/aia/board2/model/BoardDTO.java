package com.aia.board2.model;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class BoardDTO {
    private int id;
    private String title;
    private String content;
    private int writerId;
    private Timestamp entryDate;
    private Timestamp modifyDate;
}
