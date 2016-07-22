package com.bridge.app.persistence;

import java.util.List;

import com.bridge.app.domain.DownloadVO;

public interface DownloadDAO {
	public void registOne(DownloadVO download) throws Exception;
	public void registSeveral(Integer musicNumber, Integer userNumber) throws Exception;
	public void remove(Integer downloadNumber) throws Exception;
	
	public List<DownloadVO> searchAll(Integer userNumber) throws Exception;
}
