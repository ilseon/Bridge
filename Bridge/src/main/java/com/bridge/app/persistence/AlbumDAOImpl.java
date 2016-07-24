package com.bridge.app.persistence;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.bridge.app.controller.MyPageController;
import com.bridge.app.domain.AlbumVO;
import com.bridge.app.domain.UserVO;

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
	public void AlbumInsert(AlbumVO vo) throws Exception {
		/*
		 * try{ byte fileData[] = file.getBytes(); fos = new
		 * FileOutputStream(path + "\\" + albumImg); fos.write(fileData);
		 * 
		 * }catch(Exception e){ e.printStackTrace();
		 * 
		 * }finally{ if(fos != null){ try{ fos.close(); }catch(Exception e){} }
		 * } // sqlSession.insert(NAMESPACE + ".AlbumUpload", vo); return
		 * "upload"; }
		 */
		sqlSession.insert(NAMESPACE + ".regist", vo);
	}
	
	public String FileUpload() throws Exception{
		
		
		
		
		return null;
	}
	
}
