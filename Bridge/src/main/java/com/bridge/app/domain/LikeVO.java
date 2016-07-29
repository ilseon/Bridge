package com.bridge.app.domain;

public class LikeVO {
	private int userNumber;
	private int musicNumber;
	private String artistName;
	private String musicSubject;
	private String albumImg;
	
	public int getUserNumber() {
		return userNumber;
	}
	public void setUserNumber(int userNumber) {
		this.userNumber = userNumber;
	}
	public int getMusicNumber() {
		return musicNumber;
	}
	public void setMusicNumber(int musicNumber) {
		this.musicNumber = musicNumber;
	}
	public String getArtistName() {
		return artistName;
	}
	public void setArtistName(String artistName) {
		this.artistName = artistName;
	}
	public String getMusicSubject() {
		return musicSubject;
	}
	public void setMusicSubject(String musicSubject) {
		this.musicSubject = musicSubject;
	}
	public String getAlbumImg() {
		return albumImg;
	}
	public void setAlbumImg(String albumImg) {
		this.albumImg = albumImg;
	}	
}