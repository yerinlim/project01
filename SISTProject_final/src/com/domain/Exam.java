package com.domain;

import java.sql.Date;

public class Exam {

	// Field
	private String exam_id; 				// 시험 아이디
	private String subject_point_id; 		// 과목별 배점 정보 아이디
	private String student_score_id;	 	// 수강생 성적 정보 아이디
	private String open_subject_id; 		// 개설 과목 아이디
	private String open_course_id; 			// 개설 과정 아이디
	private String subject_name; 			// 과목 이름
	private String subjectbook_name; 		// 교재 이름
	private Date subject_start_date; 		// 과목 시작일
	private Date subject_end_date; 			// 과목 종료일
	private String instructor_id; 			// 강사 아이디
	private String instructor_name; 		// 강사 이름
	private String instructor_phone; 		// 강사 휴대폰번호
	private int attendance_point; 			// 출결 배점
	private int write_point;				// 필기 배점
	private int skill_point; 				// 실기 배점
	private Date exam_date; 				// 시험 날짜
	private String exam_file; 				// 시험 문제 파일
	private String student_id; 				// 수강생 아이디
	private String student_name; 			// 수강생 이름
	private String student_phone; 			// 수강생 휴대폰번호
	private Date student_regDate; 			// 수강생 등록일
	private int attendance_score; 			// 출결 점수
	private int write_score; 				// 필기 점수
	private int skill_score; 				// 실기 점수
	private int total_score; 				// 총점
	private int class_count;			 	// 수강 횟수
	private int count_; 					// 삭제 가능 여부
	private String completion_status; 		// 수료 여부
	private Date completion_date;			// 수료 날짜
	private Date dropout_date; 				// 날짜(수료 or 중도탈락)
	private String score_status; 			// 성적 입력 여부(관리자 20번 참고)
	private int student_count;				// 학생 수
	private String subjectbook_isbn;
	private String student_photo_filepath;
	private String instructor_photo_filepath;
	
	// Getter
	public String getExam_id() {
		return exam_id;
	}

	public String getSubject_point_id() {
		return subject_point_id;
	}

	public String getStudent_score_id() {
		return student_score_id;
	}

	public String getOpen_subject_id() {
		return open_subject_id;
	}

	public String getOpen_course_id() {
		return open_course_id;
	}

	public String getSubject_name() {
		return subject_name;
	}

	public String getSubjectbook_name() {
		return subjectbook_name;
	}

	public Date getSubject_start_date() {
		return subject_start_date;
	}

	public Date getSubject_end_date() {
		return subject_end_date;
	}

	public String getInstructor_id() {
		return instructor_id;
	}

	public String getInstructor_name() {
		return instructor_name;
	}

	public String getInstructor_phone() {
		return instructor_phone;
	}

	public int getAttendance_point() {
		return attendance_point;
	}

	public int getWrite_point() {
		return write_point;
	}

	public int getSkill_point() {
		return skill_point;
	}

	public Date getExam_date() {
		return exam_date;
	}

	public String getExam_file() {
		return exam_file;
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

	public Date getStudent_regDate() {
		return student_regDate;
	}

	public int getAttendance_score() {
		return attendance_score;
	}

	public int getWrite_score() {
		return write_score;
	}

	public int getSkill_score() {
		return skill_score;
	}

	public int getTotal_score() {
		return total_score;
	}

	public int getClass_count() {
		return class_count;
	}

	public String getCompletion_status() {
		return completion_status;
	}

	public Date getCompletion_date() {
		return completion_date;
	}

	public Date getDropout_date() {
		return dropout_date;
	}

	public String getScore_status() {
		return score_status;
	}

	public int getStudent_count() {
		return student_count;
	}

	public String getSubjectbook_isbn() {
		return subjectbook_isbn;
	}

	public String getStudent_photo_filepath() {
		return student_photo_filepath;
	}

	public String getInstructor_photo_filepath() {
		return instructor_photo_filepath;
	}

	// Setter
	public void setExam_id(String exam_id) {
		this.exam_id = exam_id;
	}

	public void setSubject_point_id(String subject_point_id) {
		this.subject_point_id = subject_point_id;
	}

	public void setStudent_score_id(String student_score_id) {
		this.student_score_id = student_score_id;
	}

	public void setOpen_subject_id(String open_subject_id) {
		this.open_subject_id = open_subject_id;
	}

	public void setOpen_course_id(String open_course_id) {
		this.open_course_id = open_course_id;
	}

	public void setSubject_name(String subject_name) {
		this.subject_name = subject_name;
	}

	public void setSubjectbook_name(String subjectbook_name) {
		this.subjectbook_name = subjectbook_name;
	}

	public void setSubject_start_date(Date subject_start_date) {
		this.subject_start_date = subject_start_date;
	}

	public void setSubject_end_date(Date subject_end_date) {
		this.subject_end_date = subject_end_date;
	}

	public void setInstructor_id(String instructor_id) {
		this.instructor_id = instructor_id;
	}

	public void setInstructor_name(String instructor_name) {
		this.instructor_name = instructor_name;
	}

	public void setInstructor_phone(String instructor_phone) {
		this.instructor_phone = instructor_phone;
	}

	public int getCount_() {
		return count_;
	}

	public void setCount_(int count_) {
		this.count_ = count_;
	}

	public void setAttendance_point(int attendance_point) {
		this.attendance_point = attendance_point;
	}

	public void setWrite_point(int write_point) {
		this.write_point = write_point;
	}

	public void setSkill_point(int skill_point) {
		this.skill_point = skill_point;
	}

	public void setExam_date(Date exam_date) {
		this.exam_date = exam_date;
	}

	public void setExam_file(String exam_file) {
		this.exam_file = exam_file;
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

	public void setStudent_regDate(Date student_regDate) {
		this.student_regDate = student_regDate;
	}

	public void setAttendance_score(int attendance_score) {
		this.attendance_score = attendance_score;
	}

	public void setWrite_score(int write_score) {
		this.write_score = write_score;
	}

	public void setSkill_score(int skill_score) {
		this.skill_score = skill_score;
	}

	public void setTotal_score(int total_score) {
		this.total_score = total_score;
	}

	public void setClass_count(int class_count) {
		this.class_count = class_count;
	}

	public void setCompletion_status(String completion_status) {
		this.completion_status = completion_status;
	}
	
	public void setCompletion_date(Date completion_date) {
		this.completion_date = completion_date;
	}

	public void setDropout_date(Date dropout_date) {
		this.dropout_date = dropout_date;
	}

	public void setScore_status(String score_status) {
		this.score_status = score_status;
	}

	public void setStudent_count(int student_count) {
		this.student_count = student_count;
	}

	public void setSubjectbook_isbn(String subjectbook_isbn) {
		this.subjectbook_isbn = subjectbook_isbn;
	}

	public void setStudent_photo_filepath(String student_photo_filepath) {
		this.student_photo_filepath = student_photo_filepath;
	}

	public void setInstructor_photo_filepath(String instructor_photo_filepath) {
		this.instructor_photo_filepath = instructor_photo_filepath;
	}
}
