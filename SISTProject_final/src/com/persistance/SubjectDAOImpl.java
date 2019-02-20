package com.persistance;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.domain.Subject;
import com.mapper.SubjectMapper;

@Repository("subjectDAO")
public class SubjectDAOImpl implements SubjectDAO{

	@Resource(name="jdbcTemplate")
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public int insert(Subject sub) {
		String sql="INSERT INTO subject_tb (subject_id, subject_name)\r\n" + 
				"    VALUES ((SELECT CONCAT('SUB', LPAD(IFNULL(SUBSTR(MAX(subject_id), 4), 0) + 1, 3, 0)) \r\n" + 
				"	AS newId FROM subject_tb s), ?)";
		return this.jdbcTemplate.update(sql, sub.getSubject_name());
	}

	@Override
	public List<Subject> print1() {
		String sql = "SELECT s.subject_id, subject_name,\r\n" + 
				" (SELECT COUNT(*) FROM open_subject_tb WHERE subject_id = s.subject_id) count_\r\n" + 
				"  FROM subject_tb s";
		return this.jdbcTemplate.query(sql, new SubjectMapper());
	}

	@Override
	public int update(Subject sub) {
		String sql="UPDATE subject_tb SET subject_name =? WHERE subject_id=?";
		return this.jdbcTemplate.update(sql, sub.getSubject_name(),sub.getSubject_id());
	}

	@Override
	public int delete(Subject sub) {
		String sql = "DELETE FROM subject_tb WHERE subject_id=?";
		return this.jdbcTemplate.update(sql, sub.getSubject_id());
	}
}
