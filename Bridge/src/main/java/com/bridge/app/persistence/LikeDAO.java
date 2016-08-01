/*
 �ۼ��� - ��ȿ��
���� - ���ƿ� dao ���� Ŭ����
���۳�¥ - 2016-07-20
������¥ - 2016-07-22
���泻�� - ���ƿ� dao
 */
package com.bridge.app.persistence;

import java.util.List;

import com.bridge.app.domain.LikeVO;

public interface LikeDAO {
	public void regist(LikeVO like) throws Exception;
	public void remove(LikeVO like) throws Exception;
	public List<Integer> searchAll(Integer userNumber) throws Exception;
}
