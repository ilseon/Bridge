<%--
작성자 - 김우준
내용 - 회원가입완료 페이지
시작날짜 - 2016/07/25
수정날짜 - 
변경내용 - 
 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%> 

<!DOCTYPE html>
<html>
<link href="/resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
<script src="/resources/bootstrap/js/jquery-2.2.3.min.js"></script>
<head>
<title>회원가입 완료</title>
</head>
<jsp:include page="../include/header.jsp" />
<jsp:include page="../include/sidebar.jsp" />
<link href="/resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
<body>
<div class="container" align="center">
	<div class="row">
		<div class="col-md-12">
			<h2>회원가입을 축하드립니다!</h2>
				<div class="form-group"></br>
					<h3>${username}님의 회원가입을 축하드립니다</h3>
				</div>
				<h3>앞으로 저희 bridge에서 많은 활동과 좋은 음악 들으시길 바라겠습니다</h3></br></br>
				<a href="/">
				<button class="btn btn-default">메인페이지로</button>
				</a>
		
		</div>
	
	</div>

</div>
</body>
</html>