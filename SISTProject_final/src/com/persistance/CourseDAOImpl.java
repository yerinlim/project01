package com.persistance;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.domain.Course;
import com.mapper.CourseMapper;

@Repository("courseDAO")
public class CourseDAOImpl implements CourseDAO{

	@Resource(name="jdbcTemplate")
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public int insert(Course cs) {
		String sql = "INSERT INTO course_tb (course_id, course_name)\r\n" + 
				"    VALUES ((SELECT CONCAT('CS', LPAD(IFNULL(SUBSTR(MAX(course_id), 3), 0) + 1, 4, 0)) AS newId FROM course_tb c), ?)";
		return this.jdbcTemplate.update(sql, cs.getCourse_name());
	}
	
	@Override
	public List<Course> print1() {
		String sql="SELECT course_id, course_name, (SELECT COUNT(*) FROM open_course_tb WHERE course_id = c.course_id) count_ FROM course_tb c";
		return this.jdbcTemplate.query(sql, new CourseMapper());
	}
	
	@Override
	public int update(Course cs) {
		String sql="UPDATE course_tb SET course_name =? WHERE course_id=?";
		return this.jdbcTemplate.update(sql, cs.getCourse_name(),cs.getCourse_id());
	}

	@Override
	public int delete(Course cs) {
		String sql="DELETE FROM course_tb WHERE course_id=?";
		return this.jdbcTemplate.update(sql, cs.getCourse_id());
	}
}
