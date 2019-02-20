package com.domain;

import java.sql.Date;

/**
 * @author SIST
 *
 */
public class Instructor {
	
	// Field
	private String instructor_id;				// 강사 아이디
	private String instructor_photo_id;			// 강사 사진 아이디
	private String instructor_name;				// 강사 이름
	private String instructor_phone;			// 강사 휴대폰 번호
	private Date instructor_regDate;			// 강사 등록일
	private String instructor_pw;				// 강사 비밀번호
	private String instructor_new_pw;			// 강사 새 비밀번호
	private String instructor_possible;			// 강의 가능 과목 나열
	private String instructor_photo_filepath;	// 강사 사진 경로
	private String subject_id;					// 과목 아이디
	private String subject_name;				// 과목 이름
	private int count_;							// 삭제 가능 여부
	private String instructor_pp;				// 강의 가능 과목 아이디

	// Getter
	public String getInstructor_id() {
		return instructor_id;
	}

	public String getInstructor_photo_id() {
		return instructor_photo_id;
	}
	
	public String getInstructor_name() {
		return instructor_name;
	}

	public String getInstructor_phone() {
		return instructor_phone;
	}

	public Date getInstructor_regDate() {
		return instructor_regDate;
	}

	public String getInstructor_pw() {
		return instructor_pw;
	}
	
	public String getInstructor_new_pw() {
		return instructor_new_pw;
	}
	
	public String getInstructor_possible() {
		return instructor_possible;
	}
	
	public String getInstructor_photo_filepath() {
		return instructor_photo_filepath;
	}

	public String getSubject_id() {
		return subject_id;
	}

	public String getSubject_name() {
		return subject_name;
	}
	
	public int getCount_() {
		return count_;
	}

	public String getInstructor_pp() {
		return instructor_pp;
	}

	// Setter	
	public void setInstructor_id(String instructor_id) {
		this.instructor_id = instructor_id;
	}

	public void setInstructor_photo_id(String instructor_photo_id) {
		this.instructor_photo_id = instructor_photo_id;
	}

	public void setInstructor_name(String instructor_name) {
		this.instructor_name = instructor_name;
	}

	public void setInstructor_phone(String instructor_phone) {
		this.instructor_phone = instructor_phone;
	}

	public void setInstructor_regDate(Date instructor_regDate) {
		this.instructor_regDate = instructor_regDate;
	}

	public void setInstructor_pw(String instructor_pw) {
		this.instructor_pw = instructor_pw;
	}

	public void setInstructor_new_pw(String instructor_new_pw) {
		this.instructor_new_pw = instructor_new_pw;
	}

	public void setInstructor_possible(String instructor_possible) {
		this.instructor_possible = instructor_possible;
	}

	public void setInstructor_photo_filepath(String instructor_photo_filepath) {
		this.instructor_photo_filepath = instructor_photo_filepath;
	}

	public void setSubject_id(String subject_id) {
		this.subject_id = subject_id;
	}

	public void setSubject_name(String subject_name) {
		this.subject_name = subject_name;
	}

	public void setCount_(int count_) {
		this.count_ = count_;
	}
	public void setInstructor_pp(String instructor_pp) {
		this.instructor_pp = instructor_pp;
	}

}
