package com.domain;

import java.sql.Date;

public class OpenCourse {
	
	private String open_course_id;			// 개설 과정 아이디
	private String classroom_id;			// 강의실 아이디
	private String classroom_name;			// 강의실 이름
	private String course_id;				// 과정 아이디
	private String course_name;				// 과정 이름
	private Date open_course_start_date;	// 개설 과정 시작일
	private Date open_course_end_date;		// 개설 과정 종료일
	private String subject_list;			// 개설 과목명
	private int open_subject_count;			// 개설 과목 등록 갯수
	private String student_id;				// 수강생 아이디
	private String student_name;			// 수강생 이름
	private String student_phone;			// 수강생 전화번호
	private int student_count;				// 수강생 등록 인원
	private int count_;						// 삭제 가능 여부
	private String completion_status;		// 수료 여부
	private Date dropout_date;				// 수료or탈락 날짜
	private int percent; 					// 진행률

	// Getter
	public String getOpen_course_id() {
		return open_course_id;
	}

	public String getClassroom_id() {
		return classroom_id;
	}

	public String getClassroom_name() {
		return classroom_name;
	}

	public String getCourse_id() {
		return course_id;
	}

	public String getCourse_name() {
		return course_name;
	}

	public Date getOpen_course_start_date() {
		return open_course_start_date;
	}

	public Date getOpen_course_end_date() {
		return open_course_end_date;
	}

	public String getSubject_list() {
		return subject_list;
	}

	public int getOpen_subject_count() {
		return open_subject_count;
	}

	public String getStudent_id() {
		return student_id;
	}

	public String getStudent_name() {
		return student_name;
	}

	public String getStudent_phone() {
		return student_phone;
	}

	public int getStudent_count() {
		return student_count;
	}

	public int getCount_() {
		return count_;
	}

	public String getCompletion_status() {
		return completion_status;
	}

	public Date getDropout_date() {
		return dropout_date;
	}

	public int getPercent() {
		return percent;
	}

	// Setter
	public void setOpen_course_id(String open_course_id) {
		this.open_course_id = open_course_id;
	}

	public void setClassroom_id(String classroom_id) {
		this.classroom_id = classroom_id;
	}

	public void setClassroom_name(String classroom_name) {
		this.classroom_name = classroom_name;
	}

	public void setCourse_id(String course_id) {
		this.course_id = course_id;
	}

	public void setCourse_name(String course_name) {
		this.course_name = course_name;
	}

	public void setOpen_course_start_date(Date open_course_start_date) {
		this.open_course_start_date = open_course_start_date;
	}

	public void setOpen_course_end_date(Date open_course_end_date) {
		this.open_course_end_date = open_course_end_date;
	}

	public void setSubject_list(String subject_list) {
		this.subject_list = subject_list;
	}

	public void setOpen_subject_count(int open_subject_count) {
		this.open_subject_count = open_subject_count;
	}

	public void setStudent_id(String student_id) {
		this.student_id = student_id;
	}

	public void setStudent_name(String student_name) {
		this.student_name = student_name;
	}
	
	public void setStudent_phone(String student_phone) {
		this.student_phone = student_phone;
	}

	public void setStudent_count(int student_count) {
		this.student_count = student_count;
	}

	public void setCount_(int count_) {
		this.count_ = count_;
	}

	public void setCompletion_status(String completion_status) {
		this.completion_status = completion_status;
	}

	public void setDropout_date(Date dropout_date) {
		this.dropout_date = dropout_date;
	}

	public void setPercent(int percent) {
		this.percent = percent;
	}	

}