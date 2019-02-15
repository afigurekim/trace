package com.bit.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bit.domain.Historic_site_detailVO;
import com.bit.domain.Historic_site_imageVO;
import com.bit.domain.Historic_siteVO;
import com.bit.domain.Nearby_attraction_foodVO;
import com.bit.domain.Nearby_attractionVO;

@Repository
public class HISTORIC_SITE_DAOImpl implements HISTORIC_SITE_DAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.bit.mapper.HistoricMapper";

	@Override
	public void history(Historic_siteVO vo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("극혐");
		sqlSession.insert(namespace+".history",vo);
	}

	@Override
	public void history_detail(Historic_site_detailVO vo) throws Exception {
		sqlSession.insert(namespace+".history_detail",vo);
		
	}

	@Override
	public void history_image(Historic_site_imageVO vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace+".history_image",vo);
	}
	
	@Override
	public void food(Nearby_attractionVO vo)throws Exception{
		sqlSession.insert(namespace+".food",vo);
	}

	
	
}
