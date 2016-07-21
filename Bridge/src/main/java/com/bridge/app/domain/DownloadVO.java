package com.bridge.app.domain;

public class DownloadVO {
	private int downloadnumber;
	private int musicnumber;
	private int usernumber;
	private String downloaddate;
	public int getDownloadnumber() {
		return downloadnumber;
	}
	public void setDownloadnumber(int downloadnumber) {
		this.downloadnumber = downloadnumber;
	}
	public int getMusicnumber() {
		return musicnumber;
	}
	public void setMusicnumber(int musicnumber) {
		this.musicnumber = musicnumber;
	}
	public int getUsernumber() {
		return usernumber;
	}
	public void setUsernumber(int usernumber) {
		this.usernumber = usernumber;
	}
	public String getDownloaddate() {
		return downloaddate;
	}
	public void setDownloaddate(String downloaddate) {
		this.downloaddate = downloaddate;
	}
	
}
