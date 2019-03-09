package com.bit.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bit.domain.Criteria;
import com.bit.domain.EditorReplyVO;
import com.bit.persistence.EditorReplyDAO;

@Service
public class EditorReplyServiceImpl implements EditorReplyService {

	@Inject
	private EditorReplyDAO dao;
	
	@Override
	public void addReply(EditorReplyVO vo) throws Exception {
		dao.create(vo);
	}

	@Override
	public List<EditorReplyVO> listReply(Integer bno) throws Exception {
		return dao.list(bno);
	}

	@Override
	public void modifyReply(EditorReplyVO vo) throws Exception {
		dao.update(vo);
	}

	@Override
	public void removeReply(Integer rno) throws Exception {
		dao.delete(rno);
	}

	@Override
	public List<EditorReplyVO> listReplyPage(Integer bno, Criteria cri) throws Exception {
		
		return dao.listPage(bno, cri);
	}

	@Override
	public int count(Integer bno) throws Exception {
	
		return dao.count(bno);
	}

}
