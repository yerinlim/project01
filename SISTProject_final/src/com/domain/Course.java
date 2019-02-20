package com.domain;

public class Course {
	// Field
	private String course_id;		// 과정 아이디
	private String course_name;		// 과정 이름
	private int count_;				// 삭제 가능 여부
	
	// Getter
	public String getCourse_id() {
		return course_id;
	}

	public String getCourse_name() {
		return course_name;
	}

	public int getCount_() {
		return count_;
	}

	// Setter
	public void setCourse_id(String course_id) {
		this.course_id = course_id;
	}
	
	public void setCourse_name(String course_name) {
		this.course_name = course_name;
	}

	public void setCount_(int count_) {
		this.count_ = count_;
	}
}
