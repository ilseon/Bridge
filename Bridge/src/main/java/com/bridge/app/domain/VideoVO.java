/*
 * 작성자 - 우병수
 * 내용 - 비디오 게시물 VO
 * 시작날짜 - 2016/07/20
 * 수정날짜 - 2016/07/21
 * 변경내용 - 
 */

package com.bridge.app.domain;

public class VideoVO {
	private String musicSubject;//노래 제목
	private String artistName;//가수 이름
	private String albumDate;//앨범 발매일
	
	
	public String getMusicSubject() {
		return musicSubject;
	}
	public void setMusicSubject(String musicSubject) {
		this.musicSubject = musicSubject;
	}
	public String getArtistName() {
		return artistName;
	}
	public void setArtistName(String artistName) {
		this.artistName = artistName;
	}
	public String getAlbumDate() {
		return albumDate;
	}
	public void setAlbumDate(String albumDate) {
		this.albumDate = albumDate;
	}
	
	
	
}
