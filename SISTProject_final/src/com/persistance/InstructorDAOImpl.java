package com.persistance;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.domain.Instructor;
import com.domain.OpenSubject;
import com.mapper.InstructorIdMapper;
import com.mapper.InstructorManageMapper;
import com.mapper.InstructorMapper01;
import com.mapper.InstructorMapper13;
import com.mapper.InstructorMapper31;

@Repository("instructorDAO")
public class InstructorDAOImpl implements InstructorDAO{

	@Resource(name="jdbcTemplate")
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public List<Instructor> title() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Instructor login(String instructor_name, String instructor_pw) {

		String sql = "SELECT instructor_id, instructor_name, instructor_phone, instructor_regDate\r\n" + 
				"	FROM instructor_tb\r\n" + 
				"    WHERE instructor_name=? AND instructor_pw=?";
		
		try {
			
			return this.jdbcTemplate.queryForObject(sql, new InstructorMapper01(), instructor_name, instructor_pw);
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}
	
	@Override
	public List<Instructor> info() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int changepw(Instructor ins) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Instructor> InstructorImage() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Instructor instructorInfoPrint(OpenSubject os) {

		String sql = "SELECT instructor_id, instructor_name, instructor_phone, instructor_regDate, \r\n" + 
				"		instructor_photo_id, instructor_photo_filepath\r\n" + 
				"	FROM instructor_info_vw1\r\n" + 
				"    WHERE instructor_id = ?";
		
		return this.jdbcTemplate.queryForObject(sql, new InstructorMapper13(), os.getInstructor_id());
	}

	@Override
	public int insert(Instructor ins) {
		String sql1 = "INSERT INTO instructor_tb (instructor_id, instructor_name, instructor_phone,instructor_regDate, instructor_pw)\r\n"
				+ "    VALUES ((SELECT CONCAT('INS', LPAD(IFNULL(SUBSTR(MAX(instructor_id), 4), 0) + 1, 3, 0)) \r\n"
				+ "	AS newId FROM instructor_tb i), ?, ?, ?,?)";
		int result1 = this.jdbcTemplate.update(sql1, ins.getInstructor_name(), ins.getInstructor_phone(),
				ins.getInstructor_regDate().toString(), ins.getInstructor_pw());

		String sql = "SELECT instructor_id FROM instructor_tb ORDER BY instructor_id DESC limit 1";
		List<Instructor> list = this.jdbcTemplate.query(sql, new InstructorIdMapper());
		String temp = "";
		for (Instructor i : list) {
			temp = i.getInstructor_id();
		}

		String sql2 = "INSERT INTO instructor_photo_tb (instructor_photo_id, instructor_photo_filePath, instructor_id)\r\n"
				+ "    VALUES ((SELECT CONCAT('INSP', LPAD(IFNULL(SUBSTR(MAX(instructor_photo_id), 5), 0) + 1, 3, 0)) AS newId FROM instructor_photo_tb ip), ?,?)";
		int result2 = this.jdbcTemplate.update(sql2, ins.getInstructor_photo_filepath(), temp);
		if (result1 >= 1 && result2 >= 1) {
			return 1;
		} else {
			return 0;
		}
	}

	@Override
	public List<Instructor> print1() {
		String sql = "SELECT il.instructor_id, il.instructor_name, il.instructor_phone, il.instructor_regDate,\r\n"
				+ "	instructor_possible, instructor_photo_id, instructor_photo_filePath, count_\r\n"
				+ "from instructor_list1_vw3 il";
		return this.jdbcTemplate.query(sql, new InstructorManageMapper());
	}

	@Override
	public List<Instructor> print2() {
		String sql = "SELECT instructor_id, instructor_name\r\n" + "from instructor_list1_vw2";
		return this.jdbcTemplate.query(sql, new InstructorMapper31());
	}

	@Override
	public int subjectManage() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update1(Instructor ins) {
		String sql1="UPDATE instructor_tb SET instructor_name=?, instructor_phone=?, instructor_regDate=? WHERE instructor_id=?";
		int result1=this.jdbcTemplate.update(sql1, ins.getInstructor_name(), 
				ins.getInstructor_phone(), ins.getInstructor_regDate(), ins.getInstructor_id());
			return result1;
	}
	@Override
	public int update2(Instructor ins) {
		String sql2="UPDATE instructor_photo_tb SET instructor_photo_filePath=? WHERE instructor_id=?";
		int result2=this.jdbcTemplate.update(sql2, ins.getInstructor_photo_filepath(), ins.getInstructor_id());
		return result2;
	}

	@Override
	public int reset(Instructor ins) {
		String sql = "UPDATE instructor_tb SET instructor_pw=? WHERE instructor_id=?";
		return this.jdbcTemplate.update(sql, ins.getInstructor_pw(), ins.getInstructor_id());
	}

	@Override
	public int delete(Instructor ins) {
		String sql = "DELETE FROM instructor_tb WHERE instructor_id=?";
		return this.jdbcTemplate.update(sql, ins.getInstructor_id());
	}

	@Override
	public List<Instructor> search(String key, String value) {
		String sql = "SELECT il.instructor_id, il.instructor_name, il.instructor_phone, il.instructor_regDate,\r\n"
				+ "	instructor_possible, instructor_photo_id, instructor_photo_filePath, count_\r\n"
				+ "    FROM instructor_list1_vw3 il\r\n";
		if (key.equals("instructor_id")) {
			sql += "WHERE il.instructor_id=?\r\n";

		} else if (key.equals("instructor_name")) {
			sql += "WHERE INSTR(instructor_name,?)>0";

		} else if (key.equals("instructor_phone")) {
			sql += "WHERE INSTR(instructor_phone,?)>0;";
		}

		return this.jdbcTemplate.query(sql, new InstructorManageMapper(), value);
	}
}
