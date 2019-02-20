package com.persistance;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.domain.Admin;
import com.mapper.AdminMapper01;

@Repository("adminDAO")
public class AdminDAOImpl implements AdminDAO {

	@Resource(name="jdbcTemplate")
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public Admin login(String admin_name, String admin_pw) {

		String sql = "SELECT admin_id, admin_name, admin_phone, admin_regDate \r\n" + 
				"	FROM admin_tb\r\n" + 
				"    WHERE admin_name=? AND admin_pw=?";
		
		try {
			
			return this.jdbcTemplate.queryForObject(sql, new AdminMapper01(), admin_name, admin_pw);
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}
	
	@Override
	public List<Admin> info() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int changepw(Admin admin) {
		String sql="update admin_tb set admin_pw=? where admin_id=? and admin_pw=?";
		return this.jdbcTemplate.update(sql, admin.getAdmin_new_pw(), admin.getAdmin_id(), admin.getAdmin_pw());
	}
}
