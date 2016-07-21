<%--
작성자 - 이주연
내용 - 업로드 2단계
시작날짜 - 2016/07/20
수정날짜 - 2016/07/20
변경내용 - 음원에 대한 예외처리
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
	$(document).ready(function() {
		//업로드시 빠지는 항목을 체크하는 jquery 
		$("#upload").click(function() {
			var cnt = $("#cnt").val();
			for (var i = 0; i < cnt; i++) {
				if (!$("#upFile" + i).val()) {
					alert((i + 1) + "번째 음원이 업로드되지 않았습니다.");
					return false;
				} else if (!$("#song" + i).val()) {
					alert((i + 1) + "번째 곡 명이 입력되지 않았습니다.");
					return false;
				} else if ($("#upFile" + i).val() && $("#song" + i).val()) {
				}
			}
			alert("업로드되었습니다.");
			$("f").submit();
		});
		//클릭시 색 변화로 체크된 것을 확인하는 jquery 
		$(function() {
			var cnt = $("#cnt").val();
			for (var i = 0; i < cnt; i++) {
				$("#title" + i).mousedown(function(event) { //클릭하고 있으면 
					$(event.target).css('Color', 'blue');
				});
				$("#title" + i).mouseup(function(event) { //클릭을 떼는 순간
					$(event.target).css('Color', 'white');
				});
			}
		});
	});
</script>
<style>
#pom {
	border-radius: 17px;
	background-color:  #EDE6E6;
	box-shadow: 2px 2px 2px 2px #E0E0E0;
}

#before {
	border: none;
	background-color: orange;
}

#upload {
	border: none;
}

#cencle {
	border: none;
	background-color: gray;
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

#btn{ 
	background-color: white;
}
</style>
<body>
	<!-- header, sideber start -->
	<%@include file="/WEB-INF/views/include/header.jsp"%>
	<%@include file="/WEB-INF/views/include/sidebar.jsp"%>
	<!-- end -->
	<div class="container">
		<br /> <br />
		<!-- 상단 tab start -->
		<div class="col-md-12">
			<ul class="nav nav-tabs">
				<li class="active"><a href="upload">업로드하기</a></li>
				<li><a href="mytrack">내 트랙</a></li>
			</ul>
			<!-- end -->
		</div>
		<!-- 음원  업로드 -->
		<%
			int cnt = 0;
			if (request.getParameter("counter") != null) {
				cnt = Integer.parseInt(request.getParameter("counter"));
			}
		%>
		<div class="col-md-12">
			<br /><br />
			<div class="jumbotron" id="pom">
				<form class="form-horizontal" id="f" action="mytrack" method="get">
					<input type="hidden" id="cnt" name="cnt"
						value="<%=request.getParameter("counter")%>" />
					<table class="table">
						<tr>
							<th width="8%"><img
								src="resources/image/upload/album/track.png"></th>
							<th width="20%"><img
								src="resources/image/upload/album/soundsource.png"></th>
							<th width="8%"><img
								src="resources/image/upload/album/title.png"></th>
							<th width="30%"><img
								src="resources/image/upload/album/music.png"></th>
							<th width="20%"><img
								src="resources/image/upload/album/mv.png"></th>
							<th width="8%"><img
								src="resources/image/upload/album/19.PNG"></th>
						</tr>
						<%
							if (cnt == 0) {
						%>
						<tr>
							<td colspan="9" style="text-align: center"><h5>
									<strong> <br /> <br /> <br />현재 등록된 곡이 없습니다.
									</strong>
								</h5></td>
						</tr>
						<%
							}
							for (int i = 0; i < cnt; i++) {
						%>
						<!-- 음원파일, 곡, 타이틀, 뮤비 등록 -->
						<tbody>
							<tr>
								<td><strong><%=i+1%></strong></td>	
								<td><input type="file" name="upFile<%=i%>"
									id="upFile<%=i%>" /></td>
								<td><input type="radio" name="title" id="title<%=i%>">
									</td>
								<td><input type="text" name="song" id="song<%=i%>"
									class="form-control" width="20%" /></td>
								<td><input type="text" name="musicvideo<%=i%>"
									id="musicvideo<%=i%>" class="form-control" width="15%" /></td>
								<td>
									<input type="checkbox" id="limit<%=i%>">
								</td>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
				</form>
			</div>
			<!-- end -->

			<!-- 버튼 start -->
			<div align="center" style="margin-top: 90px">
				<div class="form-group">
					<button type="submit" class="btn btn-primary" id="before">뒤로</button>
					<button type="submit" class="btn btn-primary" id="upload">업로드</button>
					<button type="reset" class="btn btn-primary" id="cencle">취소</button>
				</div>
			</div>
			<!-- end -->
		</div>
	</div>
	<br />
	<br />
	<!--  footer start -->
	<%@include file="/WEB-INF/views/include/footer.jsp"%>
	<!--  end -->
</body>
</html>