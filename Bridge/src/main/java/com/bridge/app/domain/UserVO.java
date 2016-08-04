package com.bridge.app.domain;

import java.security.MessageDigest;


public class UserVO {
	private int userNumber;
	private String userName;
	private String userBirthday;
	
	private String year;
	private String month;
	private String day;
	
	private String useremail1;
	private String useremail2;
	
	private String userEmail;
	private String userId;
	private String userIdCheck;
	private String userPassword;
	
	private String tel1;
	private String tel2;
	private String tel3;
	
	private String userPhone;
	private int userType;
	private int artistNumber;
	
	
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getUseremail1() {
		return useremail1;
	}
	public void setUseremail1(String useremail1) {
		this.useremail1 = useremail1;
	}
	public String getUseremail2() {
		return useremail2;
	}
	public void setUseremail2(String useremail2) {
		this.useremail2 = useremail2;
	}
	public String getTel1() {
		return tel1;
	}
	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}
	public String getTel2() {
		return tel2;
	}
	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}
	public String getTel3() {
		return tel3;
	}
	public void setTel3(String tel3) {
		this.tel3 = tel3;
	}
	
	public int getUserNumber() {
		return userNumber;
	}
	public void setUserNumber(int userNumber) {
		this.userNumber = userNumber;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserBirthday() {
		return userBirthday;
	}
	public void setUserBirthday(String userBirthday) {
		this.userBirthday = userBirthday;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId){
		this.userId = userId;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) throws Exception {
		this.userPassword=getEncMD5(userPassword);
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public int getUserType() {
		return userType;
	}
	public void setUserType(int userType) {
		this.userType = userType;
	}
	public int getArtistNumber() {
		return artistNumber;
	}
	public void setArtistNumber(int artistNumber) {
		this.artistNumber = artistNumber;
	}
	public String getUserIdCheck() {
		return userIdCheck;
	}
	public void setUserIdCheck(String userIdCheck) {
		this.userIdCheck = userIdCheck;
	}


	public String getEncMD5(String txt) throws Exception {
	      //비밀번호 암호화
	        
	       StringBuffer sbuf = new StringBuffer();
	      //암호화된 비밀번호를 담을 StringBuffer
	        
	        
	       MessageDigest mDigest = MessageDigest.getInstance("MD5");
	      //MD5형식으로 암호화 시키기 위한 준비

	       mDigest.update(txt.getBytes());
	      //암호를 바이트 형식으로 받아 MD5형식으로 변환시키기

	        
	       byte[] msgStr = mDigest.digest() ;
	      //digest는 배열로 값을 반환한다.
	        

	       for(int i=0; i < msgStr.length; i++){
	           String tmpEncTxt = Integer.toHexString((int)msgStr[i] & 0x00ff) ;  
	      //배열로 반환된 각 비밀번호 자리수들을 16진수 문자열로 바꿔준다.   
	      //비트연산(&와 0x00ff)을 통해 본래의 비트값을 유지시켜 준다.     

	           sbuf.append(tmpEncTxt) ;
	      //한 글자씩 붙인다.
	       }
	        
	       return sbuf.toString() ;//String형으로 반환
	   }
}
