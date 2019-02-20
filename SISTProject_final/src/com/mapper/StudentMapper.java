package com.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.domain.Student;

public class StudentMapper implements RowMapper<Student> {

	@Override
	public Student mapRow(ResultSet rs, int count) throws SQLException {
		
		// 데이터베이스에서 읽어온 결과를
		// 미리 준비한 객체의 특정 변수와 연결
		Student st = new Student();
		st.setStudent_id(rs.getString("student_id"));
		st.setStudent_photo_id(rs.getString("student_photo_id"));
		st.setStudent_name(rs.getString("student_name"));
		st.setStudent_phone(rs.getString("student_phone"));
		st.setStudent_regDate(rs.getDate("student_regDate"));
		st.setStudent_pw(rs.getString("student_pw"));
		st.setStudent_new_pw(rs.getString("student_new_pw"));
		st.setStudent_new_pw2(rs.getString("student_new_pw2"));
		st.setCompletion_status(rs.getString("completion_status"));
		st.setOpen_course_id(rs.getString("open_course_id"));
		st.setDropout_date(rs.getDate("dropout_date"));
		st.setStudent_photo_filepath(rs.getString("student_photo_filepath"));
		st.setCount_(rs.getInt("count_"));
		
		return st;
	}

}
