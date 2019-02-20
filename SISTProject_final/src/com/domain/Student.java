package com.domain;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class Student {

	// Field
	private String student_id;				// 수강생 아이디
	private String student_photo_id;		// 수강생 사진 아이디
	private String student_name;			// 수강생 이름
	private String student_phone;			// 수강생 휴대폰번호
	private Date student_regDate;			// 수강생 등록일
	private String student_pw;				// 수강생 비밀번호
	private String student_new_pw;			// 수강생 새 비밀번호
	private String student_new_pw2;			// 수강생 새 비밀번호 확인용
	private String completion_status;		// 수료 여부(수료 예정, 수료 완료, 중도 탈락)
	private String open_course_id;			// 개설 과정 아이디
	private Date dropout_date;				// 중도 탈락일
	private String student_photo_filepath;	// 수강생 사진 경로
	private MultipartFile student_photo_file;
	private int count_;						// 삭제 가능 여부
	private Date completion_date; 			//수료 날짜

	// Getter
	public String getStudent_id() {
		return student_id;
	}

	public String getStudent_photo_id() {
		return student_photo_id;
	}
	
	public String getStudent_name() {
		return student_name;
	}

	public String getStudent_phone() {
		return student_phone;
	}

	public Date getStudent_regDate() {
		return student_regDate;
	}

	public String getStudent_pw() {
		return student_pw;
	}

	public String getStudent_new_pw() {
		return student_new_pw;
	}
	
	public String getStudent_new_pw2() {
		return student_new_pw2;
	}

	public String getCompletion_status() {
		return completion_status;
	}

	public String getOpen_course_id() {
		return open_course_id;
	}

	public Date getDropout_date() {
		return dropout_date;
	}
	
	public String getStudent_photo_filepath() {
		return student_photo_filepath;
	}

	public MultipartFile getStudent_photo_file() {
		return student_photo_file;
	}

	public int getCount_() {
		return count_;
	}
	
	public Date getCompletion_date() {
		return completion_date;
	}

	// Setter
	public void setDropout_date(Date dropout_date) {
		this.dropout_date = dropout_date;
	}

	public void setStudent_id(String student_id) {
		this.student_id = student_id;
	}

	public void setStudent_photo_id(String student_photo_id) {
		this.student_photo_id = student_photo_id;
	}

	public void setStudent_name(String student_name) {
		this.student_name = student_name;
	}

	public void setStudent_phone(String student_phone) {
		this.student_phone = student_phone;
	}

	public void setStudent_regDate(Date student_regDate) {
		this.student_regDate = student_regDate;
	}

	public void setStudent_pw(String student_pw) {
		this.student_pw = student_pw;
	}

	public void setStudent_new_pw(String student_new_pw) {
		this.student_new_pw = student_new_pw;
	}

	public void setStudent_new_pw2(String student_new_pw2) {
		this.student_new_pw2 = student_new_pw2;
	}

	public void setCompletion_status(String completion_status) {
		this.completion_status = completion_status;
	}

	public void setOpen_course_id(String open_course_id) {
		this.open_course_id = open_course_id;
	}

	public void setStudent_photo_filepath(String student_photo_filepath) {
		this.student_photo_filepath = student_photo_filepath;
	}

	public void setStudent_photo_file(MultipartFile student_photo_file) {
		this.student_photo_file = student_photo_file;
	}

	public void setCount_(int count_) {
		this.count_ = count_;
	}

	public void setCompletion_date(Date completion_date) {
		this.completion_date = completion_date;
	}
}