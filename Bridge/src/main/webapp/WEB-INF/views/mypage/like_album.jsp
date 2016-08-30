<%--
작성자 - 정효진
내용 - 좋아하는 앨범 페이지
시작날짜 - 2016/07/17
수정날짜 - 2016/08/04
변경내용 - 삭제기능추가
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="/Bridge/resources/bootstrap/js/jquery-2.2.3.min.js"></script>
<script src="/Bridge/resources/bootstrap/js/bootstrap.min.js"></script>
<script src="/Bridge/resources/bootstrap/css/bootstrap.css" type="text/css"></script>
</head>
<script>
	$(document).ready(function() {
		//삭제를 확인하는 jquery 
		$("#del").click(function() {
			if ($("input:checked").length > 0) {
				alert("삭제되었습니다.");
			} else {
				alert("앨범을 선택해주세요.");
			}
		});
	});
</script>
<body>
	<!-- header, sideber start -->
	<%@include file="/WEB-INF/views/include/header.jsp"%>
	<%@include file="/WEB-INF/views/include/sidebar.jsp"%>
	<!-- end -->

	<!-- 상단 tab start -->
	<div class="container" style="margin-bottom: 150px">
		<br /> <br />
		<div class="col-md-12">
			<ul class="nav nav-tabs">
				<li class="active"><a href="like_song">좋아하는 곡</a></li>
				<li><a href="myalbum">내 앨범</a></li>
				<li><a href="download">다운로드함</a></li>
			</ul>
		</div>
		<!-- end -->
		<!-- 좋아하는 곡 or 앨범인지 표시 start -->
		<div class="col-xs-2">
			<br /> <br />
			<ul class="breadcrumb">
				<li><a href="like_song">곡</a></li>
				<li class="active">앨범</li>
			</ul>
		</div>
		<div class="col-md-12" style="margin-top: -40px" align="right">
			<button class="btn btn-default btn-md" id="del">
				<span class="glyphicon glyphicon-trash"></span>&nbsp;삭제
			</button>
			<hr />
			<br />
		</div>
		<!-- end -->
		<br />
		<!-- 앨범 정보 start -->
		<c:forEach begin="1" end="4" step="1">
			<div class="col-sm-3">
				<div class="form-group">
					<c:forEach begin="1" end="1">
						<input type="checkbox" name="check" id="check${j}" />&nbsp;&nbsp;
					&nbsp;&nbsp;<a href="album_detail?albumNumber=${music.albumNumber}"><img
							src="/Bridge/resources/image/like/${music.albumImg}" width="65%"></a>
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
								<td>태연</td>
							</tr>
							<tr>
								<td>앨범 종류</td>
								<td>미니</td>
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
		</c:forEach>
	</div>
	<!-- end -->
	<!--  footer start -->
	<%@include file="/WEB-INF/views/include/footer.jsp"%>
	<!--  end -->
</body>
</html>