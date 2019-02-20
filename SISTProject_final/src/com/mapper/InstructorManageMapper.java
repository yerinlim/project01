package com.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.domain.Instructor;

public class InstructorManageMapper implements RowMapper<Instructor> {

	@Override
	public Instructor mapRow(ResultSet rs, int count) throws SQLException {
		
		// 데이터베이스에서 읽어온 결과를
		// 미리 준비한 객체의 특정 변수와 연결
		Instructor ins = new Instructor();
		ins.setInstructor_id(rs.getString("instructor_id"));
		ins.setInstructor_photo_id(rs.getString("instructor_photo_id"));
		ins.setInstructor_name(rs.getString("instructor_name"));
		ins.setInstructor_phone(rs.getString("instructor_phone"));
		ins.setInstructor_regDate(rs.getDate("instructor_regDate"));
		ins.setInstructor_possible(rs.getString("instructor_possible"));
		ins.setInstructor_photo_filepath(rs.getString("instructor_photo_filepath"));
		ins.setCount_(rs.getInt("count_"));
		
		return ins;
	}

}
