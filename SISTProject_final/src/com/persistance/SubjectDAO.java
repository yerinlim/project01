package com.persistance;

import java.util.List;

import com.domain.Subject;

public interface SubjectDAO {
	
	// (입력) 기초 정보 관리 - 과목 관리 - 과목 등록
	public int insert(Subject sub);

	// (출력) 기초 정보 관리 - 과목 관리 - 과목 목록 출력
	// 과목번호 / 과목명
	// subject_id / subject _name
	public List<Subject> print1();
	
	// (수정) 기초 정보 관리 - 과목 관리 - 과목 수정
	public int update(Subject sub);
	
	// (삭제) 기초 정보 관리 - 과목 관리 - 과목 삭제
	public int delete(Subject sub);
}
