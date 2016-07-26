/*
 �ۼ��� - ��ȿ��
���� - ���� dao impelements ���� Ŭ����
���۳�¥ - 2016-07-20
������¥ - 2016-07-22
���泻�� - ���� dao impl
 */
package com.bridge.app.persistence;

import org.apache.ibatis.session.SqlSession;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.bridge.app.domain.MusicVO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;


import com.bridge.app.controller.MyPageController;
import com.bridge.app.domain.AlbumVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Repository
public class MusicDAOImpl implements MusicDAO {
	private static final Logger logger = LoggerFactory.getLogger(MyPageController.class);

	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.bridge.mappers.musicMapper";

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
	public void regist(HttpServletRequest req) throws Exception {
		
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
          music.setMusicSubject(multiReq.getParameter("musicsubject"));
          music.setMusicFile(multiReq.getParameter("musicfile"));
          music.setMusicVideo(multiReq.getParameter("musicvideo"));
          
          logger.info(music.toString());
          
          
		sqlSession.insert(NAMESPACE + ".regist", req);
	}


	@Override
	public void modify(MusicVO music) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public List<MusicVO> searchAll() throws Exception {
		return sqlSession.selectList(NAMESPACE+".searchAll");
	}

	
	
}
