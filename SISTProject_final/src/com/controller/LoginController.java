package com.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.domain.Admin;
import com.domain.Instructor;
import com.domain.Student;
import com.service.AdminService;
import com.service.InstructorService;
import com.service.StudentService;

@Controller
public class LoginController {

	@Resource(name = "studentService")
	private StudentService studentService;

	@Resource(name = "instructorService")
	private InstructorService instructorService;

	@Resource(name = "adminService")
	private AdminService adminService;
	   
	@RequestMapping("/index")
	public String index() {

		//WEB-INF/views/login/loginForm.jsp
		return "common/common_login";
	}
	
	@RequestMapping("/common/login")
	public String login(HttpSession session, String loginType, String loginUsername, String loginPassword) {

		String url = "redirect:/common/loginFail";
		Student studentSession = null;
		Instructor instructorSession = null;
		Admin adminSession = null;
		
		if(loginType.equals("student")) {
			studentSession = this.studentService.login(loginUsername, loginPassword);
			if(studentSession != null) {
				session.setAttribute("student", studentSession);
				url = "redirect:/student/first";
			}
			
		} else if(loginType.equals("instructor")) {
			instructorSession = this.instructorService.login(loginUsername, loginPassword);
			if(instructorSession != null) {
				session.setAttribute("instructor", instructorSession);
				url = "redirect:/instructor/first";
			}
			
		} else if(loginType.equals("admin")) {
			adminSession = this.adminService.login(loginUsername, loginPassword);
			if(adminSession != null) {
				session.setAttribute("admin", adminSession);
				url = "redirect:/admin/first";
			}
		} 
		return url;
	}
	
	@RequestMapping("/common/loginFail")
	public String loginFail() {
		
		return "common/common_loginfailform";
	}
	
	@RequestMapping("/common/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "common/common_logoutform";
	}
}
