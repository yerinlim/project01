package com.persistance;

import java.util.List;

import com.domain.Instructor;
import com.domain.OpenSubject;

public interface InstructorDAO {

	// (타이틀) 강사 이름 / 강사 휴대폰번호
	public List<Instructor> title();
	
	// (로그인) 강사 아이디
	public Instructor login(String instructor_name, String instructor_pw);
		
	/* ==================================================================== */
	
	// (출력) 강사 - 개인 설정 - 개인정보 확인
	public List<Instructor> info();
		
	// (수정) 강사 - 개인 설정 - 비밀번호 변경
	public int changepw(Instructor ins);
	
	// (출력) 강사 좌측 사진
	public List<Instructor> InstructorImage();
	
	// (출력) 강사 - 강사 스케줄 조회
	// 강사 사진 / 강사 번호 / 강사 이름 / 강사 휴대폰번호 / 강사 등록일
	public Instructor instructorInfoPrint(OpenSubject os);
	
	/* ==================================================================== */
	
	// (입력) 강사 계정 관리 - 강사 등록
	public int insert(Instructor ins);
	
	// (출력) 강사 계정 관리 - 강사 목록 출력
	// 강사 번호 / 강사 이름 / 강사 휴대폰번호 / 강사 등록일 / 강의 가능 과목
	// instructor_id / instructor_name / instructor_phone / instructor_regDate
	// instructor_photo_id / instructor_photo_filePath instructor_id
	// instructor_id subject_id
	public List<Instructor> print1();
	public List<Instructor> print2();
	
	// (출력) 강사 계정 관리 - 강의 가능 과목 관리
	public int subjectManage();
	
	// (수정) 강사 계정 관리 - 강사 수정
	// public int update(Instructor ins);
	
	// (수정) 강사 비밀번호 초기화
	public int reset(Instructor ins);
	
	// (삭제) 강사 계정 관리 - 강사 삭제
	public int delete(Instructor ins);
	
	// (검색) 강사 계정 관리 - 강사 검색
	public List<Instructor> search(String key, String value);
	
	// 예린 작성
	public int update1(Instructor ins);
	public int update2(Instructor ins);
}
