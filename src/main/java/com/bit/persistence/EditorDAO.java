package com.bit.persistence;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bit.domain.Criteria;
import com.bit.domain.EditorVO;
import com.bit.domain.ReplyVO;

@Repository
public interface EditorDAO {

	//주은
	//게시글 자세히 읽기
	public EditorVO read(Integer bno) throws Exception;
	//리스트 불러오기
	public List<EditorVO> listAll() throws Exception;
	//조회수 
	public void update(Integer bno) throws Exception;
	//페이징
	public List<EditorVO> listPage(int page) throws Exception;
	public List<EditorVO> listCriteria(Criteria cri,int theme,String state) throws Exception;
	public int countPaging(Criteria cri, int theme,String state) throws Exception;

}
