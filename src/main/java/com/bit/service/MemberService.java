package com.bit.service;

import java.util.List;

import com.bit.domain.Criteria;
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
	
	// KDH 2019-02-20
	public List<MemberVO> selectMember(String user_id) throws Exception;
	
	// KDH 2019-02-21
	public void updateMember(MemberVO vo);
	
	// KDH 2019-02-22
	public List<ReplyVO> selectReplyMember(String user_id, Criteria cri) throws Exception;
	public int countReplyMember(String user_id) throws Exception;
	
}
