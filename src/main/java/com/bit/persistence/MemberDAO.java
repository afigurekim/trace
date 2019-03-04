package com.bit.persistence;

import java.util.List;

import com.bit.domain.Criteria;
import com.bit.domain.MemberSiteVO;
import com.bit.domain.MemberVO;
import com.bit.domain.ReplyVO;

public interface MemberDAO {
	
	//서지혜
	public int login_email_Check(String id);

	public int login(String id,String pw);
	
	public String find_id(String name,String email);
	
	public String find_pw(String name,String id,String phone,String email);
	
	//윤제
	
	public void insertMember(MemberVO vo);
	
	public int checkId(String id);
	
	public int emailCheck(String email);
	
	public void emailAuthCheck(String email);
	
	// 회원 정보 select DAO by 도형
	public List<MemberVO> selectMember(String user_id);
	
	// 회원 정보 update DAO
	public void updateMember(MemberVO vo);
	
	// 내 댓글 페이징 처리 하려다 망한 코드
//	public List<ReplyVO> selectReplyMember(String user_id, Criteria cri) throws Exception;
//	public int countReplyMember(String user_id) throws Exception;
	
	// 내 댓글 select DAO
	public List<ReplyVO> selectReplyMember(String user_id) throws Exception;
	
	// 내 찜 목록 select DAO
	public List<MemberSiteVO> selectSiteMember(String user_id) throws Exception;
	
	// 내 찜 아이템 delete DAO
	public void deleteSiteMember(int jno) throws Exception;
	
}
