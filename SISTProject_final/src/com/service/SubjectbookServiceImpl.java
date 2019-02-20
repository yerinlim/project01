package com.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.domain.Subjectbook;
import com.persistance.SubjectbookDAO;

@Service("subjectbookService")
public class SubjectbookServiceImpl implements SubjectbookService {

	@Resource(name="subjectbookDAO")
	private SubjectbookDAO subjectbookDAO;
	
	@Override
	public int insert(Subjectbook sb) {
		return this.subjectbookDAO.insert(sb);
	}

	@Override
	public List<Subjectbook> print1() {
		return this.subjectbookDAO.print1();
	}

	@Override
	public int update(Subjectbook sb) {
		return this.subjectbookDAO.update(sb);
	}

	@Override
	public int delete(Subjectbook sb) {
		return this.subjectbookDAO.delete(sb);
	}
}

