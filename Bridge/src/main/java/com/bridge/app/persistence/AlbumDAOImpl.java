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
import org.springframework.ui.Model;

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
	private static final String NAMESPACE2 = "com.bridge.mappers.artistMapper";

	@Override
	public AlbumVO test() {
		System.out.println(((UserVO) sqlSession.selectOne("test")).getUserId());
		System.out.println(((UserVO) sqlSession.selectOne("test")).getUserName());
		return null;
	}

	@Override
	public void regist(HttpServletRequest req, Model view) throws Exception {
	
		
		int postMaxSize = 1024 * 1024 * 1024;
		String folderPath  = req.getSession().getServletContext().getRealPath("/"); //realPath
        String folder_p=folderPath+"upload"+File.separator+"album"+File.separator;
                 
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
        String albumImg = "";      
         while(enumer.hasMoreElements()){
        	enumer=(Enumeration) multiReq.getFileNames();
        	
            String name = (String)enumer.nextElement();
            albumImg = multiReq.getFilesystemName(name);
         }
        
         logger.info(multiReq.getParameter("artistNumber"));
         
         AlbumVO album = new AlbumVO();
         
         album.setArtistNumber(Integer.parseInt(multiReq.getParameter("artistNumber")));
         album.setAlbumName(multiReq.getParameter("albumName"));
         album.setAlbumType(multiReq.getParameter("albumType"));
         album.setAlbumDate(multiReq.getParameter("albumDate"));
         album.setAlbumGenre(multiReq.getParameter("albumGenre")); 
         album.setAlbumImg(albumImg);
         album.setAgeLimit(Integer.parseInt(multiReq.getParameter("ageLimit")));
         album.setAlbumContent(multiReq.getParameter("albumContent"));      
         
         int counter = Integer.parseInt(multiReq.getParameter("counter"));
         req.setAttribute("counter", counter);
         album.setCounter(counter);  

         logger.info(album.toString());         
         sqlSession.insert(NAMESPACE + ".regist", album); 
         
         String albumName = multiReq.getParameter("albumName");          
         view.addAttribute("albumList", sqlSession.selectOne(NAMESPACE+".selectAlbum", albumName));        
         
         int artistNumber = Integer.parseInt(multiReq.getParameter("artistNumber"));
         view.addAttribute("artistList", sqlSession.selectOne(NAMESPACE2+".selectArtistOne", artistNumber));
         
	}
	@Override
	public AlbumVO getAlbumOne(int albumNumber) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getAlbumOne", albumNumber);
	}
	@Override
	public List<AlbumVO> searchAll(int limit) throws Exception {
		return sqlSession.selectList(NAMESPACE+".searchAll", limit);
	}

	@Override
	public List<AlbumVO> searchMytrack(int usernumber, int limit) throws Exception {
		return sqlSession.selectList(NAMESPACE+".searchMytrack", usernumber);
	}

	@Override
	public List<AlbumVO> MytrackDetail(int albumNumber) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+".MytrackDetail", albumNumber);
	}
	

	// 일선 추가
	@Override
	public List<AlbumVO> getArtistAlbum(int artistNumber) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getArtistAlbum", artistNumber);
	}
	
	
}