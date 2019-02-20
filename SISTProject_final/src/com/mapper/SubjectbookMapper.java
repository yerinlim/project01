package com.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.domain.Subjectbook;

public class SubjectbookMapper implements RowMapper<Subjectbook> {

	@Override
	public Subjectbook mapRow(ResultSet rs, int count) throws SQLException {
		
		// 데이터베이스에서 읽어온 결과를
		// 미리 준비한 객체의 특정 변수와 연결
		Subjectbook sb = new Subjectbook();
		sb.setSubjectbook_id(rs.getString("subjectbook_id"));
		sb.setSubjectbook_name(rs.getString("subjectbook_name"));
		sb.setSubjectbook_isbn(rs.getString("subjectbook_isbn"));
		sb.setCount_(rs.getInt("count_"));
		return sb;
	}
}
