package com.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.domain.OpenCourse;

public class OpenCourseMapper53 implements RowMapper<OpenCourse> {

	@Override
	public OpenCourse mapRow(ResultSet rs, int count) throws SQLException {
		
		// 데이터베이스에서 읽어온 결과를
		// 미리 준비한 객체의 특정 변수와 연결
		OpenCourse oc = new OpenCourse();
		
		oc.setCourse_name(rs.getString("course_name"));
		oc.setOpen_course_start_date(rs.getDate("open_course_start_date"));
		oc.setOpen_course_end_date(rs.getDate("open_course_end_date"));
		
		return oc;
	}
}