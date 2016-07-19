<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="/resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
<script src="/resources/bootstrap/js/jquery-2.2.3.min.js"></script>
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
<script src="/resources/bootstrap/css/bootstrap.css" type="text/css"></script>
</head>
<body>
	<h2>태연</h2>
	<hr>
	<div class="container"> <!-- 첫 번째 블럭(사진, 가수 소개) start -->
		<div class="col-md-5">
			<img src="/resources/image/ty.png" width="50%">
		</div>
		<div class="col-md-7">
			<table class="table">
				<tr>
					<td>유형</td>
					<td>솔로(여성)</td>
				</tr>
				<tr>
					<td>장르</td>
					<td>발라드</td>
				</tr>				
			</table>
		</div>
	</div><!-- 첫 번째 블럭(사진, 가수 소개) end -->
	<br><br>
	<!-- ----------------------------------  -->
	
	<div class="container"><!-- 두 번째 블럭(곡) start -->
		<h3>수록곡(3)</h3>
		<div><!-- 버튼들 -->
			<input type="checkbox">
			<button class="btn">듣기</button>
			<button class="btn">재생목록에 추가</button>
			<button class="btn">내 앨범에 담기</button>
			<button class="btn">다운로드</button>
			<button class="btn">전체듣기</button>
		</div>
		<table class="table">
			<tr>
				<th></th><!-- 체크박스열 -->
				<th>번호</th>
				<th>곡</th>
				<th>아티스트명</th>
				<th>듣기</th>
				<th>재생목록</th>
				<th>내앨범</th>
				<th>다운</th>
				<th>뮤비</th>
				<th>좋아</th>				
			</tr>
			
			<c:forEach begin="1" end="7" var="j">
				<tr>
					<td><input type="checkbox"></td>
					<td>${j}</td>
					<td>Why</td>
					<td>태연</td>
					<td>듣기</td>
					<td>재생목록</td>
					<td>내앨범</td>
					<td>다운</td>
					<td>뮤비</td>
					<td>좋아</td>				
				</tr>
			</c:forEach>
		</table>
		
	</div><!-- 두 번째 블럭(곡) end -->
	<br><br>
	<!-- ----------------------------------  -->
	<div class="container"><!-- 세 번째 블럭(앨범) start -->
		<h3>앨범</h3>
		<div class="row">
			<c:forEach begin="1" end="5" var="k">			
				<div class="col-md-3">
					<img src="/resources/image/album${k}.png" width="70%">
					<div>
						<h5>앨범제목</h5>
						<h5>태연</h5>
						<h5>발행일</h5>
					</div>
				</div>
			</c:forEach>
		</div>
	</div><!-- 세 번째 블럭(앨범) end -->
	
	<!-- ----------------------------------  -->
	<br><br>
	<div class="container"><!-- 네 번째 블럭(뮤직비디오) start -->		
		<h3>이 앨범의 뮤직비디오</h3>
		<div>
			<c:forEach begin="1" end="3" var="q">
				<div class="col-md-3">
					<img src="/resources/image/mv${q}.png" width="80%">
				</div>
			</c:forEach>
		</div>
	</div><!-- 네 번째 블럭(뮤직비디오) end -->
	
	<!-- ----------------------------------  -->
	<br><br>
	<div class="container"><!-- 다섯 번째 블럭(한마디) start -->
		<h3>한마디(12)</h3>
		<div><!-- 텍스트박스와 입력 버튼-->
			<div class="col-md-11">
				<textarea rows="5" cols="100%" style="resize: none;"></textarea>
			</div>
			<div class="col-md-1">
				<button class="btn-lg">등록</button>
			</div>
		</div><!-- 텍스트박스와 입력 버튼 end-->
		
		<div><!-- 한마디 테이블 start -->
			<table class="table">
				<c:forEach begin="1" end="12" var="i">
					<tr>
						<th rowspan="2">test${i}</th>
						<td>굳!</td>
					</tr>
					<tr>
						<td>2016.07.06 15:12</td>
					</tr>
				</c:forEach>
			</table>
		</div><!-- 한마디 테이블  end -->
	</div><!-- 다섯 번째 블럭(한마디) end -->
</body>
</html>