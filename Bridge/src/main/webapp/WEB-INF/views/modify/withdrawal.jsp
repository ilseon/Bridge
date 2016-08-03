<%--
작성자 - 이주연
내용 - 회원탈퇴 페이지
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
	//탈퇴 동의 페이지 
	function fnConfirm() {
		window.open("confirm", "", "width=400, height=400, scrollbars=yes");
	}
	//self.location = "/app/";
</script>
</head>
<body style="margin-top: 4%;">
	<!-- header, sideber start -->
	<%@include file="/WEB-INF/views/include/header.jsp"%>
	<%@include file="/WEB-INF/views/include/sidebar.jsp"%>
	<!-- end -->


	<!-- 상단 tab start -->
	<div class="container">
		<br /> <br />
		<div class="col-md-12">
			<ul class="nav nav-tabs">
				<li><a href="modify">개인정보변경</a></li>
				<li class="active"><a href="withdrawal">회원탈퇴</a></li>
			</ul>
		</div>
		<!-- end -->

		<!-- 회원탈퇴 start -->
		<div class="col-md-10 col-md-offset-1">
			<br /> <br />
			<h5>
				<strong>회원탈퇴에 앞서 아래의 사항들을 꼭 확인하시기 바랍니다.</strong>
			</h5>
			<br />
			<br />
			<form class="form-horizontal well" id="f" method="post">
				<div class="form-group">

					<h4>
						<strong>&nbsp;&nbsp;&nbsp;회원님의 모든 개인정보 및 이용정보가 삭제되며 복구가
							불가능합니다. </strong>
					</h4>
					&nbsp;&nbsp;&nbsp;&nbsp;- 스트리밍 정보 및 앨범 이용에 대한 정보 등<br />
					&nbsp;&nbsp;&nbsp;&nbsp;- 구매하신 음원의 재다운로드 서비스 불가 <br /> <br />
					<h4>
						<strong>&nbsp;&nbsp;&nbsp;해당 아이디로 7일 이내 재가입이 불가능합니다. </strong>
					</h4>
					<br />
				</div>
			</form>
		</div>
		<!-- end -->

		<!-- 버튼 start -->
		<div class="col-md-12">
			<div align="center" style="margin-top: 80px">
				<div class="form-group">
					<button type="submit" class="btn btn-warning" onclick="fnConfirm()">위
						내용을 확인하였고, 모든 정보 삭제에 동의합니다.</button>
				</div>
			</div>
		</div>
		<!--  end -->
	</div>
	<br />
	<br />
	<!--  footer start -->
	<%@include file="/WEB-INF/views/include/footer.jsp"%>
	<!--  end -->
</body>
</html>