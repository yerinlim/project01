package com.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.domain.OpenCourse;
import com.domain.OpenSubject;
import com.domain.Subject;
import com.persistance.OpenSubjectDAO;

@Service("openSubjectService")
public class OpenSubjectServiceImpl implements OpenSubjectService {

	@Resource(name="openSubjectDAO")
	private OpenSubjectDAO openSubjectDAO;
	
	@Override
	public List<OpenSubject> title() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<OpenSubject> openSubjectTitle(OpenSubject os) {
		return this.openSubjectDAO.openSubjectTitle(os);
	}
	
	@Override
	public List<OpenSubject> homePrint() {
		return this.openSubjectDAO.homePrint();
	}
	
	@Override
	public List<OpenSubject> lectureSchedulePrint(OpenSubject os) {
		return this.openSubjectDAO.lectureSchedulePrint(os);
	}

	@Override
	public int insert(OpenSubject os) {
		return this.openSubjectDAO.insert(os);
	}
	
	@Override
	public List<OpenSubject> print1() {
		return this.openSubjectDAO.print1();
	}

	@Override
	public List<OpenSubject> print2() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<OpenSubject> print3() {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<OpenSubject> print3(String oc_id) {
		return this.openSubjectDAO.print3(oc_id);
	}
	
	@Override
	public List<OpenSubject> print3(OpenCourse openCourse) {
		return this.openSubjectDAO.print3(openCourse);
	}

	@Override
	public List<OpenSubject> print4() {
		return this.openSubjectDAO.print4();
	}

	@Override
	public List<OpenSubject> print5() {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public OpenSubject print6(OpenCourse opencourse) {
		return this.openSubjectDAO.print6(opencourse);
	}

	@Override
	public int update(OpenSubject os) {
		return this.openSubjectDAO.update(os);
	}

	@Override
	public int delete(OpenSubject os) {
		return this.openSubjectDAO.delete(os);
	}
	
	@Override
	public List<OpenSubject> search1(String key, String value) {
		return this.openSubjectDAO.search1(key, value);
	}

	@Override
	public List<OpenSubject> search2(String key, String value) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteInsert(OpenSubject os) {
		return this.openSubjectDAO.deleteInsert(os);
	}

	@Override
	public List<OpenSubject> print1(OpenSubject os) {
		return this.openSubjectDAO.print1(os);
	}

	@Override
	public List<OpenSubject> search3(OpenSubject os, String key, String value) {
		return this.openSubjectDAO.search3(os, key, value);
	}

	@Override
	public int osInsert(OpenSubject os) {

		return this.openSubjectDAO.osInsert(os);
	}

	@Override
	public int osDel(OpenSubject os) {
		return this.openSubjectDAO.osDel(os);
	}


}
