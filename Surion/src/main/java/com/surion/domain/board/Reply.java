package com.surion.domain.board;

import java.time.LocalDateTime;

public class Reply {
    private Long id;
    private String username;
    private String title;
    private String content;

    private int ref;
    private int level;
    private int step;
    private LocalDateTime uploadDate;
}
