/*
 �ۼ��� - ��ȿ��
���� - ���ƿ� Service �������̽�
���۳�¥ - 2016-07-20
������¥ - 2016-07-20
���泻�� - �⺻ �޼��� �ۼ�
 */

package com.bridge.app.service;

public interface LikeService {
	public void regist(Integer userNumber, Integer musicNumber) throws Exception;
	public void remove(Integer userNumber, Integer musicNumber) throws Exception;
	public Integer searchAll(Integer musicNumber) throws Exception;
}
