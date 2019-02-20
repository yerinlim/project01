package com.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.domain.Subject;

public class SubjectMapper implements RowMapper<Subject> {

	@Override
	public Subject mapRow(ResultSet rs, int count) throws SQLException {
		
		// 데이터베이스에서 읽어온 결과를
		// 미리 준비한 객체의 특정 변수와 연결
		Subject sub = new Subject();
		sub.setSubject_id(rs.getString("subject_id"));
		sub.setSubject_name(rs.getString("subject_name"));
		sub.setCount_(rs.getInt("count_"));
		return sub;
	}

}
