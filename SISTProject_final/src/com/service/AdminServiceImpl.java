package com.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.domain.Admin;
import com.persistance.AdminDAO;

@Service("adminService")
public class AdminServiceImpl implements AdminService{

	@Resource(name="adminDAO")
	private AdminDAO adminDAO;
	
	@Override
	public Admin login(String admin_name, String admin_pw) {
		return this.adminDAO.login(admin_name, admin_pw);
	}
	
	@Override
	public List<Admin> info() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int changepw(Admin admin) {
		return this.adminDAO.changepw(admin);
	}
}
