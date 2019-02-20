package com.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.domain.Notice;

public class NoticeMapper12 implements RowMapper<Notice>{

	@Override
	public Notice mapRow(ResultSet rs, int count) throws SQLException {

		Notice n = new Notice();
		
		n.setNotice_content(rs.getString("notice_content"));
		n.setNotice_regDate(rs.getDate("notice_regDate"));
		
		return n;
	}

}
