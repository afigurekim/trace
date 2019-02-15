package com.bit.web;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bit.domain.MemberVO;
import com.bit.persistence.MemberDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations= {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class MysqlConnection {
	
	@Inject
	private MemberDAO dao;
	
	
	
	@Test
	public void testInsertMember()throws Exception{
		MemberVO vo = new MemberVO();
		vo.setUsername("김윤제");
		vo.setUserid("forteas2");
		vo.setUserpw("godqhr52");
		vo.setBirthday("19920213");
		vo.setSex("남");
		vo.setPost("201322");
		vo.setAddress1("서울시 성북구 정릉2동");
		vo.setAddress2("수석하이빌 303호 206-99");
		vo.setEmail("forteas2003@hanmail.net");
		dao.insertMember(vo);
	}
}
