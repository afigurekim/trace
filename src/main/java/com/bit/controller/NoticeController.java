package com.bit.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit.domain.Criteria;
import com.bit.domain.NoticeVO;
import com.bit.domain.PageMaker;
import com.bit.service.NoticeService;
import com.bit.util.Translate;

@Controller
public class NoticeController {
	
	@Inject
	private NoticeService service;

	private Translate tr= new Translate();
	@RequestMapping(value="/notice",method=RequestMethod.GET)
	public String default_list(NoticeVO vo, Model model,Criteria cri) throws Exception {
		cri.setPerPageNum(10);

		model.addAttribute("list",service.listAll(cri));
		PageMaker pageMaker=new PageMaker();
		
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.noticecount());
		model.addAttribute("pageMaker",pageMaker);
		
		return "/notice/list";
	}
	@RequestMapping(value="/{lang}/notice",method=RequestMethod.GET)
	public String list(NoticeVO vo, Model model,Criteria cri,@PathVariable String lang) throws Exception {
		cri.setPerPageNum(10);

		List<NoticeVO> list= service.listAll(cri);
		for(int i=0;i<list.size();i++) {
			list.get(i).setWriter(tr.translate(lang, list.get(i).getWriter(), "historic"));
			list.get(i).setContent(tr.translate(lang, list.get(i).getContent(), "historic"));
			list.get(i).setTitle(tr.translate(lang, list.get(i).getTitle(), "historic"));
		}
		model.addAttribute("list",list);

		PageMaker pageMaker=new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.noticecount());
		model.addAttribute("pageMaker",pageMaker);
		
		return "/notice/list";
	}
	
	@RequestMapping(value="/notice/read",method=RequestMethod.GET)
	public String default_read(Model model,@RequestParam("bno") int bno) throws Exception {
	
	model.addAttribute("read",service.read(bno));
	return "/notice/read";
}
	
	@RequestMapping(value="/{lang}/notice/read",method=RequestMethod.GET)
	public String read(Model model,@RequestParam("bno") int bno,@PathVariable String lang) throws Exception {
	NoticeVO read = service.read(bno);
	read.setWriter(tr.translate(lang, read.getWriter(), "historic"));
	read.setContent(tr.translate(lang, read.getContent(), "historic"));
	read.setTitle(tr.translate(lang, read.getTitle(), "historic"));
	model.addAttribute("read",read);
	return "/notice/read";
}

}