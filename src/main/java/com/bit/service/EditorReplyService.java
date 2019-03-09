package com.bit.service;

import java.util.List;

import com.bit.domain.Criteria;
import com.bit.domain.EditorReplyVO;

public interface EditorReplyService {

	public void addReply(EditorReplyVO vo) throws Exception;
	
	public List<EditorReplyVO> listReply(Integer bno) throws Exception;
	
	public void modifyReply(EditorReplyVO vo) throws Exception;
	
	public void removeReply(Integer rno) throws Exception;
	
	public List<EditorReplyVO> listReplyPage(Integer bno,Criteria cri) throws Exception;
	
	public int count(Integer bno) throws Exception;
}
