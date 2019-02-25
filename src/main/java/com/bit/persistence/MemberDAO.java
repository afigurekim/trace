package com.bit.persistence;

import java.util.List;

import com.bit.domain.Criteria;
import com.bit.domain.MemberVO;
import com.bit.domain.ReplyVO;

public interface MemberDAO {
	
	public void insertMember(MemberVO vo);
	
	public int checkId(String id);
	
	public int emailCheck(String email);
	
	public void emailAuthCheck(String email);
	
	// KDH 2019-02-20
	public List<MemberVO> selectMember(String user_id);
	
	// KDH 2019-02-21
	public void updateMember(MemberVO vo);
	
	// KDH 2019-02-22
	public List<ReplyVO> selectReplyMember(String user_id, Criteria cri) throws Exception;
	public int countReplyMember(String user_id) throws Exception;
	
}
