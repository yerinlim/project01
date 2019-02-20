package com.persistance;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.domain.Classroom;
import com.mapper.ClassroomMapper;

@Repository("classroomDAO")
public class ClassroomDAOImpl implements ClassroomDAO {

	@Resource(name = "jdbcTemplate")
	private JdbcTemplate jdbcTemplate;

	@Override
	public int insert(Classroom cr) {
		String sql ="INSERT INTO classroom_tb (classroom_id, classroom_name, max_number)\r\n" + 
				"    VALUES ((SELECT CONCAT('CR', LPAD(IFNULL(SUBSTR(MAX(classroom_id), 3), 0) + 1, 2, 0)) \r\n" + 
				"	AS newId FROM classroom_tb c), ?, ?)";
		return this.jdbcTemplate.update(sql, cr.getClassroom_name(), cr.getMax_number());
	}

	@Override
	public List<Classroom> print1() {
		String sql = "SELECT classroom_id, classroom_name, max_number, (SELECT COUNT(*) FROM open_course_tb WHERE classroom_id = c.classroom_id) count_ FROM classroom_tb c";
		return this.jdbcTemplate.query(sql, new ClassroomMapper());
	}
	
	@Override
	public int update(Classroom cr) {
		String sql="UPDATE classroom_tb SET classroom_name =? , max_number= ? WHERE classroom_id=?";
		return this.jdbcTemplate.update(sql, cr.getClassroom_name(), cr.getMax_number(), cr.getClassroom_id());
	}

	@Override
	public int delete(Classroom cr) {
		String sql = "DELETE FROM classroom_tb WHERE classroom_id=?";
		return this.jdbcTemplate.update(sql, cr.getClassroom_id());
	}
}
