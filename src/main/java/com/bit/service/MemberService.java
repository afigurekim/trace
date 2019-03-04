package com.bit.service;

import java.util.List;

import com.bit.domain.MemberSiteVO;
import com.bit.domain.MemberVO;
import com.bit.domain.ReplyVO;

public interface MemberService {
	
	public int login_email_Check(String id);

	public int login(String id,String pw);
	
	public String find_id(String name,String email);
	
	public String find_pw(String id,String name,String phone,String email);
	
	public void find_pw_email(String fpw,String email)throws Exception;

	
	
	public void insertMember(MemberVO vo);
	
	public int checkId(String id);
	
	public void emailAuth(String email);
	
	public int emailCheck(String email);
	
	public void emailAuthCheck(String email);
	
	// 회원 정보 select 서비스
	public List<MemberVO> selectMember(String user_id) throws Exception;
	
	// 회원 정보 update 서비스
	public void updateMember(MemberVO vo);
	
//	public List<ReplyVO> selectReplyMember(String user_id, Criteria cri) throws Exception;
//	public int countReplyMember(String user_id) throws Exception;
	
	// 내 댓글 select 서비스
	public List<ReplyVO> selectReplyMember(String user_id) throws Exception;
	
	// 찜 목록 select 서비스
	public List<MemberSiteVO> selectSiteMember(String user_id) throws Exception;
	
	// 찜 아이템 delete 서비스
	public void deleteSiteMember(int jno) throws Exception;

	// 찜 아이템 중복 확인 서비스
	public int checkSiteMember(MemberSiteVO vo) throws Exception;

	// 찜 아이템 insert 서비스
	public void insertSiteMember(MemberSiteVO vo) throws Exception;
	
}