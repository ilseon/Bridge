
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
 
<html>
<head>
  <link href="/resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
	<title>Home</title>
</head>
<body>

<%@include file="include/header.jsp" %>
<%@include file="include/sidebar.jsp" %>

	<div class="container" >
		<!-- 최신앨범 -->
		<div class="row">
			<div class="col-sm-11"
				style="border: 1px solid #BDBDBD; margin-bottom: 50px;">
				<h4>최신앨범</h4>
				<c:forEach var="i" begin="0" end="11" step="1">
					<div class="col-xs-6 col-sm-1" style="margin: 35px;">
						<a href="#"> <img src="/resources/image/shinhwa.PNG"
							style="height: 80px;">
							<div>WE (12번째..)</div>
							<div>신화</div>
						</a>
					</div>
				</c:forEach>
			</div>


			<!-- 인기차트 -->
			<div class="col-sm-11" style="border: 1px solid #BDBDBD">
				<div>
					<h4>인기 차트 (실시간 시간)</h4>
				</div>
				<br />

				<!-- 인기차트 테이블 -->
				<table class="table">
					<c:forEach begin="1" end="10" var="j">
						<tr>
							<td width="7%">${j}</td>
							<td width="20%">-</td>
							<td width="20%">표적</td>
							<td width="7%">신화</td>
							<td width="8%"><input type="image"
								src="/resources/image/mainplay.PNG" /></td>
							<td width="7%"><input type="image"
								src="/resources/image/mainplus.PNG" /></td>
						</tr>
					</c:forEach>
				</table>
				<!-- 인기차트 테이블 끝 -->

			</div>
			<!-- 인기차트 끝-->

			<!-- 옆에 퀵메뉴 -->
			<div class="col-sm-1 visible-lg "
				style="position: fixed; bottom: 20px; height: auto; right: 20px;">
				<input type="image" src="/resources/image/maintop.PNG" />
			</div>
			<!-- 옆에 퀵메뉴 끝 -->
			
		</div>
	</div>
		<%@include file="include/footer.jsp"%>
</body>
</html>

