package com.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.domain.Student;

public class StudentMapper21 implements RowMapper<Student>  {

	@Override
	public Student mapRow(ResultSet rs, int count) throws SQLException {
		
		Student st = new Student();
		
		st.setStudent_id(rs.getString("student_id"));
		st.setStudent_name(rs.getString("student_name"));
		st.setStudent_phone(rs.getString("student_phone"));
		st.setStudent_regDate(rs.getDate("student_regDate"));
		st.setStudent_photo_id(rs.getString("student_photo_id"));
		st.setStudent_photo_filepath(rs.getString("student_photo_filepath"));
		
		
		return st;
	}

}
