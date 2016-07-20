package com.brige.app.persistence;

import java.util.List;

import com.brige.app.domain.DownloadVO;

public interface DownloadDAO {
	public void registOne(Integer musicNumber, Integer userNumber) throws Exception;
	public void registSeveral(Integer musicNumber, Integer userNumber) throws Exception;
	public void remove(Integer downloadNumber) throws Exception;
	
	public List<DownloadVO> searchAll(Integer userNumber) throws Exception;
}
