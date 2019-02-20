package com.persistance;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.domain.Notice;
import com.mapper.NoticeMapper12;

@Repository("noticeDAO")
public class NoticeDAOImpl implements NoticeDAO{

	@Resource(name="jdbcTemplate")
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public List<Notice> notice() {
		
		List<Notice> result = new ArrayList<Notice>();
		
		String sql = "SELECT notice_content, notice_regDate FROM notice_tb\r\n" + 
				"ORDER BY notice_id DESC\r\n" + 
				"limit 5";
		
		result = this.jdbcTemplate.query(sql,new NoticeMapper12());
		
		return result;
	}
}
