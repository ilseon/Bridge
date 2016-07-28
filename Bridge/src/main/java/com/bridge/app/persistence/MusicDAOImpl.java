package com.bridge.app.persistence;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Repository;

import com.bridge.app.controller.MyPageController;
import com.bridge.app.domain.MusicVO;
import com.bridge.app.domain.VideoVO;
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
	
		// 일선 추가
		@Override
		public List<MusicVO> getArtistMusic(int artistNumber) throws Exception {			
			return sqlSession.selectList(NAMESPACE + ".getArtistMusic", artistNumber);
		}
	
		@Override
		public List<MusicVO> getAlbumMusic(int albumNumber) throws Exception {
			return sqlSession.selectList(NAMESPACE + ".getAlbumMusic", albumNumber);

		}

		@Override
		public List<VideoVO> getArtistMusicVideo(int artistNumber) throws Exception {
			return sqlSession.selectList(NAMESPACE + ".getArtistMusicVideo", artistNumber);
		}

		@Override
		public List<VideoVO> getAlbumMusicVideo(int albumNumber) throws Exception {
			return sqlSession.selectList(NAMESPACE + ".getAlbumMusicVideo", albumNumber);
		}
	
}