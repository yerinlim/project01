package com.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.domain.OpenSubject;

public class OpenSubjectMapper51 implements RowMapper<OpenSubject>{
	@Override
	public OpenSubject mapRow(ResultSet rs, int count) throws SQLException {
	
		OpenSubject os = new OpenSubject();
		
		//os.setCourse_name(rs.getString("course_name"));
		//os.setOpen_course_start_date(rs.getDate("open_course_start_date"));
		//os.setOpen_course_end_date(rs.getDate("open_course_end_date"));
		os.setOpen_subject_id(rs.getString("open_subject_id"));
		os.setSubject_name(rs.getString("subject_name"));
		os.setSubject_start_date(rs.getDate("subject_start_date"));
		os.setSubject_end_date(rs.getDate("subject_end_date"));
		os.setInstructor_name(rs.getString("instructor_name"));
		os.setSubjectbook_name(rs.getString("subjectbook_name"));

		return os;
	}
}
