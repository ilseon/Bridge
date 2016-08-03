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
<link href="/resources/bootstrap/css/bootstrap.css" rel="stylesheet"
	type="text/css" />
<script src="/resources/bootstrap/js/jquery-2.2.3.min.js"></script>
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
<script src="/resources/bootstrap/css/bootstrap.css" type="text/css"></script>
<script>
	//비밀번호를 입력을 확인하는 jquery 
	$(document).ready(function() {
		$(".btn-primary").on("click", function() {
			if (!$("#userPassword").val()) {
				alert("비밀번호를 입력해주세요.");
				return false;
			} else if ($("#userPassword").val() != $("#dbPassword").val()) {
				alert("비밀번호가 틀렸습니다. 다시 확인해서 입력해주세요.");
				return false;
			} else if ($("#userPassword").val() == $("#dbPassword").val()) {
				alert("확인되었습니다.");
				$("#pwcheck").submit();
			}
		});
	});
</script>
<style>
#main {
	margin-bottom: 320px;
}
</style>
</head>
<body style="margin-top: 4%;">
	<!-- header, sideber start -->
	<%@include file="/WEB-INF/views/include/header.jsp"%>
	<%@include file="/WEB-INF/views/include/sidebar.jsp"%>
	<!-- end -->

	<!-- 상단 tab start-->
	<div class="container" id="main">
		<br /> <br />
		<div class="col-md-12">
			<ul class="nav nav-tabs">
				<li><a href="modify">개인정보변경</a></li>
				<li class="active"><a href="withdrawal">회원탈퇴</a></li>
			</ul>
		</div>


<!-- 비밀번호를 확인 start-->
		<div class="col-md-10 col-md-offset-1">
			<br /> <br />
			<h5>
				<strong>회원님의 개인정보보호를 위해 현재 사용중인 비밀번호를 입력해 주시기 바랍니다 </strong>
			</h5>
			<br /> <br />
			<form class="form-horizontal well" action="withdrawal" method="post"
				accept-charset="UTF-8" id="pwcheck">
				<input type="hidden" id="dbPassword" name="dbPassword"
					value="${userPassword}" />
				<div class="form-group">
					<label for="id" class="col-lg-5 control-label">아이디</label>
					<div class="col-md-3">
						<input type="text" class="form-control" name="userId" id="userId"
							value="${userid}">
					</div>
				</div>
				<div class="form-group">
					<label for="pw" class="col-lg-5 control-label">비밀번호</label>
					<div class="col-md-3">
						<input type="password" class="form-control" id="userPassword"
							name="userPassword" placeholder="비밀번호 입력">
					</div>
				</div>
			</form>
		</div>
		<!-- end -->
		
		<!-- 버튼 start -->
		<div class="col-md-12">
			<div align="center" style="margin-top: 70px">
				<div class="form-group">
					<button type="submit" class="btn btn-primary">확인</button>
					<button type="reset" class="btn btn-default">취소</button>
				</div>
			</div>
		</div>	
		<!-- end -->
	</div>
	<br />
	<br />

	<!--  footer start -->
	<%@include file="/WEB-INF/views/include/footer.jsp"%>
	<!--  end -->

</body>
</html>