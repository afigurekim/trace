package com.bit.service;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.inject.Inject;
import javax.mail.MessagingException;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.bit.domain.Criteria;
import com.bit.domain.MemberVO;
import com.bit.domain.ReplyVO;
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

			sendMail.setSubject("[������ ���� ���� �̸��� ����]");

			/*sendMail.setText(
					new StringBuffer().append("<h1>��������</h1>")
					.append("<a href='http://localhost:8181/emailcheck/1")
					.append("' target='_blenk'>�̸��� ���� Ȯ��</a>").toString());
					sendMail.setFrom("forteas2003@skuniv.ac.kr", "Developer");
					sendMail.setTo(email);
					sendMail.send();*/
			
			sendMail.setText(
			new StringBuffer().append("<h1>������ ���� ��������</h1>")
			.append("<a href='http://localhost:8181/emailauth/"+email)
			.append("' target='_blenk'>�̸��� ���� Ȯ��</a>").toString());
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

	// KDH 2019-02-20
	@Override
	public List<MemberVO> selectMember(String user_id) throws Exception {
		return dao.selectMember(user_id);
	}

	@Override
	public void updateMember(MemberVO vo) {
		dao.updateMember(vo);
	}

	@Override
	public List<ReplyVO> selectReplyMember(String user_id, Criteria cri) throws Exception {
		return dao.selectReplyMember(user_id, cri);
	}

	@Override
	public int countReplyMember(String user_id) throws Exception {
		return dao.countReplyMember(user_id);
	}
}
