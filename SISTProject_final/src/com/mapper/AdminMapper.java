package com.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.domain.Admin;

public class AdminMapper implements RowMapper<Admin> {

	@Override
	public Admin mapRow(ResultSet rs, int count) throws SQLException {
		
		// 데이터베이스에서 읽어온 결과를
		// 미리 준비한 객체의 특정 변수와 연결
		Admin admin = new Admin();
		
		admin.setAdmin_blind(rs.getBoolean("admin_blind"));
		admin.setAdmin_grade(rs.getString("admin_grade"));
		admin.setAdmin_id(rs.getString("admin_id"));
		admin.setAdmin_name(rs.getString("admin_name"));
		admin.setAdmin_new_pw(rs.getString("admin_new_pw"));
		admin.setAdmin_phone(rs.getString("admin_phone"));
		admin.setAdmin_pw(rs.getString("admin_pw"));
		admin.setAdmin_regDate(rs.getDate("admin_regDate"));
		admin.setCount_(rs.getInt("count_"));
		
		return admin;
	}

}
