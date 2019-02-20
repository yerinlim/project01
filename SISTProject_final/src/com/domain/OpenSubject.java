package com.domain;

import java.sql.Date;

public class OpenSubject {
	
	// Field
	private String open_subject_id;			// 개설 과목 아이디
	private String subject_id;				// 과목 아이디
	private String subject_name;			// 과목 이름
	private String subjectbook_id;			// 교재 아이디
	private String subjectbook_name;		// 교재 이름
	private String subjectbook_isbn;		// 교재 ISBN
	private String instructor_id;			// 강사 아이디
	private String instructor_name;			// 강사 이름
	private String student_id;				// 수강생 아이디
	private String open_course_id;			// 개설 과정 아이디
	private String course_name;				// 과정 이름
	private Date subject_start_date;		// 과목 시작일
	private Date subject_end_date;			// 과목 종료일
	private Date open_course_start_date;	// 개설 과정 시작일
	private Date open_course_end_date;		// 개설 과정 종료일
	private String classroom_name;			// 강의실 이름
	private int max_number;					// 강의실 최대 정원
	private int student_count;				// 수강생 등록 인원
	private int dropout_count;				// 중도 탈락 인원
	private String instructor_status;		// 강사 진행 여부(강의진행전, 강의진행중, 강의종료)
	private int count_;						// 삭제 가능 여부
	private String completion; 				// 진행 여부
	private String[] check_subject;			// check박스 임시 저장
	
	public String[] getCheck_subject() {
		return check_subject;
	}

	public void setCheck_subject(String[] check_subject) {
		this.check_subject = check_subject;
	}

	// Getter
	public String getOpen_subject_id() {
		return open_subject_id;
	}

	public String getSubject_id() {
		return subject_id;
	}

	public String getSubject_name() {
		return subject_name;
	}

	public String getSubjectbook_id() {
		return subjectbook_id;
	}

	public String getSubjectbook_name() {
		return subjectbook_name;
	}

	public String getSubjectbook_isbn() {
		return subjectbook_isbn;
	}

	public String getInstructor_id() {
		return instructor_id;
	}

	public String getInstructor_name() {
		return instructor_name;
	}

	public String getStudent_id() {
		return student_id;
	}

	public String getOpen_course_id() {
		return open_course_id;
	}

	public String getCourse_name() {
		return course_name;
	}

	public Date getSubject_start_date() {
		return subject_start_date;
	}

	public Date getSubject_end_date() {
		return subject_end_date;
	}

	public Date getOpen_course_start_date() {
		return open_course_start_date;
	}

	public Date getOpen_course_end_date() {
		return open_course_end_date;
	}

	public String getClassroom_name() {
		return classroom_name;
	}

	public int getMax_number() {
		return max_number;
	}
	
	public int getStudent_count() {
		return student_count;
	}

	public String getInstructor_status() {
		return instructor_status;
	}

	public int getDropout_count() {
		return dropout_count;
	}
	
	public int getCount_() {
		return count_;
	}
	
	public String getCompletion() {
		return completion;
	}

	// Setter
	public void setOpen_subject_id(String open_subject_id) {
		this.open_subject_id = open_subject_id;
	}

	public void setSubject_id(String subject_id) {
		this.subject_id = subject_id;
	}

	public void setSubject_name(String subject_name) {
		this.subject_name = subject_name;
	}

	public void setSubjectbook_id(String subjectbook_id) {
		this.subjectbook_id = subjectbook_id;
	}

	public void setSubjectbook_name(String subjectbook_name) {
		this.subjectbook_name = subjectbook_name;
	}

	public void setSubjectbook_isbn(String subjectbook_isbn) {
		this.subjectbook_isbn = subjectbook_isbn;
	}

	public void setInstructor_id(String instructor_id) {
		this.instructor_id = instructor_id;
	}

	public void setInstructor_name(String instructor_name) {
		this.instructor_name = instructor_name;
	}

	public void setStudent_id(String student_id) {
		this.student_id = student_id;
	}

	public void setOpen_course_id(String open_course_id) {
		this.open_course_id = open_course_id;
	}

	public void setCourse_name(String course_name) {
		this.course_name = course_name;
	}

	public void setSubject_start_date(Date subject_start_date) {
		this.subject_start_date = subject_start_date;
	}

	public void setSubject_end_date(Date subject_end_date) {
		this.subject_end_date = subject_end_date;
	}

	public void setOpen_course_start_date(Date open_course_start_date) {
		this.open_course_start_date = open_course_start_date;
	}

	public void setOpen_course_end_date(Date open_course_end_date) {
		this.open_course_end_date = open_course_end_date;
	}

	public void setClassroom_name(String classroom_name) {
		this.classroom_name = classroom_name;
	}

	public void setMax_number(int max_number) {
		this.max_number = max_number;
	}	
	
	public void setStudent_count(int student_count) {
		this.student_count = student_count;
	}

	public void setInstructor_status(String instructor_status) {
		this.instructor_status = instructor_status;
	}

	public void setDropout_count(int dropout_count) {
		this.dropout_count = dropout_count;
	}
	
	public void setCount_(int count_) {
		this.count_ = count_;
	}
	
	public void setCompletion(String completion) {
		this.completion = completion;
	}
}