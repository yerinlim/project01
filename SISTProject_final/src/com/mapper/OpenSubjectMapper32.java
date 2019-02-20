package com.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.domain.OpenSubject;

public class OpenSubjectMapper32 implements RowMapper<OpenSubject> {
	@Override
	public OpenSubject mapRow(ResultSet rs, int count) throws SQLException {
		// 데이터베이스에서 읽어온 결과를
		// 미리 준비한 객체의 특정 변수와 연결
		OpenSubject os = new OpenSubject();
		
		os.setCourse_name(rs.getString("course_name"));
		os.setOpen_course_start_date(rs.getDate("open_course_start_date"));
		os.setOpen_course_end_date(rs.getDate("open_course_end_date"));
		
		return os;
	}

}
