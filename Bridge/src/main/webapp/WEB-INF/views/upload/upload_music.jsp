<%--
작성자 - 이주연
내용 - 업로드 2단계
시작날짜 - 2016/07/20
수정날짜 - 2016/07/20
변경내용 - 음원에 대한 예외처리
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="/resources/bootstrap/css/bootstrap.css" rel="stylesheet"
	type="text/css" />
<script src="/resources/bootstrap/js/jquery-2.2.3.min.js"></script>
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
<script src="/resources/bootstrap/css/bootstrap.css" type="text/css"></script>
</head>
<title>Upload1_Music</title>
<script>
	$(document).ready(
			function() {
				//업로드시 빠지는 항목을 체크하는 jquery 
				$("#regist").click(
						function() {
							var cnt = $("#cnt").val();
							for (var i = 0; i < cnt; i++) {
								if (!$("#musicfile" + i).val()) {
									alert((i + 1) + "번째 음원이 업로드되지 않았습니다.");
									return false;
								} else if (!$("#musicsubject" + i).val()) {
									alert((i + 1) + "번째 곡 명이 입력되지 않았습니다.");
									return false;
								} else if ($("#musicfile" + i).val()
										&& $("#musicsubject" + i).val()) {
								}
							}
							alert("업로드되었습니다.");
							alert()
						});

				//클릭시 색 변화로 체크된 것을 확인하는 jquery 
				$(function() {
					var cnt = $("#cnt").val();
					for (var i = 0; i < cnt; i++) {
						$("#musictitle" + i).mousedown(function(event) { //클릭하고 있으면 
							$(event.target).css('Color', 'blue');
						});
						$("#musictitle" + i).mouseup(function(event) { //클릭을 떼는 순간
							$(event.target).css('Color', 'white');
						});
					}
				});
			});
</script>
<style>
#tab {
	border: none;
	background-color: #DF6E76;
	box-shadow: 2px 2px 2px 2px #E0E0E0;
	color: white;
}

#pom {
	border-radius: 17px;
	background-color: #EDE6E6;
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

#btn {
	background-color: white;
}
</style>
<body>
	<!-- header, sideber start -->
	<%@include file="/WEB-INF/views/include/header.jsp"%>
	<%@include file="/WEB-INF/views/include/sidebar.jsp"%>
	<!-- end -->
	<div class="container">
		<div class="panel panel-info">
			<br />
			<div class="panel-heading col-md-2" id="tab">
				<h3 class="panel-title">
					<img src='resources/image/upload/album/three.png'>&nbsp;음원 정보
					입력
				</h3>
			</div>
		</div>

		<!-- 음원  업로드 -->
		<%
			int cnt = 0;
			if (request.getParameter("counter") != null) {
				cnt = Integer.parseInt(request.getParameter("counter"));
			}
		%>
		<div class="col-md-12">
			<br /> <br />
			<div class="jumbotron" id="pom">
				<form class="form-horizontal" id="music" action="upload3"
					method="post">
					<!-- 앨범 정보 -->
					<input type="hidden" name="albumName" id="albumName"
						value="${albumVO.albumName}" /> <input type="hidden"
						name="albumType" id="albumType" value="${albumVO.albumType}" /> <input
						type="hidden" name="albumDate" id="albumDate"
						value="${albumVO.albumDate}" /> <input type="hidden"
						name="albumGenre" id="albumGenre" value="${albumVO.albumGenre}" /><input
						type="hidden" name="artistNumber" id="artistNumber"
						value="${albumVO.artistNumber}" /> <input type="hidden"
						name="albumImg" id="albumImg" value="${albumVO.albumImg}" /> <input
						type="hidden" name="albumContent" id="albumContent"
						value="${albumVO.albumContent}" /> <input type="hidden" id="cnt"
						name="cnt" value="<%=request.getParameter("counter")%>" />
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
							for (int i = 0; i < cnt; i++) {
						%>
							<!-- 음원파일, 곡, 타이틀, 뮤비 등록 -->
							<tbody>
								<tr>
									<td><strong><%=i + 1%></strong></td>
									<td><input type="file" name="musicfile<%=i%>"
										id="musicfile<%=i%>" /></td>
									<td><input type="radio" name="title<%=i%>" id="title<%=i%>">
									</td>
									<td><input type="text" name="musicsubject<%=i%>"
										id="musicsubject<%=i%>" class="form-control" width="20%" /></td>
									<td><input type="text" name="musicvideo<%=i%>"
										id="musicvideo<%=i%>" class="form-control" width="15%" /></td>
									<td><input type="checkbox" name="musiccheck<%=i%>" id="musiccheck<%=i%>"></td>
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
					<button type="submit" class="btn btn-primary" id="regist">업로드</button>
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