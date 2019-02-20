package com.domain;

import java.sql.Date;

public class Notice {

	// Field
	private String notice_id;
	private String notice_content;
	private Date notice_regDate;
	private String admin_id;
	
	// Getter
	public String getNotice_id() {
		return notice_id;
	}
	
	public String getNotice_content() {
		return notice_content;
	}
	
	public Date getNotice_regDate() {
		return notice_regDate;
	}
	
	public String getAdmin_id() {
		return admin_id;
	}

	// Setter
	public void setNotice_id(String notice_id) {
		this.notice_id = notice_id;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public void setNotice_regDate(Date notice_regDate) {
		this.notice_regDate = notice_regDate;
	}

	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
}
