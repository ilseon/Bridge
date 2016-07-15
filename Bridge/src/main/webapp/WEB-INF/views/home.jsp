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


	<!-- 최신앨범 -->
	<div class="row">
		<div class="col-xs-6 col-sm-6" style="background-color: red;" >
		
		<c:forEach var="i" begin="0" end="5" step="1">
			<div class="col-xs-6 col-sm-1" style="margin-left: 3px;">
				<a href="#"> <img src="/resources/image/shinhwa.PNG" style="height: 70px;">
					<div>WE (12번째..)</div>
					<div>신화</div>
				</a>
			</div>
			
			</c:forEach>
		</div>
	</div>








	<!-- 실시간차트 -->
<div></div>


<%@include file="include/footer.jsp" %>
</body>
</html>

