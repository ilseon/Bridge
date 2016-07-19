<%--
작성자 - 이주연
내용 - 회원탈퇴를 위한 비밀번호를 체크하는 페이지
시작날짜 - 2016/07/17
수정날짜 - 
변경내용 - 
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@page import="java.util.Enumeration"%>
<!DOCTYPE html>
<html>
<head>
<link href="/resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
<script src="/resources/bootstrap/js/jquery-2.2.3.min.js"></script>
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
<script src="/resources/bootstrap/css/bootstrap.css" type="text/css"></script>
<script>
	//비밀번호를 입력을 확인하는 jquery 
	$(document).ready(function() {
		$(".btn-primary").on("click", function() {
			if (!$("#pw").val()) {
				alert("비밀번호를 입력해주세요.");
				return false;
			}else{
				$("#f").submit();
			}	
		});
	});
</script>
</head>
<body>
	<!-- 상단 tab start-->
	<div class="container">
		<br /> <br />
		<ul class="nav nav-tabs">
			<li><a href="modify" data-toggle="tab">개인정보변경</a></li>
			<li class="active"><a href="withdrawal" data-toggle="tab">회원탈퇴</a></li>
		</ul>
	</div>
	<!-- end -->
	<br />
	<br />
	
	<!-- 비밀번호를 확인 start-->
	<div class="container">
		<div class="col-md-10 col-md-offset-1">
			<h5>
				<strong>회원님의 개인정보보호를 위해 현재 사용중인 비밀번호를 입력해 주시기 바랍니다 </strong>
			</h5>
			<br /> <br />
			<form class="form-horizontal well" action="withdrawal" method="post" id="f">
				<div class="form-group">
					<label for="id" class="col-lg-5 control-label">아이디</label>
					<div class="col-md-3">
						<input type="text" class="form-control" id="id" value="AAA">
					</div>
				</div>
				<div class="form-group">
					<label for="pw" class="col-lg-5 control-label">비밀번호</label>
					<div class="col-md-3">
						<input type="text" class="form-control" id="pw"
							placeholder="비밀번호 입력">
					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- end -->

<!-- 버튼 start -->
	<div class="container">
		<div align="center" style="margin-top: 80px">
			<div class="form-group">
				<button type="submit" class="btn btn-primary">확인</button>
				<button type="reset" class="btn btn-default">취소</button>
			</div>
		</div>
	</div>
<!-- end -->	
	<br />
	<br />
</body>
</html>