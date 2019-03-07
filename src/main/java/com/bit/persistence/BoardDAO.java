package com.bit.persistence;

import java.util.List;

import com.bit.domain.BoardVO;
import com.bit.domain.Criteria;
import com.bit.domain.Historic_siteVO;
import com.bit.domain.Historic_site_detailVO;
import com.bit.domain.Historic_site_starVO;
import com.bit.domain.Nearby_attractionVO;

public interface BoardDAO {
	
	public void insert(BoardVO vo)throws Exception;


	public void update(BoardVO vo)throws Exception;
	
	public void delete(Integer bno)throws Exception;
	//근처 유적지

	public List<Historic_siteVO> nearHistoric(Double latlng,int bno)throws Exception;
	
	//별점 주기
	public void star_insert(Historic_site_starVO vo) throws Exception;
	
	public int star_check(int bno,String id) throws Exception;
	
	
	//메인
	public List<Historic_siteVO>MainPeriod() throws Exception;
	
	public List<Historic_siteVO>MainThema() throws Exception;
	
	public List<Historic_siteVO>MainLocation() throws Exception;
	
	public List<Historic_siteVO>MainEditer()throws Exception;
	

	
	//시대별
	
	public List<Historic_siteVO> sunsalist(Criteria cri) throws Exception;
	

	public int sunsacount() throws Exception;
	
	public List<Historic_siteVO> samgooklist(Criteria cri) throws Exception;
	
	public int samgookcount() throws Exception;
	
	public List<Historic_siteVO> korealist(Criteria cri) throws Exception;
	
	public int koreacount() throws Exception;
	
	public List<Historic_siteVO> josunlist(Criteria cri) throws Exception;
	
	public int josuncount() throws Exception;
	
	public List<Historic_siteVO> hyundaelist(Criteria cri) throws Exception;
	
	public int hyundaecount() throws Exception;
	
	public List<Historic_siteVO> periodlistAll(Criteria cri)throws Exception;
	
	
	//시대별 전체
	public int periodAllcount() throws Exception;
	
	public Historic_siteVO readPeriod(int bno) throws Exception;
	
	public List<Historic_siteVO> readPeriodImage(int bno)throws Exception;
	
	public Historic_site_detailVO readPeriod_detail(int bno)throws Exception;

	
	public void addAttach(String fullName,int attach_num,Integer bno)throws Exception;
	
	public List<String> getAttach()throws Exception;
	
	
	//테마별
	
	public List<Historic_siteVO> themalistAll(Criteria cri)throws Exception;
	
	
	public Historic_siteVO readThema(int bno) throws Exception;
	
	public List<Historic_siteVO> readThemaImage(int bno)throws Exception;
	
	public Historic_site_detailVO readThema_detail(int bno)throws Exception;

	public List<Historic_siteVO> studylist(Criteria cri) throws Exception;
	
	public int studycount() throws Exception;
	
	public List<Historic_siteVO> datelist(Criteria cri)throws Exception;
	
	public int datecount() throws Exception;
	
	public List<Historic_siteVO> familylist(Criteria cri)throws Exception;
	
	public int familycount() throws Exception;
	
	//지역별
	
	public List<Historic_siteVO> regionlistAll(Criteria cri)throws Exception;
	
	public int regionAllcount() throws Exception;
	
	
	public Historic_siteVO readRegion(int bno) throws Exception;
	
	public Historic_site_detailVO readRegion_detail(int bno)throws Exception;
	
	public List<Historic_siteVO> readRegionImage(int bno)throws Exception;
	
	public List<Historic_siteVO> seoullist(Criteria cri)throws Exception;
	
	public int seoulcount()throws Exception;
	
	public List<Historic_siteVO> incheonlist(Criteria cri)throws Exception;
	
	public int incheoncount() throws Exception;
	
	public List<Historic_siteVO> kyunggilist(Criteria cri)throws Exception;
	
	public int kyunggicount() throws Exception;
	
	public List<Historic_siteVO> kangwonlist(Criteria cri) throws Exception;
	
	public int kangwoncount() throws Exception;
	
	public List<Historic_siteVO> chungchunglist(Criteria cri)throws Exception;
	
	public int chungchungcount()throws Exception;

	public List<Historic_siteVO> kyungsanglist(Criteria cri)throws Exception;
	
	public int kyungsangcount()throws Exception;

	public List<Historic_siteVO> junlalist(Criteria cri)throws Exception;
	
	public int junlacount()throws Exception;

	public List<Historic_siteVO> jejulist(Criteria cri)throws Exception;
	
	public int jejucount()throws Exception;
	
	//음식점
	
	public List<Nearby_attractionVO> foodlist(int bno) throws Exception;
	
	public int foodcount(Integer bno) throws Exception;
	
	//숙소

	public List<Nearby_attractionVO> roomlist(int bno)throws Exception;
	
	public int roomcount(Integer bno) throws Exception;
	
	
	public Nearby_attractionVO read_attraction(int bno,int rno) throws Exception;
	
	public List<Nearby_attractionVO> attraction_image(int bno,int rno) throws Exception;
	
	
	//댓글 수
	public int reply_count(int bno) throws Exception;
	
	
	//조회수
	public void updateViewCnt(int bno)throws Exception;
	
	//readChartList
	
	public List<Historic_site_starVO> readChartList(int bno)throws Exception;
	
	
}
