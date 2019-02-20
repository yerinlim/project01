package com.domain;

public class Subjectbook {
	// Field
	private String subjectbook_id;			// 교재 아이디
	private String subjectbook_name;		// 교재 이름
	private String subjectbook_isbn;		// 교재 ISBN
	private int count_;						// 삭제 가능 여부

	// Getter
	public String getSubjectbook_id() {
		return subjectbook_id;
	}

	public String getSubjectbook_name() {
		return subjectbook_name;
	}

	public String getSubjectbook_isbn() {
		return subjectbook_isbn;
	}

	public int getCount_() {
		return count_;
	}

	// Setter
	public void setSubjectbook_id(String subjectbook_id) {
		this.subjectbook_id = subjectbook_id;
	}

	public void setSubjectbook_name(String subjectbook_name) {
		this.subjectbook_name = subjectbook_name;
	}

	public void setSubjectbook_isbn(String subjectbook_isbn) {
		this.subjectbook_isbn = subjectbook_isbn;
	}

	public void setCount_(int count_) {
		this.count_ = count_;
	}
}
