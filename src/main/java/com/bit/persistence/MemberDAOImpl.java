package com.bit.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bit.domain.Criteria;
import com.bit.domain.MemberVO;
import com.bit.domain.ReplyVO;


@Repository
public class MemberDAOImpl implements MemberDAO {

	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.bit.mapper.MemberMapper";


	@Override
	public void insertMember(MemberVO vo) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace+".insertMember",vo);
	}

	@Override
	public int checkId(String id) {
		return sqlSession.selectOne(namespace+".checkId",id);
	}
	
	@Override
	public int emailCheck(String email) {
		return sqlSession.selectOne(namespace+".emailCheck",email);
	}
	
	@Override
	public void emailAuthCheck(String email) {
		int auth=1;
		System.out.println("이메일 인증 check");
		Map<String,Object> paramMap = new HashMap<String,Object>();
		System.out.println(email);
		paramMap.put("auth",auth);
		paramMap.put("email",email);

		
		sqlSession.update(namespace+".emailAuth",paramMap);
	}

	// KDH 2019-02-20
	@Override
	public List<MemberVO> selectMember(String user_id) {
		return sqlSession.selectList(namespace+".selectMember",user_id);
	}

	// KDH 2019-02-21
	@Override
	public void updateMember(MemberVO vo) {
		sqlSession.update(namespace+".updateMember",vo);
	}

	// KDH 2019-02-22
	@Override
	public List<ReplyVO> selectReplyMember(String user_id, Criteria cri) throws Exception {
		Map<String,Object> paramMap= new HashMap<>();
		paramMap.put("user_id", user_id);
		paramMap.put("cri", cri);
		return sqlSession.selectList(namespace+".selectReplyMember",paramMap);
	}

	@Override
	public int countReplyMember(String user_id) throws Exception {
		return sqlSession.selectOne(namespace+".countReplyMember", user_id);
	}

}
