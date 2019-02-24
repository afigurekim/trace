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
	
	}
}
