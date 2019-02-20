package com.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.domain.Exam;

public class ExamMapper implements RowMapper<Exam> {

	@Override
	public Exam mapRow(ResultSet rs, int count) throws SQLException {
		
		// 데이터베이스에서 읽어온 결과를
		// 미리 준비한 객체의 특정 변수와 연결
		Exam exam = new Exam();
		
		exam.setAttendance_point(rs.getInt("attendance_point"));
		exam.setAttendance_score(rs.getInt("attendance_score"));
		exam.setClass_count(rs.getInt("class_count"));
		exam.setCompletion_status(rs.getString("completion_status"));
		exam.setDropout_date(rs.getDate("dropout_date"));
		exam.setExam_date(rs.getDate("exam_date"));
		exam.setExam_file(rs.getString("exam_file"));
		exam.setExam_id(rs.getString("exam_id"));
		exam.setInstructor_id(rs.getString("instructor_id"));
		exam.setInstructor_name(rs.getString("instructor_name"));
		exam.setOpen_subject_id(rs.getString("open_subject_id"));
		exam.setScore_status(rs.getString("score_status"));
		exam.setSkill_point(rs.getInt("skill_point"));
		exam.setSkill_score(rs.getInt("skill_score"));
		exam.setStudent_id(rs.getString("student_id"));
		exam.setStudent_name(rs.getString("student_name"));
		exam.setStudent_phone(rs.getString("student_phone"));
		exam.setStudent_regDate(rs.getDate("student_regDate"));
		exam.setStudent_score_id(rs.getString("student_score_id"));
		exam.setSubject_end_date(rs.getDate("subject_end_date"));
		exam.setSubject_name(rs.getString("subject_name"));
		exam.setSubject_point_id(rs.getString("subject_point_id"));
		exam.setSubject_start_date(rs.getDate("subject_start_date"));
		exam.setSubjectbook_name(rs.getString("subjectbook_name"));
		exam.setTotal_score(rs.getInt("total_score"));
		exam.setWrite_point(rs.getInt("write_point"));
		exam.setWrite_score(rs.getInt("write_score"));
		
		
		return exam;
	}

}
