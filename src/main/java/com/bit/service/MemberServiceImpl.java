package com.bit.service;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.inject.Inject;
import javax.mail.MessagingException;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.bit.domain.Criteria;
import com.bit.domain.MemberSiteVO;
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
	public void emailAuth(String email,String lang) {

		try {
			System.out.println(lang+"이메일인증 언어");
			MailHandler sendMail = new MailHandler(mailSender);
			if(lang.indexOf("eng")!=-1) {
				sendMail.setSubject("[Footprint Tour Service Email Authentication]");

				/*sendMail.setText(
						new StringBuffer().append("<h1>메일인증</h1>")
						.append("<a href='http://localhost:8181/emailcheck/1")
						.append("' target='_blank'>이메일 인증 확인</a>").toString());
						sendMail.setFrom("forteas2003@skuniv.ac.kr", "Developer");
						sendMail.setTo(email);
						sendMail.send();*/
				
				sendMail.setText(
				new StringBuffer().append("<h1>Footprint Tour Mail Certification</h1>")
				.append("<a href='http://www.ktrace.tk/emailauth/"+email)
				.append("' target='_blank'>Confirm Email Authentication</a>").toString());
				sendMail.setFrom("forteas2003@skuniv.ac.kr", "Developer");
				sendMail.setTo(email);
				sendMail.send();
			}else if(lang.indexOf("china")!=-1) {
				sendMail.setSubject("[足迹之旅服务邮箱认证]");

				/*sendMail.setText(
						new StringBuffer().append("<h1>메일인증</h1>")
						.append("<a href='http://localhost:8181/emailcheck/1")
						.append("' target='_blank'>이메일 인증 확인</a>").toString());
						sendMail.setFrom("forteas2003@skuniv.ac.kr", "Developer");
						sendMail.setTo(email);
						sendMail.send();*/
				
				sendMail.setText(
				new StringBuffer().append("<h1>足迹旅行邮件认证</h1>")
				.append("<a href='http://www.ktrace.tk/emailauth/"+email)
				.append("' target='_blank'>电子邮件认证确认</a>").toString());
				sendMail.setFrom("forteas2003@skuniv.ac.kr", "Developer");
				sendMail.setTo(email);
				sendMail.send();
			}else {
				sendMail.setSubject("[발자취 투어 서비스 이메일 인증]");

				/*sendMail.setText(
						new StringBuffer().append("<h1>메일인증</h1>")
						.append("<a href='http://localhost:8181/emailcheck/1")
						.append("' target='_blank'>이메일 인증 확인</a>").toString());
						sendMail.setFrom("forteas2003@skuniv.ac.kr", "Developer");
						sendMail.setTo(email);
						sendMail.send();*/
				
				sendMail.setText(
				new StringBuffer().append("<h>발자취 이메일 인증</h1>")
				.append("<a href='http://www.ktrace.tk/emailauth/"+email)
				.append("' target='_blank'>이메일 인증 확인</a>").toString());
				sendMail.setFrom("forteas2003@skuniv.ac.kr", "Developer");
				sendMail.setTo(email);
				sendMail.send();
			}
			
	
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

	// 회원 정보 select 서비스
	@Override
	public List<MemberVO> selectMember(String user_id) throws Exception {
		return dao.selectMember(user_id);
	}

	// 회원 정보 update 서비스
	@Override
	public void updateMember(MemberVO vo) {
		dao.updateMember(vo);
	}

//	@Override
//	public List<ReplyVO> selectReplyMember(String user_id, Criteria cri) throws Exception {
//		return dao.selectReplyMember(user_id, cri);
//	}
//
//	@Override
//	public int countReplyMember(String user_id) throws Exception {
//		return dao.countReplyMember(user_id);
//	}
	
	// 내 댓글 select 서비스
	@Override
	public List<ReplyVO> selectReplyMember(String user_id,Criteria cri) throws Exception {
		return dao.selectReplyMember(user_id,cri);
	}
	@Override 
	public int selectMycommentCount(String user_id)throws Exception
	{
		return dao.selectMycommentCount(user_id);
	}

	// 찜 목록 select 서비스
	@Override
	public List<MemberSiteVO> selectSiteMember(String user_id,Criteria cri) throws Exception {
		return dao.selectSiteMember(user_id,cri);
	}

	// 찜 아이템 delete 서비스
	@Override
	public void deleteSiteMember(int jno) throws Exception {
		dao.deleteSiteMember(jno);
	}

	// 찜 아이템 중복 서비스
	@Override
	public int checkSiteMember(MemberSiteVO vo) throws Exception {
		return dao.checkSiteMember(vo);
	}
	
	// 찜 아이템 insert 서비스
	@Override
	public void insertSiteMember(MemberSiteVO vo) throws Exception {
		dao.insertSiteMember(vo);
	}
	
	@Override
	public int login(String id,String pw) {
		// TODO Auto-generated method stub
		return dao.login(id,pw);
	}
	


	@Override
	public int login_email_Check(String id) {
		// TODO Auto-generated method stub
		return dao.login_email_Check(id);
	}
	


	@Override
	public String find_id(String name, String email) {
		// TODO Auto-generated method stub
		return dao.find_id(name, email);
	}
	
	@Override
	public String find_pw(String id, String name,String phone,String email) {
		// TODO Auto-generated method stub
		return dao.find_pw(name, id, phone,email);
	}

	@Override
	public void find_pw_email(String fpw, String email,String state) throws Exception {
		// TODO Auto-generated method stub
		try {
			MailHandler sendMail = new MailHandler(mailSender);

			if(state.indexOf("eng")!=-1) {
				sendMail.setSubject("[Find your footprint password]");

				/*sendMail.setText(
						new StringBuffer().append("<h1>메일인증</h1>")
						.append("<a href='http://localhost:8181/emailcheck/1")
						.append("' target='_blank'>이메일 인증 확인</a>").toString());
						sendMail.setFrom("forteas2003@skuniv.ac.kr", "Developer");
						sendMail.setTo(email);
						sendMail.send();*/
				
				sendMail.setText(
				new StringBuffer().append("<h1>Find your footprint password</h1>")
				.append("Your password is  "+fpw).toString());
				
				sendMail.setFrom("forteas2003@skuniv.ac.kr", "Developer");
				sendMail.setTo(email);
				sendMail.send();
			}else if(state.indexOf("china")!=-1) {
				sendMail.setSubject("[寻找足迹密码]");

				/*sendMail.setText(
						new StringBuffer().append("<h1>메일인증</h1>")
						.append("<a href='http://localhost:8181/emailcheck/1")
						.append("' target='_blank'>이메일 인증 확인</a>").toString());
						sendMail.setFrom("forteas2003@skuniv.ac.kr", "Developer");
						sendMail.setTo(email);
						sendMail.send();*/
				
				sendMail.setText(
				new StringBuffer().append("<h1>寻找足迹密码</h1>")
				.append("您的密码是 "+fpw).toString());
				
				sendMail.setFrom("forteas2003@skuniv.ac.kr", "Developer");
				sendMail.setTo(email);
				sendMail.send();
			}else {
				sendMail.setSubject("[발자취 비밀번호 찾기]");

				/*sendMail.setText(
						new StringBuffer().append("<h1>메일인증</h1>")
						.append("<a href='http://localhost:8181/emailcheck/1")
						.append("' target='_blank'>이메일 인증 확인</a>").toString());
						sendMail.setFrom("forteas2003@skuniv.ac.kr", "Developer");
						sendMail.setTo(email);
						sendMail.send();*/
				
				sendMail.setText(
				new StringBuffer().append("<h1>발자취 비밀번호 찾기</h1>")
				.append("귀하의 비밀번호는 "+fpw+"입니다").toString());
				
				sendMail.setFrom("forteas2003@skuniv.ac.kr", "Developer");
				sendMail.setTo(email);
				sendMail.send();
			}
			
	
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public int selectSiteCount(String user_id) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectSiteCount(user_id);
	}

}