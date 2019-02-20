package com.service;

import java.util.List;

import com.domain.Notice;

public interface NoticeService {
	/* ------------------------------------------------------------------- */
	// (출력) 수강생 - 수강생 첫화면 - 수강생 공지사항
	// (출력) 강사 - 강사 첫화면 - 강사 공지사항
	// 수강생 공지사항 notice_tb
	// notice_content, notice_regDate
	public List<Notice> notice();
	
	/* ------------------------------------------------------------------- */
}
