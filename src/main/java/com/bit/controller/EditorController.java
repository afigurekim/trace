package com.bit.controller;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit.domain.Criteria;
import com.bit.domain.EditorVO;
import com.bit.domain.PageMaker;
import com.bit.service.EditorService;
import com.bit.util.Translate;

@Controller
public class EditorController {
	

		private static final Logger logger = LoggerFactory.getLogger(EditorController.class);

		@Inject
		EditorService service;
		
		private Translate tr = new Translate();
		// �Խñ� �ҷ�����
		@RequestMapping(value = "/{lang}/editor/listAll", method = RequestMethod.GET)
		public String listAll(Criteria cri,Model model,@PathVariable String lang) throws Exception {
			logger.info("show all list...........");
			//model.addAttribute("list", service.listAll());
			
			logger.info(cri.toString());
			cri.setPerPageNum(10);
			List<EditorVO> list= service.listCriteria(cri, 0);
			for(int i=0;i<list.size();i++) {
				list.get(i).setTitle(tr.translate(lang, list.get(i).getTitle(), "historic"));
				list.get(i).setWriter(tr.translate(lang, list.get(i).getWriter(), "historic"));
			}
			model.addAttribute("list", list);
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			//pageMaker.setTotalCount(300);
			pageMaker.setTotalCount(service.listCountCriteria(cri,0));
			
			int num = pageMaker.getTotalCount();
			System.out.println("getTotalCoun : "+num);
			
			model.addAttribute("pageMaker",pageMaker);
			return "/editor/listAll";
		}// end listAll
		
		@RequestMapping(value = "/editor/listAll", method = RequestMethod.GET)
		public String default_listAll(Criteria cri,Model model) throws Exception {
			logger.info("show all list...........");
			//model.addAttribute("list", service.listAll());
			
			logger.info(cri.toString());
			cri.setPerPageNum(10);
			model.addAttribute("list", service.listCriteria(cri,0));
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			//pageMaker.setTotalCount(300);
			pageMaker.setTotalCount(service.listCountCriteria(cri,0));
			
			int num = pageMaker.getTotalCount();
			System.out.println("getTotalCoun : "+num);
			
			model.addAttribute("pageMaker",pageMaker);
			return "/editor/listAll";
		}// end listAll

		// �ڼ��� ����
		@RequestMapping(value = "/{lang}/editor/read", method = RequestMethod.GET)
		public String read(@RequestParam("bno") int bno, Model model,@PathVariable String lang) throws Exception {
			logger.info("read a list...........");
			EditorVO read=service.read(bno);
			read.setTitle(tr.translate(lang, read.getTitle(), "historic"));
			//System.out.println(read.getContent());
			Pattern pattern  =  Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>");
			Matcher match = pattern.matcher(read.getContent());
			String imgTag = null;
			if(match.find()){ // 이미지 태그를 찾았다면,,
			    imgTag = match.group(0); // 글 내용 중에 첫번째 이미지 태그를 뽑아옴.
			}
			read.setContent(read.getContent().replace(imgTag,"-"));
			read.setContent(tr.translate(lang, read.getContent(), "historic"));
			read.setContent(read.getContent().replace("-", imgTag));
			System.out.println(imgTag);
			read.setWriter(tr.translate(lang, read.getWriter(), "historic"));
			model.addAttribute("read",read);
			return "/editor/read";
		}// end read
		
		@RequestMapping(value = "/editor/read", method = RequestMethod.GET)
		public String default_read(@RequestParam("bno") int bno, Model model) throws Exception {
			logger.info("read a list...........");
			EditorVO read=service.read(bno);
			
			model.addAttribute("read",read);

			return "/editor/read";
		}// end read
		@RequestMapping(value = "/editor/theme_family", method = RequestMethod.GET)
		public String default_family(Criteria cri,Model model) throws Exception {
			logger.info("family list................");
			//model.addAttribute("list", service.listAll());
			logger.info(cri.toString());
			
			cri.setPerPageNum(10);
			model.addAttribute("list", service.listCriteria(cri,1));
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			//pageMaker.setTotalCount(300);
			
			pageMaker.setTotalCount(service.listCountCriteria(cri,1));
			
			int num = pageMaker.getTotalCount();
			System.out.println("getTotalCoun : "+num);
			
			model.addAttribute("pageMaker",pageMaker);
			return "/editor/theme_family";
		}
		
