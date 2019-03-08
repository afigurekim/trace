package com.bit.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit.domain.Criteria;
import com.bit.domain.NoticeVO;
import com.bit.domain.PageMaker;
import com.bit.service.NoticeService;

@Controller
public class NoticeController {
	
	@Inject
	private NoticeService service;

	
	@RequestMapping(value="/notice",method=RequestMethod.GET)
	public String list(NoticeVO vo, Model model,Criteria cri) throws Exception {
		model.addAttribute("list",service.listAll(cri));
		PageMaker pageMaker=new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.noticecount());
		model.addAttribute("pageMaker",pageMaker);
		
		return "/notice/list";
	}
	
	@RequestMapping(value="/notice/read",method=RequestMethod.GET)
	public String read(Model model,@RequestParam("bno") int bno) throws Exception {
	
	model.addAttribute("read",service.read(bno));
	return "/notice/read";
}

}