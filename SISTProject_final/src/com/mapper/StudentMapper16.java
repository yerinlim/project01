package com.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.domain.Student;

public class StudentMapper16 implements RowMapper<Student> {

	@Override
	public Student mapRow(ResultSet rs, int count) throws SQLException {
		
		// 데이터베이스에서 읽어온 결과를
		// 미리 준비한 객체의 특정 변수와 연결
		//student_id, student_name, student_phone, student_regdate, completion, completion_date
		
		Student st = new Student();
		st.setStudent_id(rs.getString("student_id"));
		st.setStudent_name(rs.getString("student_name"));
		st.setStudent_phone(rs.getString("student_phone"));
		st.setStudent_regDate(rs.getDate("student_regDate"));
		st.setCompletion_status(rs.getString("completion"));
		st.setCompletion_date(rs.getDate("completion_date"));
		
		return st;
	}

}
