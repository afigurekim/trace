package com.bit.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bit.domain.BoardVO;
import com.bit.domain.Criteria;
import com.bit.domain.Historic_siteVO;
import com.bit.domain.Historic_site_detailVO;
import com.bit.domain.Historic_site_starVO;
import com.bit.domain.Nearby_attractionVO;

@Repository	
public class BoardDAOImpl implements BoardDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.bit.mapper.BoardMapper";
	
	@Override
	public void insert(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace+".insertBoard",vo);
	}


	@Override
	public void addAttach(String fullName,int attach_num,Integer bno) throws Exception{
		System.out.println("hi");
		
		Map<String,Object> paramMap = new HashMap<>();
		paramMap.put("fullName", fullName);
		paramMap.put("attach_num", attach_num);
		paramMap.put("bno", bno);
		System.out.println(fullName);
		System.out.println(attach_num);
		System.out.println(bno);
		
		sqlSession.insert(namespace+".addAttach",paramMap);
	}


	@Override
	public void update(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(namespace+".update",vo);
	}


	@Override
	public void delete(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace+".delete",bno);
	}
	
	@Override
	public void star_insert(Historic_site_starVO vo) throws Exception {
		// TODO Auto-generated method stub
	
		sqlSession.insert(namespace+".star_insert",vo);
	}


	@Override
	public int star_check(int bno, String id) throws Exception {
		// TODO Auto-generated method stub
		Map<String,Object>map = new HashMap<String,Object>();
		map.put("bno", bno);
		map.put("id", id);
		
		return sqlSession.selectOne(namespace+".star_check",map);
	}

	
	//메인
	@Override
	public List<Historic_siteVO> MainPeriod() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".mainPeriod");
	}


	@Override
	public List<Historic_siteVO> MainThema() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".mainThema");
	}


	@Override
	public List<Historic_siteVO> MainLocation() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".mainLocation");
	}
	


	@Override
	public List<Historic_siteVO> MainEditer() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}


	//시대별 전체
	@Override
	public List<Historic_siteVO> periodlistAll(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".periodlistAll",cri);
	}
	@Override
	public int periodAllcount() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".periodAllcount");
	}
	
	@Override
	public Historic_siteVO readPeriod(int bno) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".readPeriod",bno);
	}


	@Override
	public List<Historic_siteVO> readPeriodImage(int bno) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".readPeriodImage",bno);
	}
	
	@Override
	public Historic_site_detailVO readPeriod_detail(int bno) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".readPeriod_detail",bno);
	}

	
	@Override
	public List<String> getAttach() throws Exception {
		// TODO Auto-generated method stub
		return  sqlSession.selectList(namespace+".getAttach");
	}



	
	//시대별 리스트
	@Override
	public List<Historic_siteVO> sunsalist(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".sunsalist",cri);
	}

	@Override
	public int sunsacount() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".sunsacount");
	}



	@Override
	public List<Historic_siteVO> samgooklist(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".samgooklist",cri);
	}
	
	@Override
	public int samgookcount() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".samgookcount");
	}


	@Override
	public List<Historic_siteVO> korealist(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".korealist",cri);
	}

	@Override
	public int koreacount() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".koreacount");
	}

	@Override
	public List<Historic_siteVO> josunlist(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".josunlist",cri);
	}


	@Override
	public int josuncount() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".josuncount");
	}


	@Override
	public List<Historic_siteVO> hyundaelist(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".hyundaelist",cri);
	}


	@Override
	public int hyundaecount() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".hyundaecount");
	}

	
	//테마별

	@Override
	public List<Historic_siteVO> themalistAll(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".themalistAll",cri);
	}


	@Override
	public Historic_siteVO readThema(int bno) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".readThema",bno);
	}


	@Override
	public List<Historic_siteVO> readThemaImage(int bno) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".readThemaImage",bno);
	}

	@Override
	public Historic_site_detailVO readThema_detail(int bno) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".readThema_detail",bno);
	}

	@Override
	public List<Historic_siteVO> studylist(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".studylist",cri);
	}


	@Override
	public int studycount() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".studycount");
	}


	@Override
	public List<Historic_siteVO> datelist(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".datelist",cri);
	}

	@Override
	public int datecount() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".datecount");
	}


	@Override
	public List<Historic_siteVO> familylist(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".familylist",cri);
	}


	@Override
	public int familycount() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".familycount");
	}

