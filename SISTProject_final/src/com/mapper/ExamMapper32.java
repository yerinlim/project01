package com.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.domain.Exam;

public class ExamMapper32 implements RowMapper<Exam> {

	@Override
	public Exam mapRow(ResultSet rs, int count) throws SQLException {
		
		Exam exam = new Exam();
		
		exam.setStudent_id(rs.getString("student_id"));
		exam.setStudent_name(rs.getString("student_name"));
		exam.setStudent_phone(rs.getString("student_phone"));
		exam.setStudent_regDate(rs.getDate("student_regDate"));
		exam.setClass_count(rs.getInt("count_"));
		
		return exam;
	}

}
