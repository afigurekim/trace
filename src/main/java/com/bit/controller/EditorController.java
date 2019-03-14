package com.bit.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.binary.Base64;
import org.omg.CORBA.portable.OutputStream;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.domain.Criteria;
import com.bit.domain.EditorVO;
import com.bit.domain.PageMaker;
import com.bit.service.EditorService;
import com.bit.util.Translate;

@Controller
public class EditorController {
	
	//@Resource(name = "uploadPath")
	//private String uploadPath;
		private static final Logger logger = LoggerFactory.getLogger(EditorController.class);

		@Inject
		EditorService service;
		
		private Translate tr = new Translate();
		// �Խñ� �ҷ�����
		@RequestMapping(value = "/{lang}/editor/listAll", method = RequestMethod.GET)
		public String listAll(Criteria cri,Model model,@PathVariable String lang) throws Exception {
			logger.info("show all list...........");
			//model.addAttribute("list", service.listAll());
			String state="0";
			if(lang.indexOf("eng")!=-1) {
				state="2";
			}else if(lang.indexOf("china")!=-1) {
				state="1";
			}else {
				state="0";
			}
			logger.info(cri.toString());
			cri.setPerPageNum(10);
			List<EditorVO> list= service.listCriteria(cri, 0,state);
			/*for(int i=0;i<list.size();i++) {
				list.get(i).setTitle(tr.translate(lang, list.get(i).getTitle(), "historic"));
				list.get(i).setWriter(tr.translate(lang, list.get(i).getWriter(), "historic"));
			}*/
			model.addAttribute("list", list);
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			//pageMaker.setTotalCount(300);
			pageMaker.setTotalCount(service.listCountCriteria(cri,0,state));
			
			int num = pageMaker.getTotalCount();
			System.out.println("getTotalCoun : "+num);
			
			model.addAttribute("pageMaker",pageMaker);
			return "/editor/listAll";
		}// end listAll
		
		@RequestMapping(value = "/editor/listAll", method = RequestMethod.GET)
		public String default_listAll(Criteria cri,Model model) throws Exception {
			logger.info("show all list...........");
			//model.addAttribute("list", service.listAll());
			String state="0";

			logger.info(cri.toString());
			cri.setPerPageNum(10);
			model.addAttribute("list", service.listCriteria(cri,0,state));
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			//pageMaker.setTotalCount(300);
			pageMaker.setTotalCount(service.listCountCriteria(cri,0,state));
			
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
			/*read.setTitle(tr.translate(lang, read.getTitle(), "historic"));
			Pattern pattern  =  Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>");
			Matcher match = pattern.matcher(read.getContent());
			String imgTag = null;
			if(match.find()){
			    imgTag = match.group(0); 
			}
			read.setContent(read.getContent().replace(imgTag,"-"));
			read.setContent(tr.translate(lang, read.getContent(), "historic"));
			read.setContent(read.getContent().replace("-", imgTag));
			System.out.println(imgTag);
			read.setWriter(tr.translate(lang, read.getWriter(), "historic"));*/
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
			String state="0";
			logger.info("family list................");
			//model.addAttribute("list", service.listAll());
			logger.info(cri.toString());
			
			cri.setPerPageNum(10);
			model.addAttribute("list", service.listCriteria(cri,1,state));
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			//pageMaker.setTotalCount(300);
			
			pageMaker.setTotalCount(service.listCountCriteria(cri,1,state));
			
			int num = pageMaker.getTotalCount();
			System.out.println("getTotalCoun : "+num);
			
			model.addAttribute("pageMaker",pageMaker);
			return "/editor/theme_family";
		}
		
		@RequestMapping(value = "/editor/theme_couple", method = RequestMethod.GET)
		public String default_couple(Criteria cri,Model model) throws Exception {
			String state="0";
			logger.info("couple list................");
			//model.addAttribute("list", service.listAll());
			logger.info(cri.toString());
			
			cri.setPerPageNum(10);
			model.addAttribute("list", service.listCriteria(cri,2,state));
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			//pageMaker.setTotalCount(300);
			
			pageMaker.setTotalCount(service.listCountCriteria(cri,2,state));
			
			int num = pageMaker.getTotalCount();
			System.out.println("getTotalCoun : "+num);
			
			model.addAttribute("pageMaker",pageMaker);
			return "/editor/theme_couple";
		}
		
