<%--
작성자 - 이주연
내용 - 개인정보변경 페이지
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
	//정보수정에 대한 항목 입력을 확인하는 jquery 
	$(document).ready(function() {
		$(".btn-primary").on("click", function() {
			if (!$("#pw").val()) {
				alert("비밀번호를 입력해주세요.");
				return false;
			} else if (!$("#pw2").val()) {
				alert("다시 한번 비밀번호를 입력해주세요.");
				return false;
			} else if ($("#pw").val() != $("#pw2").val()) {
				alert("비밀번호가 일치하지 않습니다.");
				return false;
			} else if (!$("#tel").val()) {
				alert("전화번호를 입력해주세요.");
				return false;
			} else if (!$("#email").val()) {
				alert("이메일을 입력해주세요.");
				return false;
			} else {
				alert("수정되었습니다.");
				$("#f").submit();
				self.location = "/app/";
			}
		});
	});
</script>
</head>
<body style="margin-top: 4%;">
	<!-- header, sideber start -->
	<%@include file="/WEB-INF/views/include/header.jsp"%>
	<%@include file="/WEB-INF/views/include/sidebar.jsp"%>
	<!-- end -->

	<!-- 상단 tab start-->
	<div class="container">
		<br /> <br />
		<div class="col-md-12">
			<ul class="nav nav-tabs">
				<li class="active"><a href="modify">개인정보변경</a></li>
				<li><a href="withdrawal">회원탈퇴</a></li>
			</ul>
		</div>
		<!-- end -->

		<!-- 첫 번째 블럭(개인정보수정) start -->
		<div class="col-md-10 col-md-offset-1">
		<br /> <br />
			<h5>
				<strong>가입시 등록한 정보입니다.</strong>
			</h5>
			<br /> <br />
			<form class="form-horizontal" id="f" method="post">
				<div class="form-group">
					<label for="id" class="col-lg-5 control-label">아이디</label>
					<div class="col-md-3">
						<input type="text" class="form-control" id="id" value="AAA"
							readonly="readonly">
					</div>
				</div>
				<div class="form-group">
					<label for="pw" class="col-lg-5 control-label">비밀번호</label>
					<div class="col-md-3">
						<input type="text" class="form-control" id="pw"
							placeholder="비밀번호 입력" required="required">
					</div>
				</div>
				<div class="form-group">
					<label for="pw" class="col-lg-5 control-label">비밀번호 확인</label>
					<div class="col-md-3">
						<input type="text" class="form-control" id="pw2"
							placeholder="비밀번호 입력" required="required">
					</div>
				</div>
				<div class="form-group">
					<label for="email" class="col-lg-5 control-label">이메일</label>
					<div class="col-md-3">
						<input type="email" class="form-control" id="email"
							value="aaa@naver.com" required="required">
					</div>
				</div>
				<div class="form-group">
					<label for="tel" class="col-lg-5 control-label">전화번호</label>
					<div class="col-md-3">
						<input type="tel" class="form-control" id="tel"
							value="010-1111-1111" required="required">
					</div>
				</div>
			</form>
		</div>
		<!-- end -->
		<!-- 버튼 start -->
		<div class="col-md-12">
			<div align="center" style="margin-top: 80px">
				<div class="form-group">
					<button type="submit" class="btn btn-primary">확인</button>
					<button type="reset" class="btn btn-default">취소</button>
				</div>
			</div>
		</div>
		<!-- end -->
	</div>
	<!-- end -->
	<br />
	<br />
	<!--  footer start -->
	<%@include file="/WEB-INF/views/include/footer.jsp"%>
	<!--  end -->

</body>
</html>