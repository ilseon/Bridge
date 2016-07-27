package com.bridge.app.persistence;

import java.io.File;
import java.util.Enumeration;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.util.WebUtils;

import com.bridge.app.controller.MyPageController;
import com.bridge.app.domain.AlbumVO;
import com.bridge.app.domain.ArtistVO;
import com.bridge.app.domain.MusicVO;
import com.bridge.app.domain.UserVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Repository
public class AlbumDAOImpl implements AlbumDAO {
	@Inject
	private SqlSession sqlSession;

	private static final Logger logger = LoggerFactory.getLogger(MyPageController.class);
	private static final String NAMESPACE = "com.bridge.mappers.albumMapper";

	@Override
	public AlbumVO test() {
		System.out.println(((UserVO) sqlSession.selectOne("test")).getUserId());
		System.out.println(((UserVO) sqlSession.selectOne("test")).getUserName());
		return null;
	}

	@Override
	public AlbumVO AlbumInsert(HttpServletRequest req, AlbumVO album) throws Exception {
		
		int postMaxSize = 10 * 1024 * 1024;
		String folderPath  = req.getSession().getServletContext().getRealPath("/"); //realPath
        String folder_p=folderPath+"upload"+File.separator+"album"+File.separator;
                 
        File file = null;
        file = new File(folder_p);
        if(!file.exists()) {
           file.mkdirs();
        }    		

        int artistNumber = Integer.parseInt(req.getParameter("artistNumber"));	
        
        String encoding = "UTF-8";
        Enumeration enumer = null;
        MultipartRequest multiReq = 
        			new MultipartRequest(req, folder_p, postMaxSize, "UTF-8", new DefaultFileRenamePolicy());

        enumer=multiReq.getFileNames();
        String albumImg = "";      
         while(enumer.hasMoreElements()){
        	enumer=(Enumeration) multiReq.getFileNames();
        	
            String name = (String)enumer.nextElement();
            albumImg = multiReq.getFilesystemName(name);
         }
       
        album = new  AlbumVO();
         
        album.setAlbumName(multiReq.getParameter("albumName"));
        album.setAlbumType(multiReq.getParameter("albumType"));
        album.setAlbumDate(multiReq.getParameter("albumDate"));
        album.setAlbumGenre(multiReq.getParameter("albumGenre"));
        album.setArtistNumber(artistNumber);
        album.setAlbumImg(albumImg);            
        album.setAgeLimit(Integer.parseInt(multiReq.getParameter("ageLimit")));
        album.setAlbumContent(multiReq.getParameter("albumContent"));
        
        String albumName = multiReq.getParameter("albumName");
        req.setAttribute("albumName", albumName);     
        int counter = Integer.parseInt(multiReq.getParameter("counter"));
        logger.info(counter+"");
        
        req.setAttribute("counter", counter);
        album.setCounter(counter);  
        
        
        
        logger.info(multiReq.getParameter("albumName")+"/"+multiReq.getParameter("albumType")+"/"+multiReq.getParameter("albumDate")
        			+"/"+multiReq.getParameter("albumGenre")+"/"+albumImg+"/"+multiReq.getParameter("counter")+"/"+multiReq.getParameter("ageLimit")
        			+"/"+multiReq.getParameter("albumContent")+"/"+multiReq.getParameter("counter"));
        
        logger.info(album.toString());
		
		sqlSession.insert(NAMESPACE + ".regist", album);
		
		return album;
	}
	@Override
	public AlbumVO getAlbumOne() throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getAlbumOne");
	}
	@Override
	public List<AlbumVO> searchAll(int limit) throws Exception {
		return sqlSession.selectList(NAMESPACE+".searchAll", limit);
	}
}