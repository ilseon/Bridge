<%--
작성자 - 이주연
내용 - 아티스트 정보 등록 페이지
시작날짜 - 2016/07/17
수정날짜 - 
변경내용 - 
 --%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@page import="java.util.Vector"%>
<!DOCTYPE html>
<html>
<head>
<link href="/resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
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
<body>
	<br /><br /><br />
	<div class="container">
		<fieldset>
			<!-- 회원탈퇴 동의 -->
			<h4 align="center">
				<strong>정말로 탈퇴하시겠습니까?</strong>
			</h4>
		</fieldset>
	</div>

	<!-- end -->
	<hr />
	<!-- 버튼 start -->
	<div align="center" style="margin-top: 50px">
		<div class="form-group">
			<button type="submit" class="btn btn-danger" >확인</button>
			<button type="reset" class="btn btn-default"
				onclick="window.close();">취소</button>
		</div>
	</div>
	<!-- end -->
</body>
</html>
