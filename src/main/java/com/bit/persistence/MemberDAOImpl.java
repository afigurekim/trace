package com.bit.persistence;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bit.domain.MemberVO;


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

}
