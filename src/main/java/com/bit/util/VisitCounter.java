package com.bit.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.bit.domain.VisitCountVO;
import com.bit.persistence.VisitCountDAOImpl;

public class VisitCounter implements HttpSessionListener {

	@Override
	public void sessionCreated(HttpSessionEvent arg0) {
		  HttpSession session = arg0.getSession();
          WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(session.getServletContext());
          //등록되어있는 빈을 사용할수 있도록 설정해준다
          HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
          //request를 파라미터에 넣지 않고도 사용할수 있도록 설정
          VisitCountDAOImpl visitCountDAO = (VisitCountDAOImpl)wac.getBean("visitCountDAO");
          VisitCountVO vo = new VisitCountVO();
          vo.setVisit_ip(req.getRemoteAddr());
          vo.setVisit_agent(req.getHeader("User-Agent"));//브라우저 정보
          try {
			visitCountDAO.insertVisitor(vo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		// TODO Auto-generated method stub

	}

}
