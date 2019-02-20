package com.persistance;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.domain.OpenCourse;
import com.domain.OpenSubject;
import com.domain.Subject;
import com.mapper.OpenSubjectMapper01;
import com.mapper.OpenSubjectMapper11;
import com.mapper.OpenSubjectMapper14;
import com.mapper.OpenSubjectMapper15;
import com.mapper.OpenSubjectMapper42;
import com.mapper.OpenSubjectMapper31;
import com.mapper.OpenSubjectMapper32;
import com.mapper.OpenSubjectMapper33;
import com.mapper.OpenSubjectMapper51;

@Repository("openSubjectDAO")
public class OpenSubjectDAOImpl implements OpenSubjectDAO{

	@Resource(name="jdbcTemplate")
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public List<OpenSubject> title() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<OpenSubject> openSubjectTitle(OpenSubject os) {

		List<OpenSubject> result = new ArrayList<OpenSubject>();

		String sql = "SELECT subject_name, subject_start_date, subject_end_date, \r\n" + 
				"		course_name, open_course_start_date, open_course_end_date\r\n" + 
				"	FROM open_subject_title_vw1\r\n" + 
				"    WHERE instructor_id = ? AND open_subject_id = ?";

		result = this.jdbcTemplate.query(sql, new OpenSubjectMapper15(), os.getInstructor_id(), os.getOpen_subject_id());

		return result;
	}
	
	@Override
	public List<OpenSubject> homePrint() {
		List<OpenSubject> result = new ArrayList<OpenSubject>();

		String sql = "SELECT course_name, open_course_start_date, open_course_end_date ,subject_name, subject_start_date, subject_end_date	\r\n"
				+ "		FROM open_subject_list3_vw \r\n"
				+ "		WHERE subject_start_date < now() AND subject_end_date > now()\r\n"
				+ "		AND instructor_id = 'INS001'";

		result = this.jdbcTemplate.query(sql, new OpenSubjectMapper11());

		return result;
	}

	@Override
	public List<OpenSubject> lectureSchedulePrint(OpenSubject os) {
		
		List<OpenSubject> result = new ArrayList<OpenSubject>();
		
		String sql = "SELECT open_subject_id, subject_name, subject_start_date, subject_end_date, \r\n" + 
				"		course_name, open_course_start_date, open_course_end_date, \r\n" + 
				"		classroom_name, subjectbook_isbn, subjectbook_name, s_count, instructor_status\r\n" + 
				"	FROM instructor_lecture_vw2\r\n" + 
				"	WHERE instructor_id = ?\r\n" + 
				"	AND instructor_status = ? ";
		
		result = this.jdbcTemplate.query(sql, new OpenSubjectMapper14(), os.getInstructor_id(), os.getInstructor_status());
		return result;
	}
	
	@Override
	public int insert(OpenSubject os) {
		
		String sql = "INSERT INTO open_subject_tb (open_subject_id, subjectbook_id, subject_id, instructor_id, open_course_id, subject_start_date, subject_end_date)\r\n"
				+ "    VALUES ((SELECT CONCAT('OS', LPAD(IFNULL(SUBSTR(MAX(open_subject_id), 3), 0) + 1, 4, 0)) AS newId FROM open_subject_tb os), ?, ?, ?, ?, ?, ?)";

		return this.jdbcTemplate.update(sql, os.getSubjectbook_id(), os.getSubject_id(), os.getInstructor_id(),
				os.getOpen_course_id(), os.getSubject_start_date().toString(), os.getSubject_end_date().toString());
	}

	@Override
	public List<OpenSubject> print1() {
		String sql = "SELECT classroom_name, max_number, student_count, dropout_count, course_name, open_course_start_date, open_course_end_date \r\n"
				+ "	FROM admin_first_vw\r\n"
				+ "	WHERE open_course_start_date < now() AND open_course_end_date > now()\r\n"
				+ "	ORDER BY classroom_name";
		return this.jdbcTemplate.query(sql, new OpenSubjectMapper01());
	}

	@Override
	public List<OpenSubject> print2() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<OpenSubject> print3() {
		String sql = "SELECT open_subject_id, subject_name, subject_start_date, subject_end_date\r\n" + 
				"	, instructor_name, subjectbook_name\r\n" + 
				"	FROM open_subject_list2_vw2\r\n" + 
				"    WHERE open_course_id = 'OC0001'\r\n" + 
				"    ORDER BY open_subject_id\r\n";
		
		return this.jdbcTemplate.query(sql, new OpenSubjectMapper51());
	}

	@Override
	public List<OpenSubject> print3(String oc_id) {
		String sql = "SELECT open_subject_id, subject_name, subject_start_date, subject_end_date\r\n" + 
				"	, instructor_name, subjectbook_name\r\n" + 
				"	FROM open_subject_list2_vw2\r\n" + 
				"    WHERE open_course_id = ?\r\n" + 
				"    ORDER BY open_subject_id\r\n";
		
		return this.jdbcTemplate.query(sql, new Object[]{oc_id},new OpenSubjectMapper51());
	}

	@Override
	public List<OpenSubject> print3(OpenCourse openCourse) {

		String sql = "SELECT open_subject_id, subject_name, subject_start_date, subject_end_date,  \r\n" + 
				"          instructor_name, subjectbook_name, instructor_id\r\n" + 
				"      FROM open_subject_list1_VW2\r\n" + 
				"      WHERE open_course_id = ?";

		return this.jdbcTemplate.query(sql, new OpenSubjectMapper31(), openCourse.getOpen_course_id());
	}
	
