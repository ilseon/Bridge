package com.bridge.app.persistence;

import java.io.File;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.web.util.WebUtils;

import com.bridge.app.controller.MyPageController;
import com.bridge.app.domain.ArtistVO;
import com.bridge.app.domain.LikeVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@Repository
public class ArtistDAOImpl implements ArtistDAO {

	@Inject
	private SqlSession sqlSession;

	private static final Logger logger = LoggerFactory.getLogger(MyPageController.class);
	private static final String NAMESPACE = "com.bridge.mappers.artistMapper";
	private static final String NAMESPACE2 = "com.bridge.mappers.albumMapper";

	@Override
	public void regist(HttpServletRequest req) throws Exception {

		int usernumber = (int) WebUtils.getSessionAttribute(req, "usernumber");
		
		int postMaxSize =  1024 * 1024 * 1024;
		String folderPath  = req.getSession().getServletContext().getRealPath("/"); //realPath
        String folder_p=folderPath+"upload"+File.separator+"artist"+File.separator;
           
        File file = null;
        file = new File(folder_p);
        if(!file.exists()) {
           file.mkdirs();
        }
       		
        String encoding = "UTF-8";
        Enumeration enumer = null;
        MultipartRequest multiReq = 
        			new MultipartRequest(req, folder_p, postMaxSize, "UTF-8", new DefaultFileRenamePolicy());

        enumer=multiReq.getFileNames();
        String artistImg = "";      
         while(enumer.hasMoreElements()){
        	enumer=(Enumeration) multiReq.getFileNames();
        	
            String name = (String)enumer.nextElement();
            artistImg = multiReq.getFilesystemName(name);
         }
         
         ArtistVO artist = new ArtistVO();
         
         artist.setArtistName(multiReq.getParameter("artistName"));
         artist.setArtistGenre(multiReq.getParameter("artistGenre"));
         artist.setArtistType(multiReq.getParameter("artistType"));
         artist.setArtistImg(artistImg);
         artist.setUserNumber(usernumber);
            
        logger.info("multiReq :"+multiReq.getParameter("artistName")+" / "+multiReq.getParameter("artistGenre")+" / "+multiReq.getParameter("artistType")
        +" / "+artistImg+usernumber); 
        logger.info(artist.toString());
       
        sqlSession.insert(NAMESPACE + ".regist", artist);
        
        String artistName = multiReq.getParameter("artistName");      
        sqlSession.selectOne(NAMESPACE + ".selectAristNum", artistName);
            
	}
	
	@Override
	public ArtistVO getArtistOne(int artistNumber) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getArtistOne", artistNumber);
	}
	
	@Override
	public List<ArtistVO> selectArtist(int userNumber) throws Exception {
		return sqlSession.selectList(NAMESPACE+".selectArist", userNumber);
	}

	@Override
	public void remove(ArtistVO artist) throws Exception {

		sqlSession.delete(NAMESPACE + ".remove", artist);
	}
	
	@Override
	public void update(ArtistVO artist, HttpServletRequest req) throws Exception {

		int postMaxSize = 10 * 1024 * 1024;
		String folderPath  = req.getSession().getServletContext().getRealPath("/resources/image"); //realPath
		String folder_p = folderPath + "upload" + File.separator + "artist" + File.separator;

		File file = null;
		file = new File(folder_p);
		if (!file.exists()) {
			file.mkdirs();
		}

		String encoding = "UTF-8";
		Enumeration enumer = null;
		MultipartRequest multiReq = new MultipartRequest(req, folder_p, postMaxSize, "UTF-8",
				new DefaultFileRenamePolicy());

		enumer = multiReq.getFileNames();
		String artistImg = "";
		while (enumer.hasMoreElements()) {
			enumer = (Enumeration) multiReq.getFileNames();

			String name = (String) enumer.nextElement();
			artistImg = multiReq.getFilesystemName(name);
		}

		int artistNumber = Integer.parseInt(multiReq.getParameter("artistNumber"));

		artist.setArtistNumber(artistNumber);
		artist.setArtistGenre(multiReq.getParameter("artistGenre"));
		artist.setArtistType(multiReq.getParameter("artistType"));
		artist.setArtistImg(artistImg);

		logger.info(artist.toString());

		sqlSession.update(NAMESPACE + ".update", artist);
	}
	
	@Override
	public ArtistVO selectArtistOne(int artistNumber) throws Exception {
		
		return (ArtistVO) sqlSession.selectOne(NAMESPACE+".selectArtistOne", artistNumber);
	}                                             

}