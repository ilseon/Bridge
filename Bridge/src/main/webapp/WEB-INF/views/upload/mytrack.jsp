<%--
작성자 - 이주연
내용 - 업로드한 내 트랙 페이지
시작날짜 - 2016/07/17
수정날짜 - 2016/07/20
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
	<!-- header, sideber start -->
	<%@include file="/WEB-INF/views/include/header.jsp"%>
	<%@include file="/WEB-INF/views/include/sidebar.jsp"%>
	<!-- end -->
	<!-- 상단 tab start -->
	<div class="container">
		<br /> <br />
		<div class="col-md-12">
			<ul class="nav nav-tabs">
				<li><a href="upload">업로드하기</a></li>
				<li class="active"><a href="mytrack">내 트랙</a></li>
			</ul>
			<!-- end -->
			<br> <br>
			<!-- 앨범 정보 start -->
			<c:forEach begin="1" end="4" step="1">
				<div class="col-sm-3">
					<div class="form-group">
						<c:forEach begin="1" end="1" var="j">
							<a href="mytrack_detail"><img
								src="resources/image/upload/album/album_art.jpg" width="65%"></a>
						</c:forEach>
					</div>
				</div>
				<form class="form-horizontal">
					<div class="col-sm-3">
						<div class="form-group">
							<table class="table">
								<tr>
									<th>아티스트</th>
									<td>원더걸스</td>
								</tr>
								<tr>
									<th>앨범 종류</th>
									<td></td>
								</tr>
								<tr>
									<th>발매일</th>
									<td>2016.06.27</td>
								</tr>
								<tr>
									<th>장르</th>
									<td>발라드</td>
								</tr>
							</table>
						</div>
					</div>
				</form>
			</c:forEach>
		</div>
	</div>
	<!-- end -->
	<br />
	<br />
	<!--  footer start -->
	<%@include file="/WEB-INF/views/include/footer.jsp"%>
	<!--  end -->
</body>
</html>