		@RequestMapping(value = "/editor/theme_edu", method = RequestMethod.GET)
		public String default_education(Criteria cri,Model model) throws Exception {
			String state="0";
			logger.info("education list................");
			//model.addAttribute("list", service.listAll());
			logger.info(cri.toString());
			
			cri.setPerPageNum(10);
			model.addAttribute("list", service.listCriteria(cri,3,state));
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			//pageMaker.setTotalCount(300);
			
			pageMaker.setTotalCount(service.listCountCriteria(cri,3,state));
			
			int num = pageMaker.getTotalCount();
			System.out.println("getTotalCoun : "+num);
			
			model.addAttribute("pageMaker",pageMaker);
			return "/editor/theme_edu";
		}
		@RequestMapping(value = "/{lang}/editor/theme_family", method = RequestMethod.GET)
		public String family(Criteria cri,Model model,@PathVariable String lang) throws Exception {
			String state="0";
			if(lang.indexOf("eng")!=-1) {
				state="2";
			}else if(lang.indexOf("china")!=-1) {
				state="1";
			}else {
				state="0";
			}
			logger.info("family list................");
			
			//model.addAttribute("list", service.listAll());
			logger.info(cri.toString());
			
			cri.setPerPageNum(10);
			model.addAttribute("list", service.listCriteria(cri,1,state));
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			//pageMaker.setTotalCount(300);
			
			pageMaker.setTotalCount(service.listCountCriteria(cri,1,state));
			
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
			String state="0";
			if(lang.indexOf("eng")!=-1) {
				state="2";
			}else if(lang.indexOf("china")!=-1) {
				state="1";
			}else {
				state="0";
			}
			cri.setPerPageNum(10);
			model.addAttribute("list", service.listCriteria(cri,2,state));
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			//pageMaker.setTotalCount(300);
			
			pageMaker.setTotalCount(service.listCountCriteria(cri,2,state));
			
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
			String state="0";
			if(lang.indexOf("eng")!=-1) {
				state="2";
			}else if(lang.indexOf("china")!=-1) {
				state="1";
			}else {
				state="0";
			}
			cri.setPerPageNum(10);
			model.addAttribute("list", service.listCriteria(cri,3,state));
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			//pageMaker.setTotalCount(300);
			
			pageMaker.setTotalCount(service.listCountCriteria(cri,3,state));
			
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
			String state="0";
			if(lang.indexOf("eng")!=-1) {
				state="2";
			}else if(lang.indexOf("china")!=-1) {
				state="1";
			}else {
				state="0";
			}
			cri.setPerPageNum(10);
			model.addAttribute("list", service.listCriteria(cri,4,state));
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			//pageMaker.setTotalCount(300);
			
			pageMaker.setTotalCount(service.listCountCriteria(cri,4,state));
			
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
			String state="0";
		
			cri.setPerPageNum(10);
			model.addAttribute("list", service.listCriteria(cri,4,state));
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			//pageMaker.setTotalCount(300);
			
			pageMaker.setTotalCount(service.listCountCriteria(cri,4,state));
			
			int num = pageMaker.getTotalCount();
			System.out.println("getTotalCoun : "+num);
			
			model.addAttribute("pageMaker",pageMaker);
			return "/editor/theme_religion";
		}
		
		
		@ResponseBody
		   @RequestMapping(value = "/editor/uploadImage/{filename:.+}")
		   public void uploadImage(@PathVariable String filename,HttpServletResponse res) throws Exception {
		     /* System.out.println(filename+"업로드");
		      InputStream in = null;
		      ResponseEntity<byte[]> entity = null;
		      
		      try {
		         String formatName = filename.substring(filename.lastIndexOf(".") + 1);
		         MediaType mType = MediaUtils.getMediaType(formatName);
		         HttpHeaders headers = new HttpHeaders();
		         
		         in = new FileInputStream("" + filename);

		         if (mType != null) {
		            headers.setContentType(mType);
		         } else {
		            filename = filename.substring(filename.indexOf("_") + 1);
		            headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		            headers.add("Content-Disposition",
		                  "attachment; filename\"" + new String(filename.getBytes("UTF-8"), "ISO-8859-1") + "\"");
		         }
		         entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
		      } catch (Exception e) {
		         e.printStackTrace();
		         entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		      } finally {
		         in.close();
		      }
		      System.out.println(entity);*/
			String url="http://www.ktraceadmin.tk/editor/uploadImage/"+URLEncoder.encode(filename, "UTF-8");
			 //= URLEncoder.encode(url, "UTF-8");
				System.out.println(url);
				URL temp =new URL(url);
				URLConnection conn = temp.openConnection();
				InputStream is = conn.getInputStream();
				ServletOutputStream out = res.getOutputStream();
				BufferedInputStream bis=new BufferedInputStream(is);
				BufferedOutputStream bos=new BufferedOutputStream(out);
				byte[] buf=new byte[8];
				int su=0;
				while((su=bis.read(buf))!=-1) {
					System.out.print(su);
					bos.write(buf,0,su);
				}
				
				is.close();
				out.close();
				
		     
		   }
		
}
