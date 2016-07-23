package com.bridge.app.domain;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import org.springframework.cglib.core.DefaultNamingPolicy;
import org.springframework.web.multipart.MultipartRequest;

public class AlbumVO {
	private int albumNumber;
	private String albumName;
	private String albumType;
	private String albumDate;
	private String albumGenre;
	private int artistNumber;
	private String albumImg;
	private String albumContent;
	
	/*파일 업로드*/
	private String path;
	private MultipartRequest multi;
	
	@Override
	public String toString() {
		return "AlbumVO [albumNumber=" + albumNumber + ", albumName=" + albumName + ", albumType=" + albumType
				+ ", albumDate=" + albumDate + ", albumGenre=" + albumGenre + ", artistNumber=" + artistNumber
				+ ", albumImg=" + albumImg + ", albumContent=" + albumContent + "]";
	}
	
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public MultipartRequest getMulti() {
		return multi;
	}
	public String getAlbumName() {
		return albumName;
	}
	public void setAlbumName(String albumName) {
		this.albumName = albumName;
	}
	public String getAlbumContent() {
		return albumContent;
	}
	public void setAlbumContent(String albumContent) {
		this.albumContent = albumContent;
	}
	public int getAlbumNumber() {
		return albumNumber;
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