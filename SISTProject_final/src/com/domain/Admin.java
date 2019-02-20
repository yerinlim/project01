package com.domain;

import java.sql.Date;

public class Admin {

	// Field
	private String admin_id;			// 관리자 아이디
	private String admin_name;			// 관리자 이름
	private String admin_phone;			// 관리자 휴대폰 번호
	private Date admin_regDate;			// 관리자 등록일
	private String admin_pw;			// 관리자 비밀번호
	private String admin_new_pw;		// 관리자 새 비밀번호
	private String admin_grade;			// 관리자 등급
	private boolean admin_blind;		// 관리자 계정 잠금 여부
	private int count_;					// 삭제 가능 여부
	
	// Getter
	public String getAdmin_id() {
		return admin_id;
	}
	
	public String getAdmin_name() {
		return admin_name;
	}
	
	public String getAdmin_phone() {
		return admin_phone;
	}
	
	public Date getAdmin_regDate() {
		return admin_regDate;
	}
	
	public String getAdmin_pw() {
		return admin_pw;
	}
	
	public String getAdmin_new_pw() {
		return admin_new_pw;
	}
	
	public String getAdmin_grade() {
		return admin_grade;
	}
	
	public boolean isAdmin_blind() {
		return admin_blind;
	}
	
	public int getCount_() {
		return count_;
	}

	// Setter
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	
	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}
	
	public void setAdmin_phone(String admin_phone) {
		this.admin_phone = admin_phone;
	}
	
	public void setAdmin_regDate(Date admin_regDate) {
		this.admin_regDate = admin_regDate;
	}
	
	public void setAdmin_pw(String admin_pw) {
		this.admin_pw = admin_pw;
	}
	
	public void setAdmin_new_pw(String admin_new_pw) {
		this.admin_new_pw = admin_new_pw;
	}
	
	public void setAdmin_grade(String admin_grade) {
		this.admin_grade = admin_grade;
	}
	
	public void setAdmin_blind(boolean admin_blind) {
		this.admin_blind = admin_blind;
	}
	
	public void setCount_(int count_) {
		this.count_ = count_;
	}
}