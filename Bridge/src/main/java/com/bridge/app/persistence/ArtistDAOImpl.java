package com.bridge.app.persistence;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cglib.core.DefaultNamingPolicy;
import org.springframework.stereotype.Repository;

import com.bridge.app.controller.MyPageController;
import com.bridge.app.domain.ArtistVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Repository
public class ArtistDAOImpl implements ArtistDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(MyPageController.class);	
	private static final String NAMESPACE = "com.bridge.mappers.artistMapper";
	
	@Override
	public void regist(ArtistVO vo) throws Exception {
				
		sqlSession.insert(NAMESPACE + ".regist", vo);
	}

	@Override
	public String FileUpload(HttpServletRequest req) throws Exception {
		// TODO Auto-generated method stub
		int postMaxSize = 10 * 1024 * 1024;
		String folderPath =req.getServletPath(); // realpath
        String artistImg=folderPath+"upload"+File.separator+"artist"+File.separator;
        System.out.println("realpath"+folderPath);
       
        File file = null;
        file = new File(artistImg);
        if(!file.exists()) {
           file.mkdirs();
        }
        
        String encoding = "UTF-8";
        Enumeration enumer=null;
        MultipartRequest multiReq = 
        new MultipartRequest(req, artistImg, postMaxSize, "euc-kr", new DefaultFileRenamePolicy());        
        String fileName = "";
        
         int i=0;
         while(enumer.hasMoreElements()){
        	enumer=(Enumeration) multiReq.getFileNames();
        	
            String name = (String)enumer.nextElement();
            fileName = multiReq.getFilesystemName(name);
         }
		return fileName;	         		
	}
}
