package com.jgy.webapp.domain;

import java.util.Date;

import org.springframework.stereotype.Service;


public class BoardVO {
/*
BOARD_NUM      NOT NULL NUMBER(38)    
USERID                  VARCHAR2(20)  
BOARD_CATEGORY          CHAR(1)       
BOARD_TITLE             VARCHAR2(30)  
BOARD_CONTENTS          VARCHAR2(500) 
UPLOAD_DATE             DATE    
*/
	
	private int board_num;
	private String userid;
	private char board_category;
	private String board_title;
	private String board_contents;
	private Date upload_date;
	
	
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public char getBoard_category() {
		return board_category;
	}
	public void setBoard_category(char board_category) {
		this.board_category = board_category;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_contents() {
		return board_contents;
	}
	public void setBoard_contents(String board_contents) {
		this.board_contents = board_contents;
	}
	public Date getUpload_date() {
		return upload_date;
	}
	public void setUpload_date(Date upload_date) {
		this.upload_date = upload_date;
	}
}
