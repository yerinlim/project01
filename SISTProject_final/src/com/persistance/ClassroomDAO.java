package com.persistance;

import java.util.List;

import com.domain.Classroom;

public interface ClassroomDAO {

	// (입력) 기초 정보 관리 - 강의실 관리 - 강의실 등록
	public int insert(Classroom cr);

	// (출력) 기초 정보 관리 - 강의실 관리 - 강의실 목록 출력
	// 강의실번호 / 강의실명 / 최대정원
	// class_room_id class_room _name max_number
	public List<Classroom> print1();

	// (수정) 기초 정보 관리 - 강의실 관리 - 강의실 수정
	public int update(Classroom cr);

	// (삭제) 기초 정보 관리 - 강의실 관리 - 강의실 삭제
	public int delete(Classroom cr);

}
