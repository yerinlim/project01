package com.persistance;

import java.util.List;

import com.domain.Subjectbook;

public interface SubjectbookDAO {
	
	// (입력) 기초 정보 관리 - 교재 관리 - 교재 등록
	public int insert(Subjectbook sb);

	// (출력) 기초 정보 관리 - 교재 관리 - 교재 목록 출력
	// 교재번호 / 교재명 / ISBN
	// subjectbook_id / subjectbook_name / subjectbook_isbn
	public List<Subjectbook> print1();
	
	// (수정) 기초 정보 관리 - 교재 관리 - 교재 수정
	public int update(Subjectbook sb);
	
	// (삭제) 기초 정보 관리 - 교재 관리 - 교재 삭제
	public int delete(Subjectbook sb);
}
