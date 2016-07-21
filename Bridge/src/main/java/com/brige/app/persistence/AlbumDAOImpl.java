package com.brige.app.persistence;

import java.io.FileOutputStream;
import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.brige.app.controller.MyPageController;
import com.brige.app.domain.AlbumVO;
import com.brige.app.domain.UserVO;

@Repository
public class AlbumDAOImpl implements AlbumDAO{
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.bridge.mappers.albumMapper";
	private static final Logger logger = LoggerFactory.getLogger(AlbumDAOImpl.class);	
	
	@Override
	public AlbumVO test() {		
		System.out.println(((UserVO)sqlSession.selectOne("test")).getUserId());
		System.out.println(((UserVO)sqlSession.selectOne("test")).getUserName());
		return null;
	}

	@Override
	public void AlbumInsert(AlbumVO vo, HttpServletRequest request) throws Exception {
		 MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
		 MultipartFile uploadImge = vo.getUploadImg();
	        if (uploadImge != null) {
	            String fileName = uploadImge.getOriginalFilename();
	            vo.setAlbumImg(vo.getAlbumImg());
	            try {
	                //FileOutputStream »ç¿ë
	                 byte[] fileData = uploadImge.getBytes();
	                FileOutputStream output = new FileOutputStream("E:/images/" + fileName);
	                output.write(fileData); 
	            } catch (IOException e) {
	                e.printStackTrace();
	            } 
	        } 
	        logger.debug("------------- file start -------------");
	        logger.debug("name : "+uploadImge.getName());
	        logger.debug("filename : "+uploadImge.getOriginalFilename());
	        logger.debug("size : "+uploadImge.getSize());
	        logger.debug("-------------- file end --------------\n");
		sqlSession.insert(NAMESPACE+".AlbumUpload", vo);
	}
}