//지역별
	@Override
	public List<Historic_siteVO> regionlistAll(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".regionlistAll",cri);
	}

	@Override
	public Historic_siteVO readRegion(int bno) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".readRegion",bno);
	}

	@Override
	public Historic_site_detailVO readRegion_detail(int bno) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".readRegion_detail",bno);
	}
	
	@Override
	public List<Historic_siteVO> readRegionImage(int bno) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".readRegionImage",bno);
	}


	@Override
	public List<Historic_siteVO> seoullist(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".seoullist",cri);
	}

	@Override
	public List<Historic_siteVO> incheonlist(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".incheonlist",cri);
	}


	@Override
	public List<Historic_siteVO> kyunggilist(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".kyunggilist",cri);
	}

	@Override
	public int regionAllcount() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".regionAllcount");
	}
	@Override
	public int seoulcount() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".seoulcount");
	}
	
	@Override
	public int incheoncount() throws Exception {
		return sqlSession.selectOne(namespace+".incheoncount");
	}


	
	@Override
	public int kyunggicount() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".kyunggicount");
	}


	@Override
	public List<Historic_siteVO> kangwonlist(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".kangwonlist",cri);
	}


	@Override
	public int kangwoncount() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".kangwoncount");
	}


	@Override
	public List<Historic_siteVO> chungchunglist(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".chungchunglist",cri);
	}


	@Override
	public List<Historic_siteVO> kyungsanglist(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".kyungsanglist",cri);
	}


	@Override
	public List<Historic_siteVO> junlalist(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".junlalist",cri);
	}


	@Override
	public List<Historic_siteVO> jejulist(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".jejulist",cri);
	}


	@Override
	public int chungchungcount() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".chungchungcount");
	}


	@Override
	public int kyungsangcount() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".kyungsangcount");
	}


	@Override
	public int junlacount() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".junlacount");
	}


	@Override
	public int jejucount() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".jejucount");
	}


	@Override
	public List<Nearby_attractionVO> foodlist(int bno) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".foodlist",bno);
	}


	@Override
	public int foodcount(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".foodcount",bno);
	}


	@Override
	public List<Nearby_attractionVO> roomlist(int bno) throws Exception {
		// TODO Auto-generated method stub
		
		return sqlSession.selectList(namespace+".roomlist",bno);
	}


	@Override
	public int roomcount(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".roomcount",bno);
	}


	@Override
	public Nearby_attractionVO read_attraction(int bno, int rno) throws Exception {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("bno", bno);
		map.put("rno", rno);
		return sqlSession.selectOne(namespace+".read_attraction",map);
	}


	@Override
	public List<Nearby_attractionVO> attraction_image(int bno, int rno) throws Exception {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("bno", bno);
		map.put("rno", rno);
		return sqlSession.selectList(namespace+".attraction_image",map);
	}

//댓글 수 
	@Override
	public int reply_count(int bno) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".reply_count",bno);
	}

//조회수 
	@Override
	public void updateViewCnt(int bno) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(namespace+".updateViewCnt",bno);
	}
//readChartList

	@Override
	public List<Historic_site_starVO> readChartList(int bno) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".readChartList",bno);
	}


	@Override
	public List<Historic_siteVO> nearHistoric(Double latlng,int bno,String addr) throws Exception {
		// TODO Auto-generated method stub
		Map <String,Object> map = new HashMap<String,Object>();
		map.put("latlng", latlng);
		map.put("bno", bno);
		map.put("addr",addr);
		return sqlSession.selectList(namespace+".nearHistoric",map);
	}


	@Override
	public List<Historic_siteVO> religionlist(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".religionlist",cri);
	}


	@Override
	public int religioncount() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".religioncount");
	}





	




	



	





	

	
}
