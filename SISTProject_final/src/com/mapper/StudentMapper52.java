package com.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.domain.Student;

public class StudentMapper52 implements RowMapper<Student>  {

	@Override
	public Student mapRow(ResultSet rs, int count) throws SQLException {
		
		Student st = new Student();
		
		st.setStudent_name(rs.getString("student_name"));
		st.setStudent_phone(rs.getString("student_phone"));
		
		return st;
	}

}
