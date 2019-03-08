package com.bit.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bit.domain.Criteria;
import com.bit.domain.NoticeVO;
import com.bit.persistence.NoticeDAO;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Inject
	private NoticeDAO dao;

	@Override
	public List<NoticeVO> listAll(Criteria cri) throws Exception {
		
		return dao.listAll(cri);
	}


	@Transactional	
	@Override
		public NoticeVO read(Integer bno) throws Exception {
			dao.updateViewCnt(bno);
			return dao.read(bno);
		}


	@Override
	public int noticecount() throws Exception {
		
		return dao.noticecount();
	}
	
}
