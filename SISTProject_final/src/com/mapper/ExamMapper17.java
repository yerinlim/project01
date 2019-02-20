package com.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.domain.Exam;

public class ExamMapper17 implements RowMapper<Exam> {

	@Override
	public Exam mapRow(ResultSet rs, int count) throws SQLException {
		
		//exam_id,  attendance_point, write_point, skill_point , exam_date, exam_file
		
		Exam exam = new Exam();
		
		exam.setAttendance_point(rs.getInt("attendance_point"));
		exam.setExam_date(rs.getDate("exam_date"));
		exam.setExam_file(rs.getString("exam_file"));
		exam.setExam_id(rs.getString("exam_id"));
		exam.setSkill_point(rs.getInt("skill_point"));
		exam.setWrite_point(rs.getInt("write_point"));
		exam.setCount_(rs.getInt("count_"));
		
		return exam;
	}

}
