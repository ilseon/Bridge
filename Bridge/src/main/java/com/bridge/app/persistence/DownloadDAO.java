/*
 �ۼ��� - ��ȿ��
���� - �ٹ� dao ���� Ŭ����
���۳�¥ - 2016-07-20
������¥ - 2016-07-22
���泻�� - �ٹ� dao
 */
package com.bridge.app.persistence;

import java.util.List;
import java.util.Map;

import com.bridge.app.domain.DownloadVO;

public interface DownloadDAO {
	public void registOne(DownloadVO download) throws Exception;
	public void registSeveral(Map<String, Object> map) throws Exception;
	public void remove(Integer downloadNumber) throws Exception;
	
	public List<DownloadVO> searchAll(Integer userNumber) throws Exception;
}
