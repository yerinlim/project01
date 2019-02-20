package com.persistance;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.domain.Exam;
import com.domain.OpenCourse;
import com.mapper.OpenCourseMapper21;
import com.mapper.OpenCourseMapper31;
import com.mapper.OpenCourseMapper33;
import com.mapper.OpenCourseMapper51;
import com.mapper.OpenCourseMapper53;
import com.mapper.OpenCourseMapper55;

@Repository("openCourseDAO")
public class OpenCourseDAOImpl implements OpenCourseDAO{

	@Resource(name="jdbcTemplate")
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public List<OpenCourse> title() {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<OpenCourse> title(String oc_id) {
		String sql = "SELECT course_name, open_course_start_date, open_course_end_date \r\n" + 
				"	FROM open_course_list1_vw\r\n" + 
				"    WHERE open_course_id = ?";
		return this.jdbcTemplate.query(sql, new Object[]{oc_id}, new OpenCourseMapper53());
	}

	@Override
	public List<OpenCourse> homePrint() {
		
		String sql = "SELECT course_name, open_course_start_date, open_course_end_date FROM open_course_list3_vw1\r\n" + 
				"WHERE open_course_start_date < now() AND open_course_end_date > now()\r\n" + 
				"AND student_id = ? ";
		
		
		// ST00001에 값 없어서 임시로 ST00027 넣어둠
		return this.jdbcTemplate.query(sql, new OpenCourseMapper53() , "ST00027" );
	}

	@Override
	public List<OpenCourse> prints1(OpenCourse oc) {
		String sql = "SELECT open_course_id, course_name, open_course_start_date, open_course_end_date, classroom_name, completion_status, percent \r\n" + 
				"    FROM pass_non_view4\r\n" + 
				"    WHERE student_id = ? "; 

		return this.jdbcTemplate.query(sql, new OpenCourseMapper21(), oc.getStudent_id());
	}

	@Override
	public List<OpenCourse> prints1(Exam exam) {
		
		String sql = "SELECT open_course_id, course_name, open_course_start_date, open_course_end_date, classroom_name, completion_status, percent \r\n" + 
				"    FROM pass_non_view4\r\n" + 
				"    WHERE student_id = ? AND open_course_id = ? "; 

		return this.jdbcTemplate.query(sql, new OpenCourseMapper21(), exam.getStudent_id(), exam.getOpen_course_id());
	}
	
	@Override
	public int insert(OpenCourse oc) {
		String sql = "INSERT INTO open_course_tb (open_course_id, classroom_id, course_id, open_course_start_date, open_course_end_date)\r\n"
				+ "    VALUES ((SELECT CONCAT('OC', LPAD(IFNULL(SUBSTR(MAX(open_course_id), 3), 0) + 1, 4, 0)) AS newId FROM open_course_tb oc), ?, ?, ?, ?)";
		
		return this.jdbcTemplate.update(sql, oc.getClassroom_id(), oc.getCourse_id(), oc.getOpen_course_start_date().toString(),
				oc.getOpen_course_end_date().toString());
	}

	// 개설 과정 번호 / 과정명 / 개설 과정 시작일 / 개설 과정 종료일 / 강의실명 / 개설 과목 등록 갯수 / 수강생 등록 인원
	// open_course_id, course_name, open_course_start_date ,open_course_end_date, classroom_name, open_subject_count, student_count
	@Override
	public List<OpenCourse> print1() {
		String sql = "SELECT open_course_id, course_name, open_course_start_date, open_course_end_date \r\n" + 
				"	, classroom_name, os_count, d_count\r\n" + 
				"    FROM open_course_list1_vw\r\n" + 
				"    ORDER BY open_course_id";
		
		return this.jdbcTemplate.query(sql, new OpenCourseMapper51());
	}

	@Override
	public List<OpenCourse> print2() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<OpenCourse> print2(String student_id) {
		String sql = "SELECT open_course_id, course_name, open_course_start_date, open_course_end_date\r\n"
				+ "	, classroom_name, os_count, student_id\r\n" + "    FROM open_course_list1_vw2\r\n"
				+ "    WHERE student_id = ?\r\n";
		return this.jdbcTemplate.query(sql, new OpenCourseMapper55(), student_id);
	}
	
	// 과정 id / 과정명
	@Override
	public List<OpenCourse> printj1(OpenCourse oc) {
		
		String sql = "SELECT open_course_id, course_name, open_course_start_date, open_course_end_date FROM student_history_list1_vw1 WHERE student_id = ?";
		return this.jdbcTemplate.query(sql, new OpenCourseMapper31(), oc.getStudent_id());
	}
	
	
	@Override
	public List<OpenCourse> printj2(OpenCourse oc) {
		
		String sql = "SELECT student_id, open_course_id, course_name, open_course_start_date, open_course_end_date, student_id, completion, completion_date\r\n" + 
				"	FROM open_course_list8_vw3\r\n" + 
				"    WHERE student_id = ?";
		
		return this.jdbcTemplate.query(sql, new OpenCourseMapper33(), oc.getStudent_id());
	}
		
	@Override
	public int update(OpenCourse oc) {
		System.out.println(oc.getOpen_course_start_date());
		String sql = "UPDATE open_course_tb SET classroom_id = ?, course_id = ?, open_course_start_date = ?, open_course_end_date = ? WHERE open_course_id=?";
		
		return this.jdbcTemplate.update(sql, oc.getClassroom_id(), oc.getCourse_id(), oc.getOpen_course_start_date().toString(),
				oc.getOpen_course_end_date().toString(), oc.getOpen_course_id());
	}

	@Override
	public int delete(OpenCourse oc) {
		String sql = "DELETE FROM open_course_tb WHERE open_course_id =?";
		return this.jdbcTemplate.update(sql, oc.getOpen_course_id());
	}

	@Override
	public List<OpenCourse> search1(String key, String value) {

		String sql = "SELECT open_course_id, course_name, open_course_start_date, open_course_end_date \r\n"
				+ "	, classroom_name, os_count, d_count\r\n" + "    FROM open_course_list1_vw\r\n";

		if (key.equals("open_course_id")) {
			sql += " WHERE open_course_id = ? ";
		} else if (key.equals("course_name")) {
			sql += " WHERE INSTR (course_name, ?) > 0 ";
		}

		sql += "    ORDER BY open_course_id";

		return this.jdbcTemplate.query(sql, new OpenCourseMapper51(), value);
	}

	@Override
	public List<OpenCourse> search2(String key, String value) {
		// TODO Auto-generated method stub
		return null;
	}

}
