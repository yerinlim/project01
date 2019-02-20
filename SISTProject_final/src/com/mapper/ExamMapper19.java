package com.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.domain.Exam;

public class ExamMapper19 implements RowMapper<Exam> {

	@Override
	public Exam mapRow(ResultSet rs, int count) throws SQLException {
		
		// student_id, student_name, student_phone, student_regDate, completion_status,
		//  completion_date, attendance_score, write_score, skill_score, total
		
		Exam exam = new Exam();
		
		exam.setStudent_id(rs.getString("student_id"));
		exam.setStudent_name(rs.getString("student_name"));
		exam.setStudent_phone(rs.getString("student_phone"));
		exam.setStudent_regDate(rs.getDate("student_regDate"));
		exam.setCompletion_status(rs.getString("completion_status"));
		exam.setCompletion_date(rs.getDate("completion_date"));
		exam.setAttendance_score(rs.getInt("attendance_score"));
		exam.setWrite_score(rs.getInt("write_score"));
		exam.setSkill_score(rs.getInt("skill_score"));
		exam.setTotal_score(rs.getInt("total_score"));
		
		return exam;
	}
}