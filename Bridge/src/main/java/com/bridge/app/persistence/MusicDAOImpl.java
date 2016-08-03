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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.bridge.app.domain.MusicVO;
import com.bridge.app.domain.Paging;
import com.bridge.app.domain.VideoVO;
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
	public List<MusicVO> regist(HttpServletRequest req) throws Exception {

		
		int postMaxSize = 1024 * 1024 * 1024;
		String folderPath = req.getSession().getServletContext().getRealPath("/"); // realPath
		String folder_p = folderPath + "upload" + File.separator + "music" + File.separator;

		File file = null;
		file = new File(folder_p);
		if (!file.exists()) {
			file.mkdirs();
		}

		String encoding = "UTF-8";
		List<String> fileNameList = new ArrayList();	
		Enumeration enumer = null;
		MultipartRequest multiReq = new MultipartRequest(req, folder_p, postMaxSize, encoding,
				new DefaultFileRenamePolicy());

		enumer = multiReq.getFileNames();

		logger.info(multiReq.getParameter("counter"));
		logger.info(multiReq.getParameter("albumNumber"));
		logger.info(multiReq.getParameter("artistNumber"));
		
		int counter = Integer.parseInt(multiReq.getParameter("counter"));
		int albumNumber = Integer.parseInt(multiReq.getParameter("albumNumber"));
	    int artistNumber = Integer.parseInt(multiReq.getParameter("artistNumber"));
				
		String musicFile = "";
		while (enumer.hasMoreElements()) {
			String name = (String) enumer.nextElement();	
	            fileNameList.add(multiReq.getFilesystemName(name));
	          }			
		
		List<MusicVO> list = new ArrayList<MusicVO>();
	    
		for (int i = 1; i <= counter; i++) {
			
			MusicVO music = new MusicVO();
			music.setAlbumNumber(albumNumber);
			music.setArtistNumber(artistNumber);
			music.setMusicSubject(multiReq.getParameter("musicSubject"+i));
			music.setMusicFile(fileNameList.get(i-1));
			
			if(multiReq.getParameter("musicTitle" + i) != null){
				music.setMusicTitle(Integer.parseInt(multiReq.getParameter("musicTitle" + i)));
			}
		
			music.setMusicVideo(multiReq.getParameter("musicVideo" + i));
			music.setMusicLyrics(multiReq.getParameter("musicLyrics" + i));
			
			logger.info("multiReq :"+ multiReq.getParameter("albumNumber")+multiReq.getParameter("artistNumber")+
					multiReq.getParameter("musicSubject" + i) + multiReq.getParameter("musicFile" + i)
					+ multiReq.getParameter("musicVideo" + i)+multiReq.getParameter("musicTitle" + i)+multiReq.getParameter("musicLyrics" + i));
			
			list.add(music);
			
			logger.info(music+"");
		}		 
		
		HashMap map = new HashMap();
		map.put("list",list);		
		
		sqlSession.insert(NAMESPACE + ".registSeveral", list);
		
		return list;
	}

	@Override
	public void remove(int musicNumber) throws Exception {
		sqlSession.delete(NAMESPACE + ".removeMusic", musicNumber);

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
	
	@Override
	public List<MusicVO> MytrackMusic(int albumNumber) throws Exception {		
		return sqlSession.selectList(NAMESPACE + ".MytrackMusic", albumNumber);
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

    @Override
    public List<MusicVO> searchHeader(Paging paging) throws Exception {
       return sqlSession.selectList(NAMESPACE + ".searchHeader", paging);
    }

    @Override
    public int searchCount(Paging paging) throws Exception {
       return sqlSession.selectOne(NAMESPACE + ".searchCount", paging);
    }



}
