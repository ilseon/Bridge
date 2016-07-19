<%--
작성자 - 이주연
내용 - 다운로드함 페이지
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
<script>
	$(document).ready(
			function() {
				// 체크박스 전체 선택/해제를 위한 jquery
				$("#allCheck").click(
						function() {
							if ($("#allCheck").is(":checked")) {
								$('input:checkbox[name=check]:not(checked)')
										.prop("checked", true);
							} else {
								$('input:checkbox[name=check]:checked').prop(
										"checked", false);
							}
						});
				
				// 추가를 위한 jquery	
				$("#add").click(function() {
					if ($("input:checked").length == 0) {
						alert("곡을 선택해주세요.");
					} else {
						alert("추가되었습니다.");
					}
				});
				
				//삭제를 위한 jquery				
				$("#del").click(function() {
					if ($("input:checked").length == 0) {
						alert("곡을 선택해주세요.");
					} else {
						alert("삭제되었습니다.");
					}											
				});
				
				// 듣기를 위한 jquery	
					$("#listen").click(function() {
						if ($("input:checked").length == 0) {
							alert("곡을 선택해주세요.");
						} else {
							alert("플레이어됩니다.");
						}						
					});
			});
</script>
</head>
<body>
	<!-- header, sideber start -->
	<%@include file="/WEB-INF/views/include/header.jsp"%>
	<%@include file="/WEB-INF/views/include/sidebar.jsp"%>
	<!-- end -->

	<!-- 상단 tab start-->
	<div class="container">
		<br /> <br />
		<div class="col-md-12">
			<ul class="nav nav-tabs">
				<li><a href="like_song">좋아하는 곡</a></li>
				<li><a href="myalbum">내 앨범</a></li>
				<li class="active"><a href="download">다운로드함</a></li>
			</ul>		
		<!-- end -->
		<br> <br>
		<!-- 다운로드함에 추가된 음원 정보 start -->
			<input type="checkbox" id="allCheck">
			<button class="btn" id="listen">듣기</button>
			<button class="btn" id="add">재생목록에 추가</button>
			<button class="btn" id="del">삭제</button>
			&nbsp;
			<button class="btn">전체듣기</button>
			<br> <br>
			<table class="table">
				<tr>
					<th width="3%"></th>
					<th width="6%">번호</th>
					<th width="18%"></th>
					<th width="18%">곡</th>
					<th width="18%">아티스트</th>
					<th width="17%">앨범</th>
					<th width="7%">듣기</th>
					<th width="8%">재생목록</th>
					<th width="7%">뮤비</th>
				</tr>
				<c:forEach begin="1" end="1" var="j">
					<tr>
						<td><input type="checkbox" name="check" id="check${j}"></td>
						<td>${j}</td>
						<td><a href="test"><img
								src="resources/image/like/like_album.jpg" width="70px" /></a></td>
						<td>Why</td>
						<td><a href="test">태연</a></td>
						<td><a href="test2">Why</a></td>
						<td>듣기</td>
						<td>재생목록</td>
						<td>뮤비</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		</div>
		<!-- end -->
		<br /> <br />

		<!--  footer start -->
		<%@include file="/WEB-INF/views/include/footer.jsp"%>
		<!--  end -->
</body>
</html>