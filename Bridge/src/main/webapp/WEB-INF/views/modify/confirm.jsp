<%--
작성자 - 이주연
내용 - 아티스트 정보 등록 페이지
시작날짜 - 2016/07/17
수정날짜 - 
변경내용 - 
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
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
	//탈퇴 동의 jquery 
	$(document).ready(function() {
		$(".btn-danger").on("click", function() {
			alert("탈퇴되었습니다.");
			window.close();
		});
	});
</script>
<body style="margin-top: 4%;">
	<br />
	<br />
	<br />
	<div class="container">
		<div class="col-md-4">
			<div class="panel panel-danger">
				<div class="panel-heading">
					<h4 class="text-center">회원 탈퇴</h4>
				</div>
				<div class="panel-body text-center">
					<p class="leave">
					<br />
						<strong>정말로 탈퇴하시겠습니까?</strong>
					</p>
				</div>
			</div>
			<div class="form-group" align="center" style="margin-top: 40px">
				<button type="submit" class="btn btn-danger">확인</button>
				<button type="reset" class="btn btn-default"
					onclick="window.close();">취소</button>
			</div>
		</div>
	</div>

	<!-- end -->
</body>
</html>
