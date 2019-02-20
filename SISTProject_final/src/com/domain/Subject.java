package com.domain;

public class Subject {
	// Field
	private String subject_id;			// 과목 아이디
	private String subject_name;		// 과목 이름
	private int count_;					// 삭제 가능 여부

	// Getter
	public String getSubject_id() {
		return subject_id;
	}

	public String getSubject_name() {
		return subject_name;
	}

	public int getCount_() {
		return count_;
	}

	// Setter
	public void setSubject_id(String subject_id) {
		this.subject_id = subject_id;
	}

	public void setSubject_name(String subject_name) {
		this.subject_name = subject_name;
	}

	public void setCount_(int count_) {
		this.count_ = count_;
	}

}
