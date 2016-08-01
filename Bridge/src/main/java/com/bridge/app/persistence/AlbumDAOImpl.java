/*
	최초 작성일 : 2016-07-20
	작성자 : 정효진, 이주연
	수정일 : 2016-08-01
	수정 내용 : 최근 앨범 출력
	내용 :앨범 관련 DAOImpl
 */
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
	public void AlbumInsert(HttpServletRequest req) throws Exception {
		
		int postMaxSize = 10 * 1024 * 1024;
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
         
        AlbumVO album = new  AlbumVO();
         
        album.setAlbumName(multiReq.getParameter("albumName"));
        album.setAlbumType(multiReq.getParameter("albumType"));
        album.setAlbumDate(multiReq.getParameter("albumDate"));
        album.setAlbumGenre(multiReq.getParameter("albumGenre"));
        album.setArtistNumber(9);
        album.setAlbumImg(albumImg);
        
        logger.info(multiReq.getParameter("albumName")+multiReq.getParameter("albumType")+multiReq.getParameter("albumDate")
        +multiReq.getParameter("albumGenre")+albumImg+"카운터 : "+multiReq.getParameter("counter"));
        
        
        album.setAgeLimit(1);
        album.setAlbumContent(multiReq.getParameter("albumContent"));
           
        logger.info(multiReq.getParameter("ageLimit")+multiReq.getParameter("albumContent"));
        logger.info(album.toString());
		
		sqlSession.insert(NAMESPACE + ".regist", album);
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