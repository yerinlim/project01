package com.persistance;

import java.util.List;

import com.domain.Exam;
import com.domain.OpenSubject;

public interface ExamDAO {

	/* ------------------------------------------------------------------- */
	// (출력) 수강생 - 성적 조회 - 수강생 성적 조회
	// 과목명 / 교재명 / 강사명 / 시험날짜 / 출결점수 / 출결배점 / 필기점수 / 필기배점 / 실기점수 / 실기배점 / 시험문제
	public List<Exam> prints1(Exam exam);
	
	/* ------------------------------------------------------------------- */
	
	/* ==================================================================== */
	// (입력) 강사 - 배점 관리 - 시험 정보 - 배점 등록
	// instructor_point2.jsp
	public int insert(Exam exam);

	// (삭제) 강사 - 배점 관리 - 시험 정보 - 배점 삭제
	// instructor_point2.jsp
	public int delete(Exam exam);
	
	// (출력) 강사 - 성적 관리 - 시험 정보 출력
	// instructor_score2.jsp
	// 시험번호 / 출결배점 / 필기배점 / 실기배점 / 시험날짜 / 시험문제파일 / 성적등록인원수 / 성적입력여부
	public List<Exam> printi1(OpenSubject os);
	
	// (출력) 강사 - 성적 관리 - 시험 정보 - 수강생 정보 출력
	// instructor_score2.jsp
	// 수강생번호 / 수강생이름 / 수강생휴대폰번호 / 수강생등록일 / 수료여부 / 날짜 / 출서점수 / 필기점수 / 실기점수 / 총점
	public List<Exam> printi2();
	/* ==================================================================== */
	
	// (출력1) 개설 과정 관리 - 개설 과정 정보 - 과목 정보 - 시험 정보 - 출력
	// (출력1) 강사 - 배점 관리 - 시험 정보 - 출력
	// 시험번호 / 출결배점 / 필기배점 / 실기배점 / 시험날짜 / 시험문제파일
	// exam_id, attendance_point, write_point, skill_point, exam_date, exam_file, subject_point_id,
	public List<Exam> print1(Exam exam);
		
	// (출력2) 수강생 관리 - 수강생 과정 관리 - 출력
	// (출력2) 성적 조회 - 수강생 개인 성적 조회 - 수강생 정보 - 출력
	// 수강생번호 / 수강생이름 / 수강생휴대폰번호 / 수강생등록일 / 수강횟수
	// student_id, student_name, student_phone, student_regdate, class_count
	public List<Exam> print2();
	public List<Exam> print2(Exam exam);
	
	// (출력3) 성적 조회 - 개설 과정 성적 조회 - 개설 과정 정보 - 개설 과목 정보 - 시험 정보 - 출력
	// 시험번호 / 출결배점 / 필기배점 / 실기배점 / 시험날짜 / 시험문제파일
	public List<Exam> print3(OpenSubject os);
	
	// (출력4) 성적 조회 - 개설 과정 성적 조회 - 개설 과정 정보 - 개설 과목 정보 - 시험 정보 - 수강생 정보 - 출력
	// 수강생번호 / 수강생이름 / 수강생휴대폰번호 / 수강생등록일 / 수료 여부 / 출결점수 / 필기점수 / 실기점수 / 총점
	public List<Exam> print4(Exam e);
	
	// 새로 추가(현아)
	public List<Exam> print4_1(Exam exam);
	
	// (출력5) 성적 조회 - 개설 과정 성적 조회 - 과정 정보 - 과목 정보 - 시험 정보 - 출력
	// (출력5) 성적 조회 - 수강생 개인 성적 조회 - 수강 과정 정보 - 과목 정보 - 시험 정보 - 출력
	// 시험번호 / 출결점수 / 출결배점 / 필기점수 / 필기배점 / 실기점수 / 실기배점 / 총점 / 시험날짜 / 시험문제파일
	public List<Exam> print5();
	
	// 새로 추가(현아)
	public List<Exam> print5(Exam exam);
	
}
