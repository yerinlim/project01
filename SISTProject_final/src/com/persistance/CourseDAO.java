package com.persistance;

import java.util.List;

import com.domain.Course;

public interface CourseDAO {
	
	// (입력) 기초 정보 관리 - 과정 관리 - 과정 등록
	public int insert(Course cs);

	// (출력) 기초 정보 관리 - 과정 관리 - 과정 목록 출력
	// 과정번호 / 과정명
	// course_id / course_name
	public List<Course> print1();
	
	// (수정) 기초 정보 관리 - 과정 관리 - 과정 수정
	public int update(Course cs);
	
	// (삭제) 기초 정보 관리 - 과정 관리 - 과정 삭제
	public int delete(Course cs);
}
