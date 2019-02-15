package com.bit.controller;

import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bit.domain.BoardVO;
import com.bit.service.BoardService;

@Controller
public class WriteController {
	private static final Logger logger = LoggerFactory.getLogger(WriteController.class);

	@Inject
	private BoardService service;
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String writeboardget(Locale locale, Model model) {
		
		return "write";
	}
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String writeboardpost(BoardVO vo,RedirectAttributes rtrr,Model model) {
		String[] files = vo.getFiles();
		for (String fileName : files) {
			System.out.println(fileName+"아오 컨트롤러왜안돼냐고");
			
		}
		logger.info("유적지 등록");
		logger.info(vo.toString());
		try {
			service.insert(vo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "write";
	}
}
