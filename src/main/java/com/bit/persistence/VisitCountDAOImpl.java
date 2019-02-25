package com.bit.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bit.domain.VisitCountVO;


@Repository
public class VisitCountDAOImpl{

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.bit.mapper.VisitorMapper";
	
	public int insertVisitor(VisitCountVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace+".insertVisitor",vo);
	}

}
