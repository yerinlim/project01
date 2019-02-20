package com.service;

import java.util.List;

import com.domain.OpenCourse;
import com.domain.OpenSubject;
import com.domain.Subject;

public interface OpenSubjectService {

	// (타이틀) 과목명 / 과목 시작일 / 과목 종료일
	public List<OpenSubject> title();
	
	// (타이틀)
	public List<OpenSubject> openSubjectTitle(OpenSubject os);
	
	/* ==================================================================== */
	// (출력) 강사 - 강사 첫화면 - 현재 진행중인 과목 출력
	// 과정명 / 개설 과정 시작일 / 개설 과정 종료일 / 과목명 / 과목 시작일 / 과목 종료일
	public List<OpenSubject> homePrint();
	
	// (출력1) 강사 - 강사 스케줄 조회 - 강의 과목 정보 출력
	// (출력1) 강사 - 배점 관리 - 강의 과목 정보 출력
	// (출력1) 강사 - 성적 관리 - 강의 과목 정보 출력
	// 개설 과목 번호 / 개설 과목명 / 과목 시작일 / 과목 종료일 / 개설 과정명 / 개설 과정 시작일 / 개설 과정 종료일 / 강의실명 / 교재명 / 수강생 등록 인원 / 강의 진행 여부
	public List<OpenSubject> lectureSchedulePrint(OpenSubject os);
	/* ==================================================================== */
	
	// (입력) 개설 과목 관리 - 개설 과목 정보 - 입력
	// 개설 과목 번호 / 교재 번호 / 과목 번호 / 강사 번호 / 개설 과정 번호 / 과목 시작일 / 과목 종료일
	public int insert(OpenSubject os);
	
	// (출력1) 관리자 첫화면
	// 강의실명 / 최대정원 / 수강인원 / 중도탈락인원 / 과정명 / 개설 과정 시작일 / 개설 과정 종료일
	// classroom_name / max_count / student_count / dropout_count / course_name / open_course_start_date / open_course_end_date
	public List<OpenSubject> print1();
	
	// (출력2) 강사 계정 관리 - 강의 과목 관리 - 강의 과목 출력
	// 개설 과목 번호 / 개설 과목명 / 과목 시작일 / 과목 종료일 / 개설 과정명 / 개설 과정 시작일 / 개설 과정 종료일 / 강의실명 / 강의 진행 여부
	// instructor_id open_subject_id subject_id subject_start_date subject_end_date
	// open_course_id subject_id subject_name open_course_id course_id
	// class_room_id open_course_start_date open_course_end_date course_id
	// course_name class_room_id class_room_name instructor_status
	public List<OpenSubject> print2();
	
	// (출력3) 개설 과정 관리 - 개설 과정 정보 - 과목 정보 - 출력
	// 개설 과목 번호 / 과목명 / 과목 시작일 / 과목 종료일 / 강사명 / 교재명
	// open_subject_id, subject_name, subject_start_date, subject_end_date, instructor_name, subjectbook_name, instructor_id
	public List<OpenSubject> print3();
	public List<OpenSubject> print3(String oc_id);
	public List<OpenSubject> print3(OpenCourse opencourse);
	
	// (출력3-1) 개설 과정 관리 - 개설 과정 정보 이름 출력
	public OpenSubject print6(OpenCourse opencourse);
	
	// (출력4) 개설 과목 관리 - 개설 과목 정보 - 출력
	// 개설 과목 번호 / 과목명 / 과목 시작일 / 과목 종료일 / 강사명 / 교재명 / 과정명 / 개설 과정 시작일 / 개설 과정 종료일 / 강의실명
	// open_subject_id, subject_name, subject_start_date, subject_end_date, subjectbook_name, instructor_name, course_name, open_course_start_date, open_course_end_date, classroom_name
	public List<OpenSubject> print4();	
	
	// (출력5) 성적 조회 - 개설 과정 성적 조회 - 과목 정보 - 출력
	// (출력5) 성적 조회 - 수강생 개인 성적 조회 - 과정 정보 - 과목 정보 - 출력
	// 개설 과목번호 / 과목명 / 과목 시작일 / 과목 종료일 / 강사명 / 교재명
	public List<OpenSubject> print5();
	
	// (수정) 개설 과목 관리 - 개설 과목 정보 - 수정 
	public int update(OpenSubject os);
	
	// (삭제) 개설 과목 관리 - 개설 과목 정보 - 삭제
	public int delete(OpenSubject os);
	
	// (검색1) 강사 계정 관리 - 강의 과목 관리 - 강의 과목 검색
	public List<OpenSubject> search1(String key, String value);
	
	// (검색2) 개설 과목 관리 - 개설 과정 정보 - 검색
	// 개설과정번호 / 개설과정명 / 강사명 / 과정명 기준
	// open_course_id, course_name, open_course_start_date ,open_course_end_date, classroom_name, os_count, s_count 
	public List<OpenSubject> search2(String key, String value);
	
	// 예린 작성
	public List<OpenSubject> print1(OpenSubject os);
	public List<OpenSubject> search3(OpenSubject os, String key, String value);
	public int deleteInsert(OpenSubject os);
	public int osInsert(OpenSubject os);
	public int osDel(OpenSubject os);
}
