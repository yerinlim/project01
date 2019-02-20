package com.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.domain.OpenSubject;

public class OpenSubjectMapper implements RowMapper<OpenSubject> {

	@Override
	public OpenSubject mapRow(ResultSet rs, int count) throws SQLException {
		
		// 데이터베이스에서 읽어온 결과를
		// 미리 준비한 객체의 특정 변수와 연결
		OpenSubject os = new OpenSubject();
		
		os.setOpen_subject_id(rs.getString("open_subject_id"));
		os.setSubject_id(rs.getString("subject_id"));
		os.setSubject_name(rs.getString("subject_name"));
		os.setSubjectbook_id(rs.getString("subjectbook_id"));
		os.setSubjectbook_name(rs.getString("subjectbook_name"));
		os.setInstructor_id(rs.getString("instructor_id"));
		os.setInstructor_name(rs.getString("instructor_name"));
		os.setStudent_id(rs.getString("student_id"));
		os.setOpen_course_id(rs.getString("open_course_id"));
		os.setCourse_name(rs.getString("course_name"));
		os.setSubject_start_date(rs.getDate("subject_start_date"));
		os.setSubject_end_date(rs.getDate("subject_end_date"));
		os.setOpen_course_start_date(rs.getDate("open_course_start_date"));
		os.setOpen_course_end_date(rs.getDate("open_course_end_date"));
		os.setClassroom_name(rs.getString("classroom_name"));
		os.setStudent_count(rs.getInt("student_count"));
		os.setInstructor_status(rs.getString("instructor_status"));
		os.setCount_(rs.getInt("count_"));
		
		return os;
	}
}
