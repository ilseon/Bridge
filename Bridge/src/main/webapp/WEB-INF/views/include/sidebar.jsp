<%--
작성자 - 김민정
내용 - 페이지 옆 노출
시작날짜 - 2016/07/19
수정날짜 - 2016/07/26
변경내용 - 로그인이 안되있을경우 팝업창 노출!test
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="/resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
<script src="/resources/bootstrap/js/jquery-2.2.3.min.js"></script>
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>

<script>
   function showAlert() {
      var userId = '${userid}';
      if (userId.length == 0) {
         alert("로그인을 해주세요 !");
      }else{    
    	  $.ajax({
				type : "GET",	 
				url : "like_song"				
			}); 
      }
   }
</script>
<!--location.href("like_song");   -->


<!-- 사이드바 전체-->
<div class="col-xs-12 col-sm-2" style="height: 150%;  border-right:1px solid #BDBDBD; border-top: 1px solid #BDBDBD; " >

<!-- 위쪽 메뉴 -->
<div style="margin-bottom: 250px; margin-top: 10px;" >
<a href="chart" ><input type="image" src="/resources/image/mainchart.PNG"  /></a>
<br/>
<a href="new_album" ><input type="image" src="/resources/image/mainalbum.PNG"   /></a>
<br/>
<a href="video" ><input type="image" src="/resources/image/mainmv.PNG"  /></a>
</div>


<!-- 중간 메뉴 -->
<div>

              <input type="image" src="/resources/image/mainlike.PNG"  onclick="showAlert();" />
<br/>
<a href="myalbum"><input type="image" src="/resources/image/mainmyalbum.PNG"  /></a>
<br/>
<a href="download" ><input type="image" src="/resources/image/maindown.PNG"  /></a>
</div>
<hr/>

<!-- 아래 메뉴 -->
<div>
<a href="upload" ><input type="image" src="/resources/image/mainup.PNG"  /></a>
<br/>
<a href="mytrack"><input type="image" src="/resources/image/maintrack.PNG"  /></a>
</div>
</div>
