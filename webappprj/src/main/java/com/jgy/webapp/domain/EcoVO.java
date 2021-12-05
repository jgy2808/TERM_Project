package com.jgy.webapp.domain;

public class EcoVO {
/*
ECO_NUM      NOT NULL NUMBER(38)    
ECO_NAME              VARCHAR2(15)  
ECO_CATEGORY          CHAR(1)       
ECO_URL               VARCHAR2(200) 
ECO_CONTENTS          VARCHAR2(500) 
 */
	
	private int eco_num;
	private String eco_name;
	private char eco_category;
	private String eco_url;
	private String eco_contents;
	
	
	public int getEco_num() {
		return eco_num;
	}
	public void setEco_num(int eco_num) {
		this.eco_num = eco_num;
	}
	public String getEco_name() {
		return eco_name;
	}
	public void setEco_name(String eco_name) {
		this.eco_name = eco_name;
	}
	public char getEco_category() {
		return eco_category;
	}
	public void setEco_category(char eco_category) {
		this.eco_category = eco_category;
	}
	public String getEco_url() {
		return eco_url;
	}
	public void setEco_url(String eco_url) {
		this.eco_url = eco_url;
	}
	public String getEco_contents() {
		return eco_contents;
	}
	public void setEco_contents(String eco_contents) {
		this.eco_contents = eco_contents;
	}
	
	
}
