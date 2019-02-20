package com.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.domain.Exam;

public class ExamMapper31 implements RowMapper<Exam> {

	@Override
	public Exam mapRow(ResultSet rs, int count) throws SQLException {

		Exam exam = new Exam();

		exam.setAttendance_point(rs.getInt("attendance_point"));
		exam.setExam_date(rs.getDate("exam_date"));
		exam.setExam_file(rs.getString("exam_file"));
		exam.setExam_id(rs.getString("exam_id"));
		exam.setSkill_point(rs.getInt("skill_point"));
		exam.setSubject_point_id(rs.getString("subject_point_id"));
		exam.setWrite_point(rs.getInt("write_point"));

		return exam;
	}
}
