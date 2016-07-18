<%--
작성자 - 이주연
내용 - 좋아하는 앨범 페이지
시작날짜 - 2016/07/17
수정날짜 - 
변경내용 - 
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="/resources/bootstrap/css/bootstrap.css" rel="stylesheet"
	type="text/css" />
<script src="/resources/bootstrap/js/jquery-2.2.3.min.js"></script>
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
<script src="/resources/bootstrap/css/bootstrap.css" type="text/css"></script>
</head>
<script>
	$(document).ready(function() {
		//삭제를 확인하는 jquery 
		$(".btn").on("click", function() {
			if ($("input:checked").length > 0) {
				$("#del").click(function() {
					alert("삭제되었습니다.");
				});
			} else {
				alert("앨범을 선택해주세요.");
			}
		});

	});
</script>
<body>
	<!-- 상단 tab start -->
	<div class="container">
		<br /> <br />
		<ul class="nav nav-tabs">
			<li><a href="upload">업로드하기</a></li>
			<li class="active"><a href="mytrack">내 트랙</a></li>
		</ul>
	</div>
	<!-- end -->
	<br>
	<br>
	<!-- 앨범 정보 start -->
	<div class="container">
		<div class="col-sm-3">
			<div class="form-group">
				<c:forEach begin="1" end="1" var="j">
					<a href="mytrack_detail"><img src="resources/image/upload/album/album_art.jpg"
						width="65%"></a>
				</c:forEach>
			</div>
		</div>
		<form class="form-horizontal">
			<div class="col-sm-3">
				<div class="form-group">
					<br />
					<table class="table">
						<tr>
							<td>아티스트</td>
							<td>원더걸스</td>
						</tr>
						<tr>
							<td>앨범 종류</td>
							<td></td>
						</tr>
						<tr>
							<td>발매일</td>
							<td>2016.06.27</td>
						</tr>
						<tr>
							<td>장르</td>
							<td>발라드</td>
						</tr>
					</table>
				</div>
			</div>
		</form>
	</div>
	<!-- end -->
</body>
</html>