<%--
작성자 - 김민정
내용 - 페이지 옆 노출
시작날짜 - 2016/07/19
수정날짜 - 2016/07/27
변경내용 - 로그인이 안되있을경우 팝업창 노출 완료
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="/resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
<script src="/resources/bootstrap/js/jquery-2.2.3.min.js"></script>
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>

<script>

	$(function() {
		$('input').click(function(e) {
			var userId = '${userid}';
			var checkId = $(this).attr('id');

			if (checkId == "quick" || checkId.length == 0 || checkId == "userId" || checkId == "userPassword" || checkId == "userIdTest" || checkId == "userPasswordTest") {
			} else if (userId.length == 0) {
				alert("로그인을 해주세요 !");
			}
			else {
				if (checkId == "like_song") {
					location.href = 'like_song';
				} else if (checkId == "myalbum") {
					location.href = 'myalbum';
				} else if (checkId == "download") {
					location.href = 'download';
				} else if (checkId == "upload") {
					location.href = 'upload';
				} else if (checkId == "mytrack") {
					location.href = 'mytrack';
				}
			}
		});
	});
</script>


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
<input type="image" src="/resources/image/mainlike.PNG"   id="like_song" />
<br/>
<input type="image" src="/resources/image/mainmyalbum.PNG"  id="myalbum" />
<br/>
<input type="image" src="/resources/image/maindown.PNG"  id="download" />
</div>
<hr/>

<!-- 아래 메뉴 -->
<div>
<input type="image" src="/resources/image/mainup.PNG"  id="upload" />
<br/>
<input type="image" src="/resources/image/maintrack.PNG"  id="mytrack" />
</div>
</div>
