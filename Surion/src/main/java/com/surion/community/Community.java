package com.surion.community;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Entity
@Getter
@Setter
public class Community {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	
	private String board_id;
	private String board_title;
	private String board_content;
	private String board_loc;
	private Date create_date;
	private int board_like;
	private int board_comment;
}
