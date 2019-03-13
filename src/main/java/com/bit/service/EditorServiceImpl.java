package com.bit.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.bit.domain.Criteria;
import com.bit.domain.EditorVO;
import com.bit.persistence.EditorDAO;

@Service
public class EditorServiceImpl implements EditorService {
	@Inject
	private EditorDAO dao;
	
	@Override
	//�Խñ� ��ü �ҷ����� 
	public List<EditorVO> listAll() throws Exception {
		// TODO Auto-generated method stub
		return dao.listAll();
	}

	
	@Transactional(isolation=Isolation.READ_COMMITTED)
	@Override
	//select �ϳ��� �Խñ�
	public EditorVO read(Integer bno) throws Exception {
		dao.update(bno);
		return dao.read(bno);
	}


	@Override
	public List<EditorVO> listCriteria(Criteria cri, int theme,String state) throws Exception {
		return dao.listCriteria(cri,theme,state);
	}

	@Override
	public int listCountCriteria(Criteria cri, int theme,String state) throws Exception {
		// TODO Auto-generated method stub
		return dao.countPaging(cri, theme,state);
	}



}
