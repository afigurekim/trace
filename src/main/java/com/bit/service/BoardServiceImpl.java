package com.bit.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bit.domain.BoardVO;
import com.bit.domain.Criteria;
import com.bit.domain.Historic_siteVO;
import com.bit.domain.Historic_site_detailVO;
import com.bit.domain.Nearby_attractionVO;
import com.bit.persistence.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO dao;

@Transactional
	@Override
	public void insert(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
			dao.insert(vo);
			System.out.println("인설트 vo.getbno"+vo.getBno());
			String[] files = vo.getFiles();
			
			if(files == null) {return;}
			int count=1;
			for (String fileName : files) {
				System.out.println(fileName+"아오 왜안돼냐고");
				
				dao.addAttach(fileName,count,vo.getBno()); 
				count++;
			}
	}


	
	@Override
	public void modify(BoardVO board) throws Exception {
		// TODO Auto-generated method stub
		dao.update(board);
	}
	
	@Override
	public void remove(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(bno);
	}

	
	
	//메인
	
	@Override
	public List<Historic_siteVO> MainPeriod() throws Exception {
		// TODO Auto-generated method stub
		return dao.MainPeriod();
	}

	@Override
	public List<Historic_siteVO> MainThema() throws Exception {
		// TODO Auto-generated method stub
		return dao.MainThema();
	}

	@Override
	public List<Historic_siteVO> MainLocation() throws Exception {
		// TODO Auto-generated method stub
		return dao.MainLocation();
	}

	@Override
	public List<Historic_siteVO> MainEditer() throws Exception {
		// TODO Auto-generated method stub
		return dao.MainEditer();
	}

	
	//시대별
	@Override
	public int sunsacount() throws Exception {
		// TODO Auto-generated method stub
		return dao.sunsacount();
	}

	@Override
	public List<Historic_siteVO> sunsalist(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.sunsalist(cri);
	}

	@Override
	public List<Historic_siteVO> samgooklist(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.samgooklist(cri);
	}

	@Override
	public int samgookcount() throws Exception {
		// TODO Auto-generated method stub
		return dao.samgookcount();
	}

	@Override
	public List<Historic_siteVO> korealist(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.korealist(cri);
	}
	
	@Override
	public int koreacount() throws Exception {
		// TODO Auto-generated method stub
		return dao.koreacount();
	}

	@Override
	public List<Historic_siteVO> josunlist(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.josunlist(cri);
	}

	@Override
	public int jousncount() throws Exception {
		// TODO Auto-generated method stub
		return dao.josuncount();
	}

	@Override
	public List<Historic_siteVO> hyundaelist(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.hyundaelist(cri);
	}

	@Override
	public int hyundaecount() throws Exception {
		// TODO Auto-generated method stub
		return dao.hyundaecount();
	}


	@Override
	public List<Historic_siteVO> periodlistAll(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.periodlistAll(cri);
	}
	@Override
	public int periodAllcount() throws Exception {
		// TODO Auto-generated method stub
		return dao.periodAllcount();
	}
	
	@Override
	public Historic_siteVO readPeriod(int bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.readPeriod(bno);
	}
	@Override
	public List<Historic_siteVO> readPeriodImage(int bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.readPeriodImage(bno);
	}

	@Override
	public List<String> getAttach() throws Exception {
		// TODO Auto-generated method stub
		return dao.getAttach();
	}

	
	//테마별
	@Override
	public List<Historic_siteVO> themalistAll(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.themalistAll(cri);
	}

	@Override
	public Historic_siteVO readThema(int bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.readThema(bno);
	}

	@Override
	public List<Historic_siteVO> readThemaImage(int bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.readThemaImage(bno);
	}

	@Override
	public List<Historic_siteVO> studylist(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.studylist(cri);
	}

	@Override
	public int studycount() throws Exception {
		// TODO Auto-generated method stub
		return dao.studycount();
	}

	@Override
	public List<Historic_siteVO> datelist(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.datelist(cri);
	}

	@Override
	public int datecount() throws Exception {
		// TODO Auto-generated method stub
		return dao.datecount();
	}

	@Override
	public List<Historic_siteVO> familylist(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.familylist(cri);
	}

	@Override
	public int familycount() throws Exception {
		// TODO Auto-generated method stub
		return dao.familycount();
	}

	@Override
	public List<Historic_siteVO> regionlistAll(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.regionlistAll(cri);
	}
	
	@Override
	public Historic_siteVO readRegion(int bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.readRegion(bno);
	}
	@Override
	public Historic_site_detailVO readRegion_detail(int bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.readRegion_detail(bno);
	}

	@Override
	public List<Historic_siteVO> readRegionImage(int bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.readRegionImage(bno);
	}

	@Override
	public List<Historic_siteVO> seoullist(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.seoullist(cri);
	}


	@Override
	public List<Historic_siteVO> incheonlist(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.incheonlist(cri);
	}

	

	@Override
	public List<Historic_siteVO> kyunggilist(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.kyunggilist(cri);
	}


	@Override
	public List<Historic_siteVO> kangwonlist(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.kangwonlist(cri);
	}

	

	@Override
	public List<Historic_siteVO> chungchunglist(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.chungchunglist(cri);
	}

	@Override
	public List<Historic_siteVO> kyungsanglist(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.kyungsanglist(cri);
	}

	@Override
	public List<Historic_siteVO> junlalist(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.junlalist(cri);
	}

	@Override
	public List<Historic_siteVO> jejulist(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.jejulist(cri);
	}
	
	@Override
	public int regionAllcount() throws Exception {
		// TODO Auto-generated method stub
		return dao.regionAllcount();
	}
	@Override
	public int seoulcount() throws Exception {
		// TODO Auto-generated method stub
		return dao.seoulcount();
	}
	
	@Override
	public int incheoncount() throws Exception {
		// TODO Auto-generated method stub
		return dao.incheoncount();
	}

	@Override
	public int kyunggicount() throws Exception {
		// TODO Auto-generated method stub
		return dao.kyunggicount();
	}

	
	@Override
	public int kangwoncount() throws Exception {
		// TODO Auto-generated method stub
		return dao.kangwoncount();
	}
	@Override
	public int chungchungcount() throws Exception {
		// TODO Auto-generated method stub
		return dao.chungchungcount();
	}
	@Override
	public int kyungsangcount() throws Exception {
		// TODO Auto-generated method stub
		return dao.kyungsangcount();
	}

	@Override
	public int junlacount() throws Exception {
		// TODO Auto-generated method stub
		return dao.junlacount();
	}

	@Override
	public int jejucount() throws Exception {
		// TODO Auto-generated method stub
		return dao.jejucount();
	}


	//음식점
	@Override
	public List<Nearby_attractionVO> foodlist(int bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.foodlist(bno);
	}



	@Override
	public int foodcount(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.foodcount(bno);
	}

	//숙박

	@Override
	public List<Nearby_attractionVO> roomlist(int bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.roomlist(bno);
	}



	@Override
	public int roomcount(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.roomcount(bno);
	}



	@Override
	public Nearby_attractionVO read_attraction(int bno, int rno) throws Exception {
		// TODO Auto-generated method stub
		return dao.read_attraction(bno,rno);
	}



	@Override
	public List<Nearby_attractionVO> attraction_image(int bno, int rno) throws Exception {
		// TODO Auto-generated method stub
		return dao.attraction_image(bno,rno);
	}



}
