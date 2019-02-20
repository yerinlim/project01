package com.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.domain.Course;

public class CourseMapper implements RowMapper<Course> {

	@Override
	public Course mapRow(ResultSet rs, int count) throws SQLException {
		
		// 데이터베이스에서 읽어온 결과를
		// 미리 준비한 객체의 특정 변수와 연결
		Course cs = new Course();
		
		cs.setCourse_id(rs.getString("course_id"));
		cs.setCourse_name(rs.getString("course_name"));
		cs.setCount_(rs.getInt("count_"));
		
		return cs;
	}

}
