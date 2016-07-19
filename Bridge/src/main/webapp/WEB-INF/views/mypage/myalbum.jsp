<%--
작성자 - 이주연
내용 - 내 앨범 페이지
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
<link href="/resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
<script src="/resources/bootstrap/js/jquery-2.2.3.min.js"></script>
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
<script src="/resources/bootstrap/css/bootstrap.css" type="text/css"></script>
</head>
<script>
	$(document).ready(function() {
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
				// 추가, 삭제, 다운도르를 위한 jquery
				$(".btn").on("click", function() {
					if ($("input:checked").length > 0) {
						$("#add").click(function() {
							alert("추가되었습니다.");
						});
						$("#del").click(function() {
							alert("삭제되었습니다.");
						});
						$("#down").click(function() {
							alert("다운로드되었습니다.");
						});
					} else {
						alert("곡을 선택해주세요.");
					}
				});
			});
</script>
<body>
	<!-- 상단 tab start -->
	<div class="container">
		<br /> <br />
		<ul class="nav nav-tabs">
			<li><a href="like_song">좋아하는 곡</a></li>
			<li  class="active"><a href="myalbum" >내 앨범</a></li>
			<li><a href="download">다운로드함</a></li>
		</ul>
	</div>
	<!-- end -->
	<br>
	<br>
	<br>
	<!-- 내 앨범에 추가된 곡 정보 start -->
	<div class="container">
		<input type="checkbox" id="allCheck">
		<button class="btn">듣기</button>
		<button class="btn" id="add">재생목록에 추가</button>
		<button class="btn" id="down">다운로드</button>
		<button class="btn" id="del">삭제</button>
		&nbsp;
		<button class="btn">전체듣기</button>
		<br> <br>
		<table class="table">
			<tr>
				<tr>
				<th width="3%"></th>
				<th width="6%">번호</th>
				<th width="18%"></th>
				<th width="15%">곡</th>
				<th width="15%">아티스트</th>
				<th width="15%">앨범</th>
				<th width="7%">듣기</th>
				<th width="8%">재생목록</th>
				<th width="7%">다운</th>
				<th width="7%">뮤비</th>
			</tr>

			<c:forEach begin="1" end="1" var="j">
				<tr>
					<td><input type="checkbox" name="check" id="check${j}"></td>
					<td>${j}</td>
					<td><a href="test"><img src="resources/image/like/like_album.jpg" width="70px"/></a></td>
					<td><a href="test">Why</a></td>	
					<td><a href="test2">태연</a></td>			
					<td>Why</td>	
					<td>듣기</td>
					<td>재생목록</td>
					<td>다운</td>
					<td>뮤비</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<!-- end -->
</body>
</html>