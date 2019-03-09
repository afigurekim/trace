package com.bit.persistence;

import java.util.List;

import com.bit.domain.Criteria;
import com.bit.domain.EditorReplyVO;

public interface EditorReplyDAO {
	public List<EditorReplyVO> list(Integer bno)throws Exception;
	
	public void create(EditorReplyVO vo)throws Exception;
	
	public void update(EditorReplyVO vo) throws Exception;
	
	public void delete(Integer rno)throws Exception;
	
	public List<EditorReplyVO> listPage(Integer bno,Criteria cri) throws Exception;
	
	public int count(Integer bno) throws Exception;
}
