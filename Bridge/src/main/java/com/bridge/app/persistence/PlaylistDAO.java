/*
 �ۼ��� - ��ȿ��
���� - ���ٹ� dao ���� Ŭ����
���۳�¥ - 2016-07-20
������¥ - 2016-07-22
���泻�� - ���ٹ� dao impl
 */
package com.bridge.app.persistence;

import java.util.List;
import java.util.Map;

import com.bridge.app.domain.PlaylistVO;

public interface PlaylistDAO {
	public void regist(PlaylistVO playlist) throws Exception;
	public void registAll(Map playListAll) throws Exception;
	public void remove(List<PlaylistVO> playlists) throws Exception;
	public List<PlaylistVO> searchAll(Integer userNumber) throws Exception;
}
