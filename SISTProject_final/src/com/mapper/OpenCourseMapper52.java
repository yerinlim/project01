package com.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.domain.OpenCourse;

public class OpenCourseMapper52 implements RowMapper<OpenCourse> {

	@Override
	public OpenCourse mapRow(ResultSet rs, int count) throws SQLException {
		
		OpenCourse oc = new OpenCourse();

		oc.setStudent_name(rs.getString("student_name"));
		//수강생 전화번호 OpenCourse domain에 추가함
		oc.setStudent_phone(rs.getString("student_phone"));
		oc.setOpen_course_id(rs.getString("open_course_id"));
		oc.setCourse_name(rs.getString("course_name"));
		oc.setOpen_course_start_date(rs.getDate("open_course_start_date"));
		oc.setOpen_course_end_date(rs.getDate("open_course_end_date"));
		oc.setClassroom_id(rs.getString("classroom_name"));
		oc.setCount_(rs.getInt("count_"));
		
		return oc;
		
	}
	

}
