/*
	최초 작성일 : 2016-07-20
	작성자 : 정효진
	수정일 : 2016-07-28
	수정 내용 : '좋아요' 취소시 음원 테이블 내  like 필드 데이터 수정
	내용 :음원 관련 DAOImpl
 */
package com.bridge.app.persistence;

import org.apache.ibatis.session.SqlSession;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.bridge.app.domain.MusicVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Repository
public class MusicDAOImpl implements MusicDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.bridge.mappers.musicMapper";
	private static final Logger logger = LoggerFactory.getLogger(MusicDAOImpl.class);

	@Override
	public void regist(HttpServletRequest req) throws Exception {
		// TODO Auto-generated method stub
			
			 int postMaxSize = 10 * 1024 * 1024;
	         String folderPath = req.getSession().getServletContext().getRealPath("/"); //realPath
	         String folder_p=folderPath+"upload"+File.separator+"estimate"+File.separator;
	        
	         File file = null;
	         file = new File(folder_p);
	         if(!file.exists()) {
	            file.mkdirs();
	         }
	         
	         String encoding = "UTF-8";
	         ArrayList filePath = new ArrayList();
	         Enumeration enumer=null;
	          MultipartRequest multiReq = new MultipartRequest(req, folder_p,
	               postMaxSize, encoding, new DefaultFileRenamePolicy());
	          
	          enumer=multiReq.getFileNames();
	          
	          ArrayList fileNameList = new ArrayList();//파일 이름 저장
	          
	          int i=0;
	          while(enumer.hasMoreElements()){
	             String name = (String)enumer.nextElement();
	             fileNameList.add(multiReq.getFilesystemName(name));
	          }
		
	          MusicVO music = new  MusicVO();
	          music.setMusicSubject(multiReq.getParameter("musicSubject"));
	          music.setMusicFile(multiReq.getParameter("musicFile"));
	          music.setMusicVideo(multiReq.getParameter("musicVideo"));
	          
	          logger.info(music.toString());	          
	          
			sqlSession.insert(NAMESPACE + ".regist", req);
		}

	@Override
	public void remove(Integer musicNumber) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public List<MusicVO> searchAll(int limit) throws Exception {
		return sqlSession.selectList(NAMESPACE+".searchAll", limit);
	}

	@Override
	public MusicVO search() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void modifyStreaming(MusicVO music) throws Exception {
		
		
	}

	@Override
	public void modifyDownload(MusicVO music) throws Exception {
		
		
	}

	@Override
	public MusicVO searchMusic(int musicnumber) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".searchMusic", musicnumber);
	}

	@Override
	public List<MusicVO> searchGenre(Map map) throws Exception {
		return sqlSession.selectList(NAMESPACE+".searchGenre", map);
	}

	@Override
	public void download_update(Map musicnumbers) throws Exception {
		sqlSession.update(NAMESPACE+".download_update", musicnumbers);
	}

	@Override
	public void play_update(Map musicnumbers) throws Exception {
		sqlSession.update(NAMESPACE+".play_update", musicnumbers);	
	}

	@Override
	public void like_update(int musicNumber) throws Exception {
		sqlSession.update(NAMESPACE+".like_update", musicNumber);		
	}

	@Override
	public void like_remove(int musicNumber) throws Exception {
		sqlSession.update(NAMESPACE+".like_remove", musicNumber);
	}

}
