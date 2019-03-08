package com.bit.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bit.domain.Criteria;
import com.bit.domain.NoticeVO;

@Service
public interface NoticeService {

	
	public List<NoticeVO> listAll(Criteria cri) throws Exception;
	
	public int noticecount()throws Exception;
	
	public NoticeVO read(Integer bno) throws Exception;
}
