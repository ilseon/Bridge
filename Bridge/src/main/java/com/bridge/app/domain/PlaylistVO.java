package com.bridge.app.domain;

public class PlaylistVO {
	private int playlistNumber;
	private int musicNumber;
	private int userNumber;
	private String artistName;
	private String musicSubject;
	private String albumImg;
	private String albumName;	
	private String musicVideo;
	
	public String getAlbumName() {
		return albumName;
	}
	public void setAlbumName(String albumName) {
		this.albumName = albumName;
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
	public int getPlaylistNumber() {
		return playlistNumber;
	}
	public void setPlaylistNumber(int playlistNumber) {
		this.playlistNumber = playlistNumber;
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
	public String getMusicVideo() {
		return musicVideo;
	}
	public void setMusicVideo(String musicVideo) {
		this.musicVideo = musicVideo;
	}
	
	
}
