/*
 �ۼ��� - ��ȿ��
���� - ���ٹ� Service �������̽�
���۳�¥ - 2016-07-20
������¥ - 2016-07-21
���泻�� - �⺻ �޼��� �ۼ�
 */
package com.bridge.app.service;

import java.util.List;
import java.util.Map;

import com.bridge.app.domain.PlaylistVO;

public interface PlaylistService {
	public void regist(PlaylistVO playlist) throws Exception;
	public void registAll(Map playListAll) throws Exception;
	public void remove(List<PlaylistVO> playlists) throws Exception;
	public List<PlaylistVO> searchAll(Integer userNumber) throws Exception;
	public List<PlaylistVO> search_myalbum(Map playListAll) throws Exception;
}
