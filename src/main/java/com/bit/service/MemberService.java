package com.bit.service;

import com.bit.domain.MemberVO;

public interface MemberService {
	
	public void insertMember(MemberVO vo);
	
	public int checkId(String id);
	
	public void emailAuth(String email);
	
	public int emailCheck(String email);
	
	public void emailAuthCheck(String email);
}
