package com.persistance;

import java.util.List;

import com.domain.Exam;
import com.domain.OpenCourse;

public interface OpenCourseDAO {

	// (타이틀) 과정명 / 과정 시작일 / 과정 종료일
	public List<OpenCourse> title();
	public List<OpenCourse> title(String oc_id);
	
	/* ------------------------------------------------------------------- */
	// (출력) 수강생 - 수강생 첫화면 - 현재 진행중인 과정 출력
	// 과정명 / 개설 과정 시작일 / 개설 과정 종료일 
	// course_name, open_course_start_date, open_course_end_date
	public List<OpenCourse> homePrint();
	
	// (출력) 수강생 - 성적 조회
	// (출력) 수강생 - 성적 조회 - 수강생 성적 조회
	// 과정 검색 (조건 student_id)
	// 개설 과정 번호 / 과정명 / 개설 과정 시작일 / 개설 과정 종료일 / 강의실명 / 진행 상황 / 수료 여부 
	// open_course_id, course_name, open_course_start_date, open_course_end_date, classroom_name, completion_status
	public List<OpenCourse> prints1(OpenCourse oc);
	public List<OpenCourse> prints1(Exam exam);
	
	/* ------------------------------------------------------------------- */
	
	// (입력) 개설 과정 관리 - 개설 과정 정보 - 입력
	// 개설 과정 번호 / 과정 번호 / 개설 과정 시작일 / 개설 과정 종료일 / 강의실 번호
	public int insert(OpenCourse oc);
	
	// (출력1) 개설 과정 관리 - 개설 과정 정보 - 출력
	// (출력1) 성적 조회 - 개설 과정 성적 조회 - 개설 과정 정보 - 출력
	// 개설 과정 번호 / 과정명 / 개설 과정 시작일 / 개설 과정 종료일 / 강의실명 / 개설 과목 등록 갯수 / 수강생 등록 인원
	// open_course_id, course_name, open_course_start_date ,open_course_end_date, classroom_name, open_subject_count, student_count
	public List<OpenCourse> print1();
	
	// (출력2) 성적 조회 - 수강생 개인 성적 조회 - 수강 과정 정보 - 출력
	// 개설 과정번호 / 과정명 / 개설 과정 시작일 / 개설 과정 종료일 / 강의실명 / 개설 과목 등록 갯수
	public List<OpenCourse> print2();
	public List<OpenCourse> print2(String student_id);

	public List<OpenCourse> printj1(OpenCourse oc);
	
	// 과정아이디 / 과정명 / 과정기간 / 수료여부 / 날짜
	public List<OpenCourse> printj2(OpenCourse oc);
	
	// (수정) 개설 과정 관리 - 개설 과정 정보 - 수정
	public int update(OpenCourse oc);
	
	// (삭제) 개설 과정 관리 - 개설 과정 정보 - 삭제
	public int delete(OpenCourse oc);
	
	// (검색1) 개설 과정 관리 - 개설 과정 정보 - 검색
	// 개설과정번호 / 개설과정명 기준
	// open_course_id, course_name, open_course_start_date ,open_course_end_date, classroom_name, os_count, s_count 
	public List<OpenCourse> search1(String key, String value);
	
	// (검색2) 성적 조회 - 개설 과정 성적 조회 - 개설 과정 정보 - 검색
	// 개설 과정 검색 메소드
	public List<OpenCourse> search2(String key, String value);
}
