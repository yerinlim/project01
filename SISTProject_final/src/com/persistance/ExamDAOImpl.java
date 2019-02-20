package com.persistance;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.domain.Exam;
import com.domain.OpenSubject;
import com.mapper.ExamMapper17;
import com.mapper.ExamMapper18;
import com.mapper.ExamMapper19;
import com.mapper.ExamMapper21;
import com.mapper.ExamMapper31;
import com.mapper.ExamMapper32;
import com.mapper.ExamMapper52;
import com.mapper.ExamMapper53;

@Repository("examDAO")
public class ExamDAOImpl implements ExamDAO{

	@Resource(name="jdbcTemplate")
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public List<Exam> prints1(Exam exam) {
		String sql = "SELECT subject_name, subject_start_date, subject_end_date, \r\n" + 
				"		instructor_name, instructor_phone, instructor_photo_filepath, \r\n" + 
				"        subjectbook_name, subjectbook_isbn, \r\n" + 
				"        exam_date, exam_file, \r\n" + 
				"        attendance_point, write_point, skill_point, \r\n" + 
				"        attendance_score, write_score, skill_score\r\n" + 
				"	FROM student_transcript_vw5\r\n" + 
				"    WHERE student_id = ?\r\n" + 
				"		AND open_course_id = ?";
	
		return this.jdbcTemplate.query(sql, new ExamMapper21(), exam.getStudent_id() ,exam.getOpen_course_id());
	}

	@Override
	public int insert(Exam exam) {
		
		String sql1 = "INSERT INTO exam_tb (exam_id, exam_date, exam_file, open_subject_id)\r\n"
						+ " VALUES ((SELECT CONCAT('EXAM', LPAD(IFNULL(SUBSTR(MAX(exam_id), 5), 0) + 1, 4, 0)) AS newId"
									+ " FROM exam_tb e), ?, ?, ?)";
		int result1 = this.jdbcTemplate.update(sql1, exam.getExam_date(), exam.getExam_file(), exam.getOpen_subject_id());
		
		String sql2 = "SELECT exam_id FROM exam_tb ORDER BY exam_id DESC limit 1";
		String exam_id = (String)this.jdbcTemplate.queryForObject(sql2, String.class);
		
		String sql3 = "INSERT INTO subject_point_tb (subject_point_id, attendance_point, write_point, skill_point, exam_id)\r\n" + 
					"	VALUES ((SELECT CONCAT('SP', LPAD(IFNULL(SUBSTR(MAX(subject_point_id), 3), 0) + 1, 4, 0)) AS newId \r\n" + 
					"				FROM subject_point_tb sp), ?, ?, ?, ?)";
		
		int result2 = this.jdbcTemplate.update(sql3, exam.getAttendance_point(), exam.getWrite_point(), exam.getSkill_point(), exam_id);
		
		if (result1 >= 1 && result2 >= 1) {
			return 1;
		} else {
			return 0;
		}
	}

	@Override
	public int delete(Exam exam) {
		
		String sql = "DELETE FROM exam_tb\r\n" + 
				"	WHERE exam_id = ? ";
		
		int result = this.jdbcTemplate.update(sql, exam.getExam_id());
		
		return result;
	}

	@Override
	public List<Exam> printi1(OpenSubject os) {
		
		List<Exam> result = new ArrayList<Exam>();

		String sql = "SELECT exam_id, attendance_point, write_point, skill_point, exam_date, exam_file, open_subject_id, count_, \r\n" + 
				"        CASE WHEN count_  <= 0 THEN '성적 입력 전'\r\n" + 
				"		else '성적 입력 완료'\r\n" + 
				"        END score_state\r\n" + 
				"    FROM exam_list3_vw3\r\n" + 
				"    WHERE open_subject_id = ? AND instructor_id = ?";
		
		result = this.jdbcTemplate.query(sql, new ExamMapper18(), os.getOpen_subject_id(), os.getInstructor_id() );
		
		return result;
	}

	@Override
	public List<Exam> printi2() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Exam> print1(Exam exam) {
		
		String sql = "SELECT exam_id, attendance_point, skill_point, subject_point_id, write_point, exam_date, exam_file\r\n" + 
				"      FROM  exam_list1_VW2\r\n" + 
				"      WHERE open_subject_id = ?";
	
		return this.jdbcTemplate.query(sql, new ExamMapper31(), exam.getOpen_subject_id());
	}

	@Override
	public List<Exam> print2() {

		String sql = "SELECT student_id, student_name, student_phone, student_regdate, count_\r\n" + 
				"FROM student_list2_vw";
	
		return this.jdbcTemplate.query(sql, new ExamMapper32());
	}

	@Override
	public List<Exam> print2(Exam exam) {

		String sql = "SELECT student_id, student_name, student_phone, student_regdate, count_\r\n"
				+ "FROM student_list2_vw" + " WHERE student_id = ?";

		return this.jdbcTemplate.query(sql, new ExamMapper32(), exam.getStudent_id());
	}


	@Override
	public List<Exam> print3(OpenSubject os) {
		
		List<Exam> result = new ArrayList<Exam>();
		
		String sql = "SELECT exam_id,  attendance_point, write_point, skill_point , exam_date, exam_file, (SELECT COUNT(*) FROM student_score_tb WHERE exam_id = v2.exam_id)count_\r\n" + 
				"      FROM  exam_list1_VW2 v2\r\n" + 
				"      WHERE open_subject_id = ? AND instructor_id = ?";
		
		result = this.jdbcTemplate.query(sql, new ExamMapper17(), os.getOpen_subject_id(), os.getInstructor_id());
		
		return result;
	}

	@Override
	public List<Exam> print4(Exam e) {

		List<Exam> result = new ArrayList<Exam>();
		
		String sql = "SELECT student_id, student_name, student_phone, student_regDate, \r\n" + 
				"		completion_status, completion_date, \r\n" + 
				"        attendance_score, write_score, skill_score, total_score\r\n" + 
				"	FROM instructor_score2_list2_vw3\r\n" + 
				" 	WHERE exam_id = ?\r\n" + 
				"    AND open_subject_id= ? ";
		
		result = this.jdbcTemplate.query(sql, new ExamMapper19(), e.getExam_id(), e.getOpen_subject_id());
		
		return result;
	}

	@Override
	public List<Exam> print4_1(Exam exam) {
		
		String sql = "SELECT student_id, student_name, student_phone, attendance_score, write_score, skill_score, score\r\n" + 
				"	FROM student_list1_vw1\r\n" + 
				"    WHERE exam_id = ?\r\n" + 
				"    ORDER BY student_id";
		
		return this.jdbcTemplate.query(sql, new ExamMapper52(), exam.getExam_id());
	}
	@Override
	public List<Exam> print5() {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<Exam> print5(Exam exam) {
		System.out.println(exam.getOpen_subject_id());
		System.out.println(exam.getStudent_id());
		String sql = "SELECT exam_id, attendance_score, attendance_point,\r\n" + 
				"		write_score, write_point, skill_score, skill_point\r\n" + 
				"        , score\r\n" + 
				"        , exam_date, exam_file\r\n" + 
				"        FROM student_transcript_vw5\r\n" + 
				"        WHERE open_subject_id = ?\r\n" + 
				"        AND student_id = ?";
		
		return this.jdbcTemplate.query(sql, new ExamMapper53(), exam.getOpen_subject_id(), exam.getStudent_id());
	}
}
