package com.bridge.app.persistence;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bridge.app.controller.MyPageController;
import com.bridge.app.domain.MusicVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Repository
public class MusicDAOImpl implements MusicDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(MyPageController.class);
	
	private static final String NAMESPACE = "com.bridge.mappers.musicMapper";

	@Override
	public void remove(Integer musicNumber) throws Exception {
	}

	@Override
	public List<MusicVO> searchAll(int limit) throws Exception {
		return sqlSession.selectList(NAMESPACE+".searchAll", limit);
	}

	@Override
	public MusicVO search() throws Exception {
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
	public void regist(HttpServletRequest req, int counter, String albumName) throws Exception {	
		    
	        req.getAttribute(counter+"");	         
	        req.getAttribute(albumName);
	        
	        logger.info("음원 수"+counter);
	        logger.info("앨범명"+albumName);
			
			int postMaxSize = 10 * 1024 * 1024;
	        String folderPath = req.getSession().getServletContext().getRealPath("/"); //realPath
	        String folder_p=folderPath+"upload"+File.separator+"music"+File.separator;
	       
	        File file = null;
	        file = new File(folder_p);
	        if(!file.exists()) {
	           file.mkdirs();
	        }
	        
	        String encoding = "UTF-8";	        
	        Enumeration enumer=null;
	        MultipartRequest multiReq = new MultipartRequest(req, folder_p,
	       		  							postMaxSize, encoding, new DefaultFileRenamePolicy());
	         
	         enumer=multiReq.getFileNames();
	         
	         String musicfile = ""; 
	         while(enumer.hasMoreElements()){
	            String name = (String)enumer.nextElement();
	            //fileNameList.add(multiReq.getFilesystemName(name));
	            musicfile = multiReq.getFilesystemName(name);
	         }
	         
	        logger.info(multiReq.getParameter("albumName")); 
	        logger.info(multiReq.getParameter("counter")); 
	     	logger.info(multiReq.getParameter("musicSubject")+multiReq.getParameter("musicFile")+multiReq.getParameter("musicVideo"));      	
	        	         
	        MusicVO music = new MusicVO();
	         
	      	music.setMusicSubject(multiReq.getParameter("musicSubject"));
	      	music.setMusicFile(multiReq.getParameter("musicFile"));
	      	music.setMusicVideo(multiReq.getParameter("musicVideo"));
	      	
	      	
			/*for(int i=0; i < music.length; i++){
				List <MusicVO> musicList = new ArrayList<>();
				musicList.add(e);
				}
	      	*/
	      
	      	logger.info(music.toString());      	
	      	sqlSession.insert(NAMESPACE + ".regist");
		}
	
	@Override
	public void registSeveral(HttpServletRequest req, int counter, String albumName) throws IOException {
		
		/*int postMaxSize = 10 * 1024 * 1024;
        String folderPath = req.getSession().getServletContext().getRealPath("/"); //realPath
        String folder_p=folderPath+"upload"+File.separator+"music"+File.separator;
       
        File file = null;
        file = new File(folder_p);
        if(!file.exists()) {
           file.mkdirs();
        }
        
        String encoding = "UTF-8";
    
        req.getAttribute(counter+"");	         
        req.getAttribute(albumName);
        
        Enumeration enumer=null;
        MultipartRequest multiReq = new MultipartRequest(req, folder_p,
       		  							postMaxSize, encoding, new DefaultFileRenamePolicy());
         
         enumer=multiReq.getFileNames();
         
         //ArrayList musicList = new ArrayList<ArrayList<String>>();//파일 이름 저장
         //ArrayList fileNameList = new ArrayList();//파일 이름 저장
         String musicfile = ""; 
         while(enumer.hasMoreElements()){
            String name = (String)enumer.nextElement();
            //fileNameList.add(multiReq.getFilesystemName(name));
            musicfile = multiReq.getFilesystemName(name);
         }
         
        MusicVO music = new MusicVO();
         
      	music.setMusicSubject(multiReq.getParameter("musicSubject"));
      	music.setMusicFile(multiReq.getParameter("musicFile"));
      	music.setMusicVideo(multiReq.getParameter("musicVideo"));
      	
         	//musicList.add(multiReq.getParameter("musicSubject"));
         	//musicList.add(multiReq.getParameter("musicFile"));
         	//musicList.add(multiReq.getParameter("musicVideo"));
         	//musicList.add(fileNameList);       
         
         	/*for(int i=0; i < fileNameList.size(); i++){	        	  
         		fileNameList.get(i);	        	  
         		for(int j=0; j < musicList.size(); j++){	        	  
         			musicList.get(i);	        	  
         		}	
         	}      
      		sqlSession.insert(NAMESPACE + ".registSeveral");
      */
	}	
}