package com.bridge.app.persistence;

import java.util.List;

import com.bridge.app.domain.MusicVO;

public interface MusicDAO {
	public void regist() throws Exception;
	public void remove(Integer musicnumber) throws Exception;
	public void modifyStreaming(MusicVO music) throws Exception;
	public void modifyDownload(MusicVO music) throws Exception;
	
	public List<MusicVO> searchAll(int limit) throws Exception;
	public MusicVO search() throws Exception;
	
}