	@Override
	/**********************************쿼리 다시 보기 삭제 가능 여부*********/
	public List<OpenSubject> print4() {

		String sql = "SELECT open_subject_id, subject_name, subject_start_date, subject_end_date, subjectbook_name, \r\n"
				+ "          instructor_name, course_name, open_course_start_date, open_course_end_date,  \r\n"
				+ "          classroom_name \r\n" + "      FROM open_subject_list2_VW2";

		return this.jdbcTemplate.query(sql, new OpenSubjectMapper33());
	}

	@Override
	public List<OpenSubject> print5() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public OpenSubject print6(OpenCourse openCourse) {
		String sql = "SELECT course_name, open_course_start_date, open_course_end_date\r\n" + 
				"	FROM open_subject_list7_vw1\r\n"
				+ "      WHERE open_course_id = ?";
		
		return this.jdbcTemplate.queryForObject(sql, new OpenSubjectMapper32(), openCourse.getOpen_course_id());
	}
	
	@Override
	public int update(OpenSubject os) {

		String sql = "UPDATE open_subject_tb SET subjectbook_id = ?, subject_id = ?"
				+ " , instructor_id = ?, open_course_id = ?, subject_start_date = ?, subject_end_date = ?"
				+ " WHERE open_subject_id=?";

		return this.jdbcTemplate.update(sql, os.getSubjectbook_id(), os.getSubject_id(), os.getInstructor_id(),
				os.getOpen_course_id(), os.getSubject_start_date().toString(), os.getSubject_end_date().toString(), os.getOpen_subject_id());
	}

	@Override
	public int delete(OpenSubject os) {

		String sql = "DELETE FROM open_subject_tb WHERE open_subject_id =?";

		return this.jdbcTemplate.update(sql, os.getOpen_subject_id());
	}

	@Override
	public List<OpenSubject> search1(String key, String value) {

		String sql = "SELECT open_subject_id, subject_name, subject_start_date, subject_end_date, subjectbook_name, \r\n"
				+ "          instructor_name, course_name, open_course_start_date, open_course_end_date,  \r\n"
				+ "          classroom_name, d_count\r\n" + "      FROM open_subject_list2_VW2 ";

		if (key.equals("open_subject_id")) {
			sql += " WHERE open_subject_id = ?";
		} else if (key.equals("subject_name")) {
			sql += " WHERE INSTR(subject_name, ?) > 0 ";
		} else if (key.equals("instructor_name")) {
			sql += " WHERE INSTR(instructor_name, ?) > 0 ";
		} else if (key.equals("course_name")) {
			sql += " WHERE INSTR(course_name, ?) > 0 ";
		}

		return this.jdbcTemplate.query(sql, new OpenSubjectMapper33(), value);
	}

	@Override
	public List<OpenSubject> search2(String key, String value) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<OpenSubject> print1(OpenSubject os) {
		
		String sql = "SELECT open_subject_id, subject_name, subject_start_date, subject_end_date, \r\n" + 
				"		course_name, open_course_start_date, open_course_end_date, \r\n" + 
				"        classroom_name, instructor_status \r\n" + 
				"	FROM admin_instructor_lecture_vw1\r\n" + 
				"    WHERE instructor_id = ?\r\n" + 
				"		AND instructor_status = ?";
		return this.jdbcTemplate.query(sql, new OpenSubjectMapper42(), os.getInstructor_id(), os.getInstructor_status());
	}

	@Override
	public List<OpenSubject> search3(OpenSubject os, String key, String value) {
		System.out.println("검색dao : " +os.getInstructor_id() +" "+os.getCompletion()+ " " +value+ " " +key);
		String sql = "SELECT open_subject_id, subject_name, subject_start_date, subject_end_date, \r\n" + 
				"		course_name, open_course_start_date, open_course_end_date, \r\n" + 
				"        classroom_name, instructor_status \r\n" + 
				"	FROM admin_instructor_lecture_vw1\r\n" + 
				"    WHERE instructor_id = ?\r\n" + 
				"		AND instructor_status = ?";
		
		if(key.equals("opensubject_id")) {
			sql += " AND open_subject_id = ?";
		} else if (key.equals("subject_name")) {
			sql += " AND INSTR(subject_name, ?) > 0 ";
		}else if (key.equals("course_name")) {
			sql += " AND INSTR(course_name, ?) > 0 ";
		}
			
		return this.jdbcTemplate.query(sql,new Object[] {os.getInstructor_id(), os.getInstructor_status(), value} ,new OpenSubjectMapper42());
	}
	
	@Override
	public int deleteInsert(OpenSubject os) {
		String sql1 = "DELETE FROM instructor_possible_tb WHERE instructor_id=?";
		String sql2 = "INSERT INTO instructor_possible_tb (instructor_id, subject_id) VALUES(?,?)";

		int result1 = this.jdbcTemplate.update(sql1, os.getSubject_id());
		int result2 = this.jdbcTemplate.update(sql2, os.getInstructor_id(), os.getSubject_id());
		if (result1 >= 1 && result2 >= 1) {
			return 1;
		} else {
			return 0;
		}
	}


	@Override
	public int osInsert(OpenSubject os) {
		String sql = "INSERT INTO instructor_possible_tb (instructor_id, subject_id) VALUES(?,?)";
		int result = this.jdbcTemplate.update(sql, os.getInstructor_id(), os.getSubject_id());
		return result;
	}

	@Override
	public int osDel(OpenSubject os) {
		String sql = "DELETE FROM instructor_possible_tb WHERE instructor_id=?";
		int result = this.jdbcTemplate.update(sql, os.getInstructor_id());
		return result;
	}
	
}
