<%--
작성자 - 이주연
내용 - 업로드 2단계
시작날짜 - 2016/07/20
수정날짜 - 2016/07/20
변경내용 - 음원에 대한 예외처리
 --%>
<%@page import="com.bridge.app.domain.AlbumVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
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
							var cnt = $("#counter").val();
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
							$("#music").submit();
						});
				//클릭시 색 변화로 체크된 것을 확인하는 jquery 
				$(function() {
					var cnt = $("#counter").val();
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
	$(function() {
		var cnt = $("#counter").val();
		for (var i = 0; i < cnt; i++) {
			$("[id^=text]").hide();
			$(".button").click(function() {
				$("#text" + $(this).data("rel")).toggle();
			});
		}
	});
</script>
<style>
#tab {
	border: none;
	background-color: #DF6E76;
	box-shadow: 2px 2px 2px 2px #E0E0E0;
	color: white;
}
#album{
	border: none;
	background-color: white;
	box-shadow: 2px 2px 2px 2px #E0E0E0;
	color: #DF6E76;
}
#albumsub{
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
	border-color:orange;
	background-color: orange;
}
#upload {
	border: none;
}
#cencle {
	border-color:gray;
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
		<div class="col-md-12">
			<br /> <br />
			<div class="jumbotron" id="pom">
				<form class="form-horizontal" id="music" action="upload3"
					method="post" enctype="multipart/form-data">
					<!-- 앨범 정보 start -->
					<!-- <input type="hidden" name="albumName" id="albumName"
						value="${albumVO.albumName}" /> <input
						type="hidden" name="albumNumber" id="albumNumber"
						value="${albumVO.albumNumber}" /> <input
						type="hidden" name="artistNumber" id="artistNumber"
						value="${albumVO.artistNumber}" /> 
					-->
					<input type="hidden"
						id="counter" name="counter" value="3"/>
					<!-- end -->
					<div>
						<div class="btn btn-primary" id="album">
								<strong>앨범</strong>
						</div>&nbsp;&nbsp;
							<div class="btn btn-primary" id="albumsub">
								<strong>앨범명${albumVO.albumName}</strong>	
						</div>
					<br />									
					</div>
					<br /><br />	
					<table class="table">
						<tr>
							<th width="8%">트랙</th>
							<th width="20%">음원 파일</th>
							<th width="8%">타이틀</th>
							<th width="30%">곡</th>
							<th width="20%">뮤비</th>
						</tr>
						<%
							//임의로 값을 부여함.
							int cnt = 3;
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
								<td><button type="submit" class="btn btn-md"
										name="musicvideo<%=i%>" id="musicvideo<%=i%>"
										onclick="check()">클릭</button> <!-- <input type="text" name="musicvideo"
										id="musicvideo" class="form-control" width="15%" /> --></td>

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