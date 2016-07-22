/*
 작성자 - 정효진
내용 - 내앨범 VO
시작날짜 - 2016-07-20
수정날짜 - 2016-07-20
변경내용 - 내앨범 VO 작성
 */
package com.bridge.app.domain;

public class PlaylistVO {

	private int musicNumber;
	private int userNumber;
	public int getMusicNumber() {
		return musicNumber;
	}
	public void setMusicNumber(int musicNumber) {
		this.musicNumber = musicNumber;
	}
	public int getUserNumber() {
		return userNumber;
	}
	public void setUserNumber(int userNumber) {
		this.userNumber = userNumber;
	}
	
}
