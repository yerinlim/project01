package com.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.domain.OpenSubject;
import com.domain.Student;
import com.persistance.StudentDAO;

@Service("studentService")
public class StudentServiceImpl implements StudentService {

	@Resource(name="studentDAO")
	private StudentDAO studentDAO;
	
	@Override
	public List<Student> title() {
		// TODO Auto-generated method stub
		return null;
	}

	//현아 추가
	@Override
	public List<Student> title(String student_id) {
		return this.studentDAO.title(student_id);
	}
	
	@Override
	public Student login(String student_name, String student_pw) {

		return this.studentDAO.login(student_name, student_pw);
	}
	
	@Override
	public List<Student> info() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int changepw(Student s) {
		return this.studentDAO.changepw(s);
	}

	@Override
	public List<Student> studentImage() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Student studentInfoPrint(String student_id) {
		return this.studentDAO.studentInfoPrint(student_id);
	}

	@Override
	public List<Student> printi1(OpenSubject os) {
		
		List<Student> result = this.studentDAO.printi1(os);
		
		return result;
	}

	@Override
	public List<Student> printj1() {
		return this.studentDAO.printj1();
	}
	
	@Override
	public int insert(Student s) {
		return this.studentDAO.insert(s);
	}

	@Override
	public int insertCourse(Student s) {
		return this.studentDAO.insertCourse(s);
	}

	@Override
	public int insertDrop(Student s) {
		return this.studentDAO.insertDrop(s);
	}

	@Override
	public int update(Student s) {
		return this.studentDAO.update(s);
	}

	@Override
	public int reset(Student s) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(Student s) {
		return this.studentDAO.delete(s);
	}

	@Override
	public int deleteCourse(Student s) {
		return this.studentDAO.deleteCourse(s);
	}

	@Override
	public List<Student> search(String key, String value) {
		return this.studentDAO.search(key, value);
	}
	
	//수강생 출력(현아)
	@Override
	public List<Student> print1() {
		return this.studentDAO.print1();
	}
}
