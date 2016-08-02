<!-- 
	최초 작성일 : 2016-07-19
	작성자 : 정효진
	수정일 : 2016-07-22
	내용 : 최신 앨범 페이지
 -->

<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="/resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />


<body style="margin-top: 4%;">
<%@include file="/WEB-INF/views/include/header.jsp" %>
<%@include file="/WEB-INF/views/include/sidebar.jsp" %>

<div class="container">
<h2>최신 앨범</h2>
<div class="row">
<c:forEach begin="1" end="10" var="album" items="${albumList}">
	<div class="col-xs-6 col-md-2">   
   			 <a href="/test">
	   			 <div class="thumbnail">
	     			 <img src="/resources/image/album.PNG" width="200px">
	     				 <div class="caption">
	       					<a href="/album_detail?albumNumber=${music.albumNumber}"><p>${album.albumName}</p></a> 
	       					 <p>${album.artistName}</p>
	       					 <p>${album.albumDate}</p>
	      				</div>
	      		</div>
       		</a>
    </div>     	
	</c:forEach>
</div>
</div>
