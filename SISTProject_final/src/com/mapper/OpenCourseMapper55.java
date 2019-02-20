package com.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.domain.OpenCourse;

public class OpenCourseMapper55 implements RowMapper<OpenCourse> {
	
	@Override
	public OpenCourse mapRow(ResultSet rs, int count) throws SQLException {

		OpenCourse oc = new OpenCourse();

		oc.setOpen_course_id(rs.getString("open_course_id"));
		oc.setCourse_name(rs.getString("course_name"));
		oc.setOpen_course_start_date(rs.getDate("open_course_start_date"));
		oc.setOpen_course_end_date(rs.getDate("open_course_end_date"));
		oc.setClassroom_name(rs.getString("classroom_name"));
		oc.setOpen_subject_count(rs.getInt("os_count"));
		oc.setStudent_id(rs.getString("student_id"));

		return oc;
	}
}
