package com.bit.service;

import java.io.UnsupportedEncodingException;

import javax.inject.Inject;
import javax.mail.MessagingException;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.bit.domain.MemberVO;
import com.bit.persistence.MemberDAO;
import com.bit.util.MailHandler;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDAO dao;
	
	@Inject
	private JavaMailSender mailSender;
	
	@Override
	public void insertMember(MemberVO vo) {
		// TODO Auto-generated method stub
		dao.insertMember(vo);
	}

	@Override
	public int checkId(String id) {
		return dao.checkId(id);
	}
	
	@Override
	public void emailAuth(String email) {
		
		try {
			MailHandler sendMail = new MailHandler(mailSender);

			sendMail.setSubject("[발자취 투어 서비스 이메일 인증]");

			/*sendMail.setText(
					new StringBuffer().append("<h1>메일인증</h1>")
					.append("<a href='http://localhost:8181/emailcheck/1")
					.append("' target='_blenk'>이메일 인증 확인</a>").toString());
					sendMail.setFrom("forteas2003@skuniv.ac.kr", "Developer");
					sendMail.setTo(email);
					sendMail.send();*/
			
			sendMail.setText(
			new StringBuffer().append("<h1>발자취 투어 메일인증</h1>")
			.append("<a href='http://localhost:8181/emailauth/"+email)
			.append("' target='_blenk'>이메일 인증 확인</a>").toString());
			sendMail.setFrom("forteas2003@skuniv.ac.kr", "Developer");
			sendMail.setTo(email);
			sendMail.send();
	
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}
	@Override
	public void emailAuthCheck(String email) {
		dao.emailAuthCheck(email);
	}
	@Override
	public int emailCheck(String email) {
		return dao.emailCheck(email);
	}
}
