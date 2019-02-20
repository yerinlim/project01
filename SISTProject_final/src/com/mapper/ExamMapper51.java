package com.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.domain.Exam;

public class ExamMapper51 implements RowMapper<Exam> {

	@Override
	public Exam mapRow(ResultSet rs, int count) throws SQLException {

		Exam exam = new Exam();
		
		exam.setSubject_name(rs.getString("subject_name"));
		exam.setSubject_start_date(rs.getDate("subject_start_date"));
		exam.setSubject_end_date(rs.getDate("subject_end_date"));
		exam.setExam_id(rs.getString("exam_id"));
		exam.setAttendance_point(rs.getInt("attendance_point"));
		exam.setWrite_point(rs.getInt("write_point"));
		exam.setSkill_point(rs.getInt("skill_point"));
		exam.setExam_date(rs.getDate("exam_date"));
		exam.setExam_file(rs.getString("exam_file"));
		
		return exam;
	}

}
