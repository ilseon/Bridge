package com.bridge.app.domain;

import org.springframework.web.multipart.MultipartFile;

public class AlbumVO {
	private int albumNumber;
	private String albumType;
	private String albumDate;
	private String albumGenre;
	private int artistNumber;
	private String albumImg;

	private MultipartFile uploadImg;
	
	public int getAlbumNumber() {
		return albumNumber;
	}
	public MultipartFile getUploadImg() {
		return uploadImg;
	}
	public void setUploadImg(MultipartFile uploadImg) {
		this.uploadImg = uploadImg;
	}
	public void setAlbumNumber(int albumNumber) {
		this.albumNumber = albumNumber;
	}
	public String getAlbumType() {
		return albumType;
	}
	public void setAlbumType(String albumType) {
		this.albumType = albumType;
	}
	public String getAlbumDate() {
		return albumDate;
	}
	public void setAlbumDate(String albumDate) {
		this.albumDate = albumDate;
	}
	public String getAlbumGenre() {
		return albumGenre;
	}
	public void setAlbumGenre(String albumGenre) {
		this.albumGenre = albumGenre;
	}
	public int getArtistNumber() {
		return artistNumber;
	}
	public void setArtistNumber(int artistNumber) {
		this.artistNumber = artistNumber;
	}
	public String getAlbumImg() {
		return albumImg;
	}
	public void setAlbumImg(String albumImg) {
		this.albumImg = albumImg;
	}
	
	
}