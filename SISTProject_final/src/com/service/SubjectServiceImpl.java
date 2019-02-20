package com.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.domain.Subject;
import com.persistance.SubjectDAO;

@Service("subjectService")
public class SubjectServiceImpl implements SubjectService {

	@Resource(name="subjectDAO")
	private SubjectDAO subjectDAO;
	
	@Override
	public int insert(Subject sub) {
		return this.subjectDAO.insert(sub);
	}

	@Override
	public List<Subject> print1() {
		return this.subjectDAO.print1();
	}

	@Override
	public int update(Subject sub) {
		return this.subjectDAO.update(sub);
	}

	@Override
	public int delete(Subject sub) {
		return this.subjectDAO.delete(sub);
	}
}
