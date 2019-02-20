package com.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.domain.Classroom;
import com.persistance.ClassroomDAO;

@Service("classroomService")
public class ClassroomServiceImpl implements ClassroomService {

	@Resource(name="classroomDAO")
	private ClassroomDAO classroomDAO;
	
	@Override
	public int insert(Classroom cr) {
		return this.classroomDAO.insert(cr);
	}

	@Override
	public List<Classroom> print1() {
		return this.classroomDAO.print1();
	}

	@Override
	public int update(Classroom cr) {
		return this.classroomDAO.update(cr);
	}

	@Override
	public int delete(Classroom cr) {
		return this.classroomDAO.delete(cr);
	}
}
