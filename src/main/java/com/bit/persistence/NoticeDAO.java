package com.bit.persistence;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bit.domain.Criteria;
import com.bit.domain.NoticeVO;

@Repository
public interface NoticeDAO {
	
	public List<NoticeVO> listAll(Criteria cri) throws Exception;
	
	public int noticecount()throws Exception;
	
	public NoticeVO read(Integer bno) throws Exception;
	
	public void updateViewCnt(int bno)throws Exception;

}
