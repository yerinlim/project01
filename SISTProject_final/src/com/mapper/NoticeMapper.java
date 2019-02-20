package com.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.domain.Notice;

public class NoticeMapper implements RowMapper<Notice> {

	@Override
	public Notice mapRow(ResultSet rs, int count) throws SQLException {
		
		// �����ͺ��̽����� �о�� �����
		// �̸� �غ��� ��ü�� Ư�� ������ ����
		Notice notice = new Notice();
		
		notice.setAdmin_id(rs.getString("admin_id"));
		notice.setNotice_content(rs.getString("notice_content"));
		notice.setNotice_id(rs.getString("notice_id"));
		notice.setNotice_regDate(rs.getDate("notice_regDate"));
		
		return notice;
	}

}
