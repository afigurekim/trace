package com.bit.persistence;

import com.bit.domain.MemberVO;

public interface MemberDAO {
	
	public void insertMember(MemberVO vo);
	
	public int checkId(String id);
	
	public int emailCheck(String email);
	
	public void emailAuthCheck(String email);
	
}
