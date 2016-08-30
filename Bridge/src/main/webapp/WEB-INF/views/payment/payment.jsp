<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<%--
작성자 - 이주연
내용 - 결제내역 페이지
시작날짜 - 2016/07/17
수정날짜 - 
변경내용 - 
 --%>
<!DOCTYPE html>
<html>
<head>
<script src="/Bridge/resources/bootstrap/js/jquery-2.2.3.min.js"></script>
<script src="/Bridge/resources/bootstrap/js/bootstrap.min.js"></script>
<script src="/Bridge/resources/bootstrap/css/bootstrap.css"
	type="text/css"></script>
</head>
<script>
	$(document).ready(function() {
		alert($("#pay").val().length);
	});
</script>
<style>
#main {
	margin-bottom: 400px;
}
.table th {
	background-color: #ECA4A6;
	text-align: center;
	color: #fff;
}
.table td {
	text-align: center;
	background-color: white;
}
</style>
<body style="margin-top: 4%;">
	<!-- header, sideber start -->
	<%@include file="/WEB-INF/views/include/header.jsp"%>
	<%@include file="/WEB-INF/views/include/sidebar.jsp"%>
	<!-- end -->

	<!-- 상단 tab start -->
	<div class="container" id="main">
		<br /> <br />
		<div class="col-md-12">
			<ul class="nav nav-tabs">
				<li class="active"><a href="payment">결제내역</a></li>
			</ul>
		</div>
		<!-- end -->
		<!-- 결제한 곡에 대한 정보 start -->

		<div class="col-md-6 col-md-offset-3" align="center">
			<br /> <br />
			<table class="table">
				<thead class="thead-inverse">
					<tr>
						<th>날짜</th>
						<th>곡</th>
						<th>아티스트</th>
						<th>금액</th>
					</tr>
				</thead>
					<c:set var="j" value="0"></c:set>
				<c:forEach var="list" items="${pay}">
					<c:set var="j" value="${j+2}"></c:set>
					<tr>

						<td>${list.downloadDate}</td>
						<td><a href="download">${list.musicSubject}</a></td>
						<td>${list.artistName}</td>
						<td>$2</td>
					</tr>
				</c:forEach>
				<tr>				
					<td></td>
					<td></td>
					<td><strong>총 금액</strong></td>
					<td>$ ${j}</td>
				</tr>

			</table>
		</div>
	</div>
	<!-- end -->
	<br />
	<br />
	<!--  footer start -->
	<%@include file="/WEB-INF/views/include/footer.jsp"%>
	<!--  end -->
</body>
</html>
