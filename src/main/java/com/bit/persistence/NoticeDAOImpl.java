package com.bit.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bit.domain.Criteria;
import com.bit.domain.NoticeVO;

@Repository
public class NoticeDAOImpl implements NoticeDAO{
	
	@Inject
	private SqlSession sqlsession;
	
	private static String namespace="com.bit.mapper.NoticeMapper";
	

	@Override
	public List<NoticeVO> listAll(Criteria cri) throws Exception {
		
		return sqlsession.selectList(namespace+".listAll",cri);
	}
	@Override
	public NoticeVO read(Integer bno) throws Exception {
		
		return sqlsession.selectOne(namespace+".read",bno);
	}
	
	@Override
	public void updateViewCnt(int bno) throws Exception {

		sqlsession.update(namespace+".updateViewCnt",bno);
		
	}
	@Override
	public int noticecount() throws Exception {
		
		return sqlsession.selectOne(namespace+".noticecount");
	}

}
