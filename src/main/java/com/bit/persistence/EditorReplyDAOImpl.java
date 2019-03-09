package com.bit.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bit.domain.Criteria;
import com.bit.domain.EditorReplyVO;

@Repository
public class EditorReplyDAOImpl implements EditorReplyDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.bit.mappers.EditorReplyMapper";

	@Override
	public List<EditorReplyVO> list(Integer bno) throws Exception {
		return session.selectList(namespace + ".list",bno);
	}

	@Override
	public void create(EditorReplyVO vo) throws Exception {
		session.insert(namespace + ".create",vo);
	}

	@Override
	public void update(EditorReplyVO vo) throws Exception {
		session.update(namespace + ".update",vo);
	}

	@Override
	public void delete(Integer rno) throws Exception {
		session.delete(namespace + ".delete",rno);
	}

	@Override
	public List<EditorReplyVO> listPage(Integer bno, Criteria cri) throws Exception {
		
		Map<String,Object> paramMap= new HashMap<>();
		
		paramMap.put("bno",bno);
		paramMap.put("cri", cri);
		
		return session.selectList(namespace+".listPage",paramMap);
	}

	@Override
	public int count(Integer bno) throws Exception {
		
		return session.selectOne(namespace+ ".count",bno);
	}

}
