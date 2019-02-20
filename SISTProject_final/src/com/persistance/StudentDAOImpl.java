package com.persistance;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.domain.OpenSubject;
import com.domain.Student;
import com.mapper.StudentMapper01;
import com.mapper.StudentMapper16;
import com.mapper.StudentMapper21;
import com.mapper.StudentMapper31;
import com.mapper.StudentMapper51;
import com.mapper.StudentMapper52;

@Repository("studentDAO")
public class StudentDAOImpl implements StudentDAO{

	@Resource(name="jdbcTemplate")
	private JdbcTemplate jdbcTemplate;

	@Override
	public List<Student> title() {
		// TODO Auto-generated method stub
		return null;
	}

	//현아 추가
	@Override
	public List<Student> title(String student_id) {
		String sql = "SELECT student_name, student_phone\r\n" + 
				"	FROM student_tb\r\n" + 
				"    WHERE student_id=?";
		return this.jdbcTemplate.query(sql, new StudentMapper52(), student_id);
	}

	@Override
	public Student login(String student_name, String student_pw) {

		String sql = "SELECT student_id, student_name, student_phone, student_regDate\r\n" + 
				"	FROM student_tb\r\n" + 
				"    WHERE student_name=? AND student_pw=?";
		
		try {
			
			return this.jdbcTemplate.queryForObject(sql, new StudentMapper01(), student_name, student_pw);
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}
	
	@Override
	public List<Student> info() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int changepw(Student s) {
		String sql = "UPDATE student_tb SET student_pw = ? WHERE student_id=?";
		return this.jdbcTemplate.update(sql, s.getStudent_new_pw(), s.getStudent_id());
	}

	@Override
	public List<Student> studentImage() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Student studentInfoPrint(String student_id) {
		String sql = "SELECT student_id, student_name, student_phone, student_regDate, \r\n" + 
				"		student_photo_id, student_photo_filepath\r\n" + 
				"	FROM student_info_vw1\r\n" + 
				"    WHERE student_id = ?";

		return this.jdbcTemplate.queryForObject(sql, new StudentMapper21(), student_id);
	}

	@Override
	public List<Student> printi1(OpenSubject os) {

		List<Student> result = new ArrayList<Student>();

		String sql = "SELECT student_id, student_name, student_phone, student_regdate, completion, completion_date \r\n"
				+ "FROM student_list3_vw3\r\n" + " WHERE instructor_id = ?\r\n" + "AND open_subject_id = ? ";

		result = this.jdbcTemplate.query(sql, new StudentMapper16(), os.getInstructor_id(), os.getOpen_subject_id());

		return result;
	}

	@Override
	public List<Student> printj1() {
		String sql = "SELECT student_id, student_name, student_phone, student_regdate, count_, student_photo_filepath  \r\n"
				+ "FROM student_list2_vw ";

		return this.jdbcTemplate.query(sql, new StudentMapper31());
	}
	
	@Override
	public int insert(Student s) {

		String sql = "INSERT INTO student_tb (student_id, student_name, student_phone, student_regDate, student_pw)\r\n"
				+ "    VALUES ((SELECT CONCAT('ST', LPAD(IFNULL(SUBSTR(MAX(student_id), 3), 0) + 1, 5, 0)) \r\n"
				+ "	AS newId FROM student_tb s), ?, ?, ?, ?)";
		
		int result1 = this.jdbcTemplate.update(sql, s.getStudent_name(), s.getStudent_phone(), s.getStudent_regDate().toString(),
						s.getStudent_pw());

		String sql2 = "INSERT INTO student_photo_tb (student_photo_id, student_photo_filePath, student_id)\r\n"
				+ "    VALUES ((SELECT CONCAT('STP', LPAD(IFNULL(SUBSTR(MAX(student_photo_id), 4), 0) + 1, 5, 0)) AS newId FROM student_photo_tb sp), ? ,?)";
		
		int result2 = this.jdbcTemplate.update(sql2, s.getStudent_photo_filepath(), s.getStudent_id());
		
		if (result1 >= 1 && result2 >= 1) {
			return 1;
		} else {
			return 0;
		}

	}

	@Override
	public int insertCourse(Student s) {
		String sql = "INSERT INTO student_history_tb (student_id, open_course_id)\r\n" + "    VALUES (?, ?)";
		return this.jdbcTemplate.update(sql, s.getStudent_id(), s.getOpen_course_id());
	}

	@Override
	public int insertDrop(Student s) {
		System.out.println("22");
		String sql = "INSERT INTO dropout_tb (student_id, open_course_id, dropout_date)\r\n" + "    VALUES (?, ?, ?)";
		
		return this.jdbcTemplate.update(sql, s.getStudent_id(), s.getOpen_course_id(), s.getDropout_date().toString());
	}

	@Override
	public int update(Student s) {
		String sql = "UPDATE student_tb SET student_name =? , student_phone=?, student_regDate = ? WHERE student_id=?";

		int result1 = this.jdbcTemplate.update(sql, s.getStudent_name(), s.getStudent_phone(), s.getStudent_regDate().toString(),
				s.getStudent_id());
		
		String sql2 = "UPDATE student_photo_tb SET student_photo_filepath = ? WHERE student_id=?";
		
		int result2 = this.jdbcTemplate.update(sql2, s.getStudent_photo_filepath(), s.getStudent_id());
		
		if (result1 >= 1 && result2 >= 1) {
			return 1;
		} else {
			return 0;
		}
	}

	@Override
	public int reset(Student s) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(Student s) {
		String sql = "DELETE FROM student_tb WHERE student_id=?";
		return this.jdbcTemplate.update(sql, s.getStudent_id());
	}

	@Override
	public int deleteCourse(Student s) {

		String sql = "DELETE FROM student_history_tb WHERE student_id=? AND open_course_id = ?";
		return this.jdbcTemplate.update(sql, s.getStudent_id(), s.getOpen_course_id());
	}

	@Override
	public List<Student> search(String key, String value) {
		String sql = "SELECT student_id, student_name, student_phone, student_regdate, count_\r\n"
				+ " FROM student_list2_vw";

		if (key.equals("student_id")) {
			sql += " WHERE student_id = ?";
		} else if (key.equals("student_name")) {
			sql += " WHERE INSTR(student_name,?)>0";
		} else if (key.equals("student_phone")) {
			sql += " WHERE INSTR(student_phone,?)>0";
		} else if (key.equals("student_regDate")) {
			sql += " WHERE INSTR(student_regDate,?)>0";
		}

		return this.jdbcTemplate.query(sql, new StudentMapper51(), value);
	}
	
	//수강생 출력(현아)
	@Override
	public List<Student> print1(){
		String sql = "SELECT student_id, student_name, student_phone, student_regDate, count_\r\n" + 
				"	FROM student_list2_VW\r\n" + 
				"    ORDER BY student_id";
		
		return this.jdbcTemplate.query(sql, new StudentMapper51());
	}
}
