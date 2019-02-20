package com.service;

import java.util.List;

import com.domain.Admin;

public interface AdminService {

	// (로그인) 관리자 아이디
	public Admin login(String admin_name, String admin_pw);
		
	// (출력) 강사 - 개인 설정 - 개인정보 확인
	public List<Admin> info();
		
	// (수정) 관리자 - 개인 설정 - 비밀번호 변경
	public int changepw(Admin admin);
}
