package com.surion.domain.board;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.time.LocalDateTime;

@Entity
@Getter@Setter
public class Board {

    @Id
    @Column(name="board_id")
    private Long id;
    private String username;
    private String title;
    private String content;

    private int ref;
    private int level;
    private int step;
    private LocalDateTime uploadDate;





}
