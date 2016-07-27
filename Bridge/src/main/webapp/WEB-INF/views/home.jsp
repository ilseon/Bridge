<%--
작성자 - 김민정
내용 - 메인페이지
시작날짜 - 2016/07/19
수정날짜 - 2016/07/20
변경내용 - 최신앨범 썸네일 형식으로변경
 --%>

<%@ page contentType="text/html; charset=UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<html>
<head>
<link href="/resources/bootstrap/css/bootstrap.css" rel="stylesheet"
	type="text/css" />
<title>Home</title>
</head>

<script type="text/javascript">
$(document).ready(function() {
 $(".quick").animate( { "top": $(document).scrollTop() + 20 +"px" }, 500 ); 
 $(window).scroll(function(){
  $(".quick").stop();
  $(".quick").animate( { "top": $(document).scrollTop() + 20 + "px" }, 1000 );
 });
});
</script>


<body style="margin-top: 4%;">

	<%@include file="include/header.jsp"%>
	<%@include file="include/sidebar.jsp"%>

	<div class="container">
		<!-- 최신앨범 -->
		<div class="row">
			<div class="col-sm-11"
				style="border: 1px solid #BDBDBD; margin-bottom: 50px;">
				<h4>최신앨범</h4> 
				
				
				<c:forEach var="album" begin="0" end="11" step="1" items="${albumList}">
					<div class="col-xs-6 col-md-2">
						<a href="/chart"><div class="thumbnail">
								<img src="/resources/image/shinhwa.PNG">
								<p>${album.albumName}</p>
							</div></a>
					</div>
				</c:forEach>
				
				
			</div>


			<!-- 인기차트 -->
			<div class="col-sm-11" style="border: 1px solid #BDBDBD">
				<div>
					<h4>인기 차트 (실시간 시간)</h4>
				</div>
				<br />

				<!-- 인기차트 테이블 -->
				<table class="table">
					<c:forEach begin="0" end="9" var="music" items="${musicList}" step="1">
						<tr style="height: 70px;">
							<td width="7%">${music.musicNumber}</td>
							<td width="20%">-</td>
							<td width="20%">${music.musicSubject}</td>
							<td width="7%">${music.artistName}</td>
							<td width="10%"><button class="btn btn-default btn-xs">
									<span class="glyphicon glyphicon-play" style="color: red"></span>
								</button></td>
							<td width="10%"><button class="btn btn-default btn-xs">
									<span class="glyphicon glyphicon-plus" style="color: green"></span>
								</button></td>
						</tr>
					</c:forEach>
				</table>
				<!-- 인기차트 테이블 끝 -->

			</div>
			<!-- 인기차트 끝-->

			<!-- 옆에 퀵메뉴 -->
			<div class="col-sm-1  " 
			style="position: fixed;  bottom: 20px; height: auto; right: 20px; margin-bottom:3%;" >
				<a href="#top">
				<input type="image" src="/resources/image/maintop.PNG" id="quick" />
				</a>
			</div>
			<!-- 옆에 퀵메뉴 끝 -->

		</div>
	</div>
	<%@include file="include/footer.jsp"%>
</body>
</html>

