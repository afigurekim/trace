package com.bit.service;

import java.util.List;

import com.bit.domain.Criteria;
import com.bit.domain.EditorVO;

public interface EditorService {

	public EditorVO read(Integer bno) throws Exception;
	
	public List<EditorVO> listAll() throws Exception;
	
	public List<EditorVO> listCriteria(Criteria cri,int theme) throws Exception;
	
	public int listCountCriteria(Criteria cri,int theme) throws Exception;

}
