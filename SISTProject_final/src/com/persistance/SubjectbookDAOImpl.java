package com.persistance;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.domain.Subjectbook;
import com.mapper.SubjectbookMapper;

@Repository("subjectbookDAO")
public class SubjectbookDAOImpl implements SubjectbookDAO{

	@Resource(name="jdbcTemplate")
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public int insert(Subjectbook sb) {
		String sql="INSERT INTO subjectbook_tb (subjectbook_id, subjectbook_name, subjectbook_isbn)\r\n" + 
				"    VALUES ((SELECT CONCAT('SB', LPAD(IFNULL(SUBSTR(MAX(subjectbook_id), 3), 0) + 1, 4, 0)) \r\n" + 
				"	AS newId FROM subjectbook_tb sb), ?, ?)";
		return this.jdbcTemplate.update(sql, sb.getSubjectbook_name(), sb.getSubjectbook_isbn());
	}

	@Override
	public List<Subjectbook> print1() {
		String sql="SELECT subjectbook_id, subjectbook_name, subjectbook_isbn, \r\n" + 
				"(SELECT COUNT(*) FROM open_subject_tb WHERE subjectbook_id = sb.subjectbook_id)count_ FROM subjectbook_tb sb";
		return this.jdbcTemplate.query(sql, new SubjectbookMapper());
	}

	@Override
	public int update(Subjectbook sb) {
		String sql="UPDATE subjectbook_tb SET subjectbook_name =? , subjectbook_isbn=? WHERE subjectbook_id=?";
		return this.jdbcTemplate.update(sql, sb.getSubjectbook_name(), sb.getSubjectbook_isbn(), sb.getSubjectbook_id());
	}

	@Override
	public int delete(Subjectbook sb) {
		String sql="DELETE FROM subjectbook_tb WHERE subjectbook_id=?";
		return this.jdbcTemplate.update(sql, sb.getSubjectbook_id());
	}
}


