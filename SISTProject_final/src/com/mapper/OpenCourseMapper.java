package com.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.domain.OpenCourse;

public class OpenCourseMapper implements RowMapper<OpenCourse> {

	@Override
	public OpenCourse mapRow(ResultSet rs, int count) throws SQLException {
		
		// 데이터베이스에서 읽어온 결과를
		// 미리 준비한 객체의 특정 변수와 연결
		OpenCourse oc = new OpenCourse();
		
		oc.setOpen_course_id(rs.getString("open_course_id"));
		oc.setClassroom_id(rs.getString("classroom_id"));
		oc.setClassroom_name(rs.getString("classroom_name"));
		oc.setCourse_id(rs.getString("course_id"));
		oc.setCourse_name(rs.getString("course_name"));
		oc.setOpen_course_start_date(rs.getDate("open_course_start_date"));
		oc.setOpen_course_end_date(rs.getDate("open_course_end_date"));
		oc.setSubject_list(rs.getString("subject_list"));
		oc.setOpen_subject_count(rs.getInt("open_subject_count"));
		oc.setStudent_id(rs.getString("student_id"));
		oc.setStudent_name(rs.getString("student_name"));
		oc.setStudent_count(rs.getInt("student_count"));
		oc.setCount_(rs.getInt("count_"));
		oc.setCompletion_status(rs.getString("completion_status"));
		oc.setDropout_date(rs.getDate("dropout_date"));
		
		return oc;
	}
}