package com.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.domain.Exam;

public class ExamMapper52 implements RowMapper<Exam> {
	
	@Override
	public Exam mapRow(ResultSet rs, int count) throws SQLException {

		Exam exam = new Exam();

		exam.setStudent_name(rs.getString("student_name"));
		exam.setStudent_phone(rs.getString("student_phone"));
		exam.setStudent_id(rs.getString("student_id"));
		exam.setAttendance_score(rs.getInt("attendance_score"));
		exam.setWrite_score(rs.getInt("write_score"));
		exam.setSkill_score(rs.getInt("skill_score"));
		exam.setTotal_score(rs.getInt("score"));
		
		return exam;
	}
}
