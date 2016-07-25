package com.bridge.app.domain;

public class DownloadVO {
	private int downloadNumber;
	private int musicNumber;
	private int userNumber;
	private String downloadDate;
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
	
}
