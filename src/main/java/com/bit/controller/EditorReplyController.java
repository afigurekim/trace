package com.bit.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.bit.domain.Criteria;
import com.bit.domain.EditorReplyVO;
import com.bit.domain.PageMaker;
import com.bit.service.EditorReplyService;

@RestController
@RequestMapping("/editor/read/")
public class EditorReplyController {

	@Inject
	private EditorReplyService service;

	@RequestMapping(value = "", method = RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody EditorReplyVO vo) {

		ResponseEntity<String> entity = null;
		try {
			service.addReply(vo);
			entity = new ResponseEntity<String>("SUCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value = "/{bno}", method = RequestMethod.GET)
	public ResponseEntity<List<EditorReplyVO>> list(@PathVariable("bno") Integer bno) {

		ResponseEntity<List<EditorReplyVO>> entity = null;

		try {
			entity = new ResponseEntity<>(service.listReply(bno), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;

	}

	@RequestMapping(value = "/{bno}/{page}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listPage(@PathVariable("bno") Integer bno,
			@PathVariable("page") Integer page) {
		ResponseEntity<Map<String, Object>> entity = null;

		try {
			Criteria cri = new Criteria();
			cri.setPage(page);
			cri.setPerPageNum(5);
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);

			Map<String, Object> map = new HashMap<String, Object>();
			List<EditorReplyVO> list = service.listReplyPage(bno, cri);
			
			map.put("list", list);
			
			int replyCount = service.count(bno);
			System.out.println("댓글갯수 : "+ replyCount);
			pageMaker.setTotalCount(replyCount);
			
			map.put("pageMaker", pageMaker);
			
			entity = new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
		
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
		
	}

	@RequestMapping(value = "/{rno}", method = { RequestMethod.PUT, RequestMethod.PATCH })
	public ResponseEntity<String> update(@PathVariable("rno") Integer rno, @RequestBody EditorReplyVO vo) {

		ResponseEntity<String> entity = null;

		try {
			vo.setRno(rno);
			service.modifyReply(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);

		}
		return entity;
	}

	@RequestMapping(value = "/{rno}", method = RequestMethod.DELETE)
	public ResponseEntity<String> remove(@PathVariable("rno") Integer rno) {
		ResponseEntity<String> entity = null;

		try {
			service.removeReply(rno);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}