		@RequestMapping(value = "/editor/theme_couple", method = RequestMethod.GET)
		public String default_couple(Criteria cri,Model model) throws Exception {
			logger.info("couple list................");
			//model.addAttribute("list", service.listAll());
			logger.info(cri.toString());
			
			cri.setPerPageNum(10);
			model.addAttribute("list", service.listCriteria(cri,2));
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			//pageMaker.setTotalCount(300);
			
			pageMaker.setTotalCount(service.listCountCriteria(cri,2));
			
			int num = pageMaker.getTotalCount();
			System.out.println("getTotalCoun : "+num);
			
			model.addAttribute("pageMaker",pageMaker);
			return "/editor/theme_couple";
		}
		
		@RequestMapping(value = "/editor/theme_edu", method = RequestMethod.GET)
		public String default_education(Criteria cri,Model model) throws Exception {
			logger.info("education list................");
			//model.addAttribute("list", service.listAll());
			logger.info(cri.toString());
			
			cri.setPerPageNum(10);
			model.addAttribute("list", service.listCriteria(cri,3));
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			//pageMaker.setTotalCount(300);
			
			pageMaker.setTotalCount(service.listCountCriteria(cri,3));
			
			int num = pageMaker.getTotalCount();
			System.out.println("getTotalCoun : "+num);
			
			model.addAttribute("pageMaker",pageMaker);
			return "/editor/theme_edu";
		}
		@RequestMapping(value = "/{lang}/editor/theme_family", method = RequestMethod.GET)
		public String family(Criteria cri,Model model,@PathVariable String lang) throws Exception {
			logger.info("family list................");
			//model.addAttribute("list", service.listAll());
			logger.info(cri.toString());
			
			cri.setPerPageNum(10);
			model.addAttribute("list", service.listCriteria(cri,1));
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			//pageMaker.setTotalCount(300);
			
			pageMaker.setTotalCount(service.listCountCriteria(cri,1));
			
			int num = pageMaker.getTotalCount();
			System.out.println("getTotalCoun : "+num);
			
			model.addAttribute("pageMaker",pageMaker);
			return "/editor/theme_family";
		}
		
		@RequestMapping(value = "/{lang}/editor/theme_couple", method = RequestMethod.GET)
		public String couple(Criteria cri,Model model,@PathVariable String lang) throws Exception {
			logger.info("couple list................");
			//model.addAttribute("list", service.listAll());
			logger.info(cri.toString());
			
			cri.setPerPageNum(10);
			model.addAttribute("list", service.listCriteria(cri,2));
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			//pageMaker.setTotalCount(300);
			
			pageMaker.setTotalCount(service.listCountCriteria(cri,2));
			
			int num = pageMaker.getTotalCount();
			System.out.println("getTotalCoun : "+num);
			
			model.addAttribute("pageMaker",pageMaker);
			return "/editor/theme_couple";
		}
		
		@RequestMapping(value = "/{lang}/editor/theme_edu", method = RequestMethod.GET)
		public String education(Criteria cri,Model model,@PathVariable String lang) throws Exception {
			logger.info("education list................");
			//model.addAttribute("list", service.listAll());
			logger.info(cri.toString());
			
			cri.setPerPageNum(10);
			model.addAttribute("list", service.listCriteria(cri,3));
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			//pageMaker.setTotalCount(300);
			
			pageMaker.setTotalCount(service.listCountCriteria(cri,3));
			
			int num = pageMaker.getTotalCount();
			System.out.println("getTotalCoun : "+num);
			
			model.addAttribute("pageMaker",pageMaker);
			return "/editor/theme_edu";
		}
		
		@RequestMapping(value = "/{lang}/editor/theme_religion", method = RequestMethod.GET)
		public String religion(Criteria cri,Model model,@PathVariable String lang) throws Exception {
			logger.info("religion list................");
			//model.addAttribute("list", service.listAll());
			logger.info(cri.toString());
			
			cri.setPerPageNum(10);
			model.addAttribute("list", service.listCriteria(cri,4));
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			//pageMaker.setTotalCount(300);
			
			pageMaker.setTotalCount(service.listCountCriteria(cri,4));
			
			int num = pageMaker.getTotalCount();
			System.out.println("getTotalCoun : "+num);
			
			model.addAttribute("pageMaker",pageMaker);
			return "/editor/theme_religion";
		}
		
		@RequestMapping(value = "/editor/theme_religion", method = RequestMethod.GET)
		public String default_religion(Criteria cri,Model model) throws Exception {
			logger.info("religion list................");
			//model.addAttribute("list", service.listAll());
			logger.info(cri.toString());
			
			cri.setPerPageNum(10);
			model.addAttribute("list", service.listCriteria(cri,4));
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			//pageMaker.setTotalCount(300);
			
			pageMaker.setTotalCount(service.listCountCriteria(cri,4));
			
			int num = pageMaker.getTotalCount();
			System.out.println("getTotalCoun : "+num);
			
			model.addAttribute("pageMaker",pageMaker);
			return "/editor/theme_religion";
		}
		
}
