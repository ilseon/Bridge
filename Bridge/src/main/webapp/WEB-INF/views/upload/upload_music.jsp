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
<script src="/Bridge/resources/bootstrap/js/jquery-2.2.3.min.js"></script>
<script src="/Bridge/resources/bootstrap/js/bootstrap.min.js"></script>
<script src="/Bridge/resources/bootstrap/css/bootstrap.css" type="text/css"></script>
</head>
<title>Upload1_Music</title>
<script>
	$(document).ready(
			function() {
				//업로드시 빠지는 항목을 체크하는 jquery 
				$("#regist").click(
						function() {							
							var cnt = $("#counter").val();					
							for (var i = 1; i <= cnt; i++) {
								if (!$("#musicFile" + i).val()) {
									alert(i + " 트랙 음원이 업로드되지 않았습니다.");
									return false;
								} else if (!$("#musicSubject" + i).val()) {
									alert(i + " 트랙 곡 명이 입력되지 않았습니다.");
									return false;
								} else if ($("input:checked").length == 0) {
									alert("타이틀을 체크해주세요.");
									return false;
								} else if ($("#musicFile" + i).val()
										&& $("#musicSubject" + i).val()) {
								}								
							}
							alert("업로드되었습니다.");
							$("#music").submit();
						});
			});	
</script>
<style>
#tab {
	border: none;
	background-color: #DF6E76;
	box-shadow: 2px 2px 2px 2px #E0E0E0;
	color: white;
	margin-top: 35px;
}

#sub {

	border: none;
	background-color: white;
	box-shadow: 2px 2px 2px 2px #E0E0E0;
	color: #DF6E76;
}

#val {

	border: none;
	background-color: #DF6E76;
	box-shadow: 2px 2px 2px 2px #E0E0E0;
	color: white;
}

#align {
	margin-left: 825px;
	margin-top: -33px;
}

#pom {
	border-radius: 17px;
	background-color: #EDE6E6;
	box-shadow: 2px 2px 2px 2px #E0E0E0;
}

#before {
	border-color: orange;
	background-color: orange;
}

#upload {
	border: none;
}

#cencle {
	border-color: gray;
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
<body style="margin-top: 4%;">
	<!-- header, sideber start -->
	<%@include file="/WEB-INF/views/include/header.jsp"%>
	<%@include file="/WEB-INF/views/include/sidebar.jsp"%>
	<!-- end -->
	<div class="container">
		<div class="panel-heading col-md-2" id="tab">
			<h3 class="panel-title">
				<img src='resources/image/upload/album/three.png'>&nbsp;음원 정보
				입력
			</h3>
		</div>

		<!-- 음원  업로드 -->
		<div class="col-md-12">
			<br /> <br />
			<div class="jumbotron" id="pom">
				<form class="form-horizontal" id="music" name="music" action="upload3"
					method="post" enctype="multipart/form-data">
					<input type="hidden" id="title" name="title"
						value="" />		
					<input type="hidden" id="artistNumber" name="artistNumber"
						value="${artistList.artistNumber}" />
					<input type="hidden" id="artistName" name="artistName"
						value="${artistList.artistName}" />
					<input type="hidden" class="form-control" id="albumNumber"
										name="albumNumber" value="${albumList.albumNumber}"> <input
						type="hidden" class="form-control" id="albumImg" name="albumImg"
						value="/upload/album/${albumList.albumImg}"> <input
						type="hidden" name="counter" id="counter" value="${counter}" />
					<div class="btn btn-primary" id="sub">
						<strong>${albumList.albumName}</strong>
					</div>
					&nbsp;&nbsp;
					<div class="btn btn-primary" id="val">
						<strong>${artistList.artistName}</strong>
					</div>
					<br /> <br />
					<table class="table">
						<tr>
							<th width="6%">트랙</th>
							<th width="1%">음원 파일</th>
							<th width="8%">타이틀</th> 
							<th width="28%">곡</th>
							<th width="1%"></th>
							<th width="19%">뮤비</th>
							<th width="1%"></th>
							<th width="35%">가사</th>
						</tr>
						<!-- 음원파일, 곡, 타이틀, 뮤비 등록 -->
						<c:forEach begin="1" var="i" end="${counter}">
							<tbody>
								<tr>
									<td><strong>${i}</strong></td>
									<td><input type="file" name="musicFile${i}"
										id="musicFile${i}" accept="audio/*"/></td>						
									<td><input type="checkbox" name="musicTitle${i}"
										id="musicTitle${i}" value="1"></td>
									<td><input type="text" name="musicSubject${i}" 
										id="musicSubject${i}" class="form-control" width="20%" /></td>
									<td></td>
									<td><input type="text" name="musicVideo${i}"
										id="musicVideo${i}" class="form-control" /></td>
									<td></td>	
									<td><textarea class="form-control" rows="4" cols="70"
										id="musicLyrics${i}" name="musicLyrics${i}"
										placeholder="가사를 입력해주세요.">
										</textarea></td>
								</tr>
							</tbody>
						</c:forEach>
					</table>
				</form>
			</div>
			<!-- end -->
			<!-- 버튼 start -->
			<div align="center" style="margin-top: 90px">
				<div class="form-group">
					<button type="submit" class="btn btn-primary" id="regist" >업로드</button>
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