package com.persistance;

import java.util.List;

import com.domain.OpenSubject;
import com.domain.Student;

public interface StudentDAO {

	// (타이틀) 수강생 이름 / 수강생 휴대폰번호
	public List<Student> title();
	public List<Student> title(String student_id);
	// (로그인) 수강생 아이디
	public Student login(String student_name, String student_pw);
	
	/* ------------------------------------------------------------------- */
	
	// (출력) 수강생 - 개인 설정 - 개인정보 확인
	public List<Student> info();
	
	// (수정) 수강생 - 개인 설정 - 비밀번호 변경(student_tb)
	public int changepw(Student s);
	
	// (출력) 수강생 좌측 사진
	public List<Student> studentImage();
	
	// (출력) 수강생 - 성적 조회
	// 수강생 사진 / 수강생 번호 / 수강생 이름 / 수강생 휴대폰번호 / 수강생 등록일
	public Student studentInfoPrint(String student_id);
	
	/* ------------------------------------------------------------------- */
	
	/* ==================================================================== */
	// (출력) 강사 - 강사 스케줄 조회 - 수강생 정보 출력
	// 수강생번호 / 수강생이름 / 수강생휴대폰번호 / 수강생 등록일 / 수료여부 / 날짜
	public List<Student> printi1(OpenSubject os);

	public List<Student> printj1();
	/* ==================================================================== */
	
	// (입력) 수강생 관리 - 수강생 등록
	// 수강생 번호 / 수강생 패스워드 / 수강생 이름 / 수강생 휴대폰번호 / 수강생 등록일 / 
	// 수강생 사진 번호 / 수강생 사진 경로 / 수강생 번호
	public int insert(Student s);
	
	// (입력) 수강생 관리 - 수강생 과정 관리 - 수강생 과정 등록
	// 수강생 번호 / 개설 과정 번호 / 과정명
	public int insertCourse(Student s);
	
	// (입력) 수강생 관리 - 수강생 과정 관리 - 중도 탈락 등록
	// 수강생  / 개설 과정 ID / 중도 탈락 일자
	public int insertDrop(Student s);
	
	// (수정) 수강생 관리 - 수강생 정보 수정
	// 수강생 정보 수정 (student_tb)
	// 수강생 사진 정보 수정
	public int update(Student s);
	
	// (수정) 수강생 관리 - 수강생 비밀번호 초기화
	//비밀번호 초기화
	public int reset(Student s);
	
	// (삭제) 수강생 관리 - 수강생 정보 삭제
	public int delete(Student s);
	
	// 과정 삭제
	public int deleteCourse(Student s);
		
	// 수강생 검색
	// 수강생 번호 / 수강생명 / 수강생 휴대폰번호 / 수강생 등록일
	public List<Student> search(String key, String value);
	
	//수강생 출력(현아)
	public List<Student> print1();
}
