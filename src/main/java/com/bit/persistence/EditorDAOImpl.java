package com.bit.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bit.domain.Criteria;
import com.bit.domain.EditorVO;

@Repository
public class EditorDAOImpl implements EditorDAO {
	
	@Inject
	private SqlSession session;
	
	private static final String namespace="com.bit.mappers.EditorMapper";
	//주은
	//게시글 자세히 읽기
	@Override
	public EditorVO read(Integer bno) throws Exception {
		return session.selectOne(namespace+ ".read",bno);
	}
	//리스트 불러오기
	@Override
	public List<EditorVO> listAll() throws Exception {
		return session.selectList(namespace + ".listAll");
	}
	//조회수 
	@Override
	public void update(Integer bno) throws Exception {
		session.update(namespace +".update",bno);
	}
	//페이징
	@Override
	public List<EditorVO> listPage(int page) throws Exception {
		if(page <=0) {
			page =1;
		}
		page = (page-1)*10;
		return session.selectList(namespace + ".listpage",page);
	}
	@Override
	public List<EditorVO> listCriteria(Criteria cri, int theme,String state) throws Exception {
		Map <String,Object> map = new HashMap<String,Object>();
		map.put("cri", cri);
		map.put("state", state);
		if(theme == 1) {
			return session.selectList(namespace+".listCriteriaFamily",map);
		}else if(theme ==2) {
			return session.selectList(namespace+".listCriteriaCouple",map);
		}else if(theme==3) {
			return session.selectList(namespace+".listCriteriaEdu",map);
		}else if(theme==4) {
			return session.selectList(namespace+".listCriteriaReligion",map);
		}
	
		return session.selectList(namespace+".listCriteria",map);
	}
	@Override
	public int countPaging(Criteria cri, int theme,String state) throws Exception {
		Map <String,Object> map = new HashMap<String,Object>();
		map.put("cri",cri);
		map.put("state", state);
		
		if(theme==1) {
			return session.selectOne(namespace+".countPagingFamily",map);
		}else if(theme==2){
			return session.selectOne(namespace+".countPagingCouple",map);
		}else if(theme==3) {
			return session.selectOne(namespace+".countPagingEdu",map);
		}else if (theme==4) {
			return session.selectOne(namespace+".countPagingReligion",map);
		}
		
		return session.selectOne(namespace+".countPaging",map);
	}

	
	
	

}
