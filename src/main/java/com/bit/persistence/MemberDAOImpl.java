package com.bit.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bit.domain.MemberSiteVO;
import com.bit.domain.MemberVO;
import com.bit.domain.ReplyVO;


@Repository
public class MemberDAOImpl implements MemberDAO {

	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.bit.mapper.MemberMapper";

//윤제
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
		System.out.println("�̸��� ���� check");
		Map<String,Object> paramMap = new HashMap<String,Object>();
		System.out.println(email);
		paramMap.put("auth",auth);
		paramMap.put("email",email);

		
		sqlSession.update(namespace+".emailAuth",paramMap);
	}
////////////////////////////////////////////
	// 회원 정보 select DAO by 도형
	@Override
	public List<MemberVO> selectMember(String user_id) {
		return sqlSession.selectList(namespace+".selectMember",user_id);
	}

	// 회원 정보 update DAO
	@Override
	public void updateMember(MemberVO vo) {
		sqlSession.update(namespace+".updateMember",vo);
	}

	// 내 댓글 페이징 처리 하려다 망한 코드
//	@Override
//	public List<ReplyVO> selectReplyMember(String user_id, Criteria cri) throws Exception {
//		Map<String,Object> paramMap= new HashMap<>();
//		paramMap.put("user_id", user_id);
//		paramMap.put("cri", cri);
//		return sqlSession.selectList(namespace+".selectReplyMember",paramMap);
//	}
//
//	@Override
//	public int countReplyMember(String user_id) throws Exception {
//		return sqlSession.selectOne(namespace+".countReplyMember", user_id);
//	}
	
	// 내 댓글 select DAO
	@Override
	public List<ReplyVO> selectReplyMember(String user_id) throws Exception {
		return sqlSession.selectList(namespace+".selectReplyMember",user_id);
	}

	// 내 찜 목록 select DAO
	@Override
	public List<MemberSiteVO> selectSiteMember(String user_id) throws Exception {
		return sqlSession.selectList(namespace+".selectSiteMember",user_id);
	}

	// 내 찜 아이템 delete DAO
	@Override
	public void deleteSiteMember(int jno) throws Exception {
		sqlSession.delete(namespace+".deleteSiteMember", jno);
	}
//////////////////////////////////////////////////////////////////////////////////
	//지혜
	@Override
	public int login(String id,String pw) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("id",id);
		map.put("pw",pw);
		return sqlSession.selectOne(namespace+".login",map);
	}
	
	@Override
	public int login_email_Check(String id) {
		return sqlSession.selectOne(namespace+".login_email_Check",id);
	}
	
	@Override
	public String find_id(String name, String email) {
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("name",name);
		map.put("email",email);
		return sqlSession.selectOne(namespace+".find_id",map);
	}
	
	@Override
	public String find_pw(String name, String id, String phone,String email) {
		Map<String , Object> map=new HashMap<String, Object>();
		map.put("phone",phone);
	
		map.put("name",name);
		map.put("id",id);
		map.put("email",email);
		return sqlSession.selectOne(namespace+".find_pw",map);
	}

////////////////////////////////////////////////////////////////////////////////////

}
