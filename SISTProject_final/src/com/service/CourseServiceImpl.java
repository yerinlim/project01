package com.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.domain.Course;
import com.persistance.CourseDAO;

@Service("courseService")
public class CourseServiceImpl implements CourseService {

	@Resource(name="courseDAO")
	private CourseDAO courseDAO;
	
	@Override
	public int insert(Course cs) {
		return this.courseDAO.insert(cs);
	}

	@Override
	public List<Course> print1() {
		return this.courseDAO.print1();
	}

	@Override
	public int update(Course cs) {
		return this.courseDAO.update(cs);
	}

	@Override
	public int delete(Course cs) {
		return this.courseDAO.delete(cs);
	}
}
