package com.bridge.app.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.bridge.app.controller.MyPageController;
import com.bridge.app.domain.ArtistVO;

@Repository
public class ArtistDAOImpl implements ArtistDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(MyPageController.class);	
	private static final String NAMESPACE = "com.bridge.mappers.artistMapper";
	
	@Override
	public void regist(ArtistVO vo) throws Exception {
		logger.info(vo.getArtistname()+","+vo.getArtistnumber()+","
	+vo.getArtistgenre()+","+vo.getArtisttype()+","+vo.getUsernumber());
		sqlSession.insert(NAMESPACE + ".regist", vo);
	}

}
