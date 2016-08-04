package com.bridge.app.domain;

public class DownloadVO {
	private int downloadNumber;
	private int musicNumber;
	private int userNumber;
	private String downloadDate;
	private String albumImg;
	private int albumNumber;
	private String artistName;
	private int artistNumber;
	private String musicSubject;
	private String albumName;
	
	public String getAlbumImg() {
		return albumImg;
	}
	public void setAlbumImg(String albumImg) {
		this.albumImg = albumImg;
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
	public String getAlbumName() {
		return albumName;
	}
	public void setAlbumName(String albumName) {
		this.albumName = albumName;
	}
	public int getDownloadNumber() {
		return downloadNumber;
	}
	public void setDownloadNumber(int downloadNumber) {
		this.downloadNumber = downloadNumber;
	}
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
	public String getDownloadDate() {
		return downloadDate;
	}
	public void setDownloadDate(String downloadDate) {
		this.downloadDate = downloadDate;
	}
	public int getArtistNumber() {
		return artistNumber;
	}
	public void setArtistNumber(int artistNumber) {
		this.artistNumber = artistNumber;
	}
	public int getAlbumNumber() {
		return albumNumber;
	}
	public void setAlbumNumber(int albumNumber) {
		this.albumNumber = albumNumber;
	}
	
}
