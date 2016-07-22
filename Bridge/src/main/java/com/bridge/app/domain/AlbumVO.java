package com.bridge.app.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

public class AlbumVO {
	private int albumnumber;
	private String albumtype;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date albumdate;
	private String albumgenre;
	private int artist_artistnumber;
	private String albumname;	
	private String albumcontent;
	
    private MultipartFile file; 
	private String albumimg;
	public int getAlbumnumber() {
		return albumnumber;
	}
	public void setAlbumnumber(int albumnumber) {
		this.albumnumber = albumnumber;
	}
	public String getAlbumtype() {
		return albumtype;
	}
	public void setAlbumtype(String albumtype) {
		this.albumtype = albumtype;
	}
	public Date getAlbumdate() {
		return albumdate;
	}
	public void setAlbumdate(Date albumdate) {
		this.albumdate = albumdate;
	}
	public String getAlbumgenre() {
		return albumgenre;
	}
	public void setAlbumgenre(String albumgenre) {
		this.albumgenre = albumgenre;
	}
	public int getArtist_artistnumber() {
		return artist_artistnumber;
	}
	public void setArtist_artistnumber(int artist_artistnumber) {
		this.artist_artistnumber = artist_artistnumber;
	}
	public String getAlbumname() {
		return albumname;
	}
	public void setAlbumname(String albumname) {
		this.albumname = albumname;
	}
	public String getAlbumcontent() {
		return albumcontent;
	}
	public void setAlbumcontent(String albumcontent) {
		this.albumcontent = albumcontent;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public String getAlbumimg() {
		return albumimg;
	}
	public void setAlbumimg(String albumimg) {
		this.albumimg = albumimg;
	}
	

	
}