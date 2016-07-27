<%--
작성자 - 이주연
내용 - 업로드 1단계 페이지
시작날짜 - 2016/07/17
수정날짜 - 2016/07/24
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
<title>Upload1_Artist</title>
<script>
	$(document).ready(function() {
		// 아티스트 정보에 대한 항목 입력을 확인하는 jquery 
		$("#regist").click(function() {
			var file = artist.artistImg.value;
			var fileExt = file.substring(file.lastIndexOf('.')+1); //파일확장자 
			if (!$("#artistName").val()) {
				alert("아티스트명을 입력해주세요.");
				return false;
			} else if (!$("#artistImg").val()) {
				alert("이미지를 업로드해주세요.");
				return false;
			} else if (fileExt.toUpperCase() == "MP3" || fileExt.toUpperCase() == "AVI" || fileExt.toUpperCase() == "JSP") {
				alert("이미지파일만 업로드할 수 있습니다. 다시 확인해주세요.");
				return false;
			} else if (!$("#artistType").val()) {
				alert("타입을 선택해주세요.");
				return false;
			} else if (!$("#artistGenre").val()) {
				alert("장르를 선택해주세요.");
				return false;
			} else {
				alert("아티스트가 등록되었습니다.");
				$("#artist").submit();
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
	margin-top:30px;
}
#upload_main {
	margin-left: 100px;
}
#pom {
	border-radius: 17px;
	background-color: #EDE6E6;
	box-shadow: 2px 2px 2px 2px #E0E0E0;
}
#regist {
	border: none;
	box-shadow: 2px 2px 2px 2px #E0E0E0;
}
#cencle {
	border: none;
	box-shadow: 2px 2px 2px 2px #E0E0E0;
	background-color: gray;
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
					<img src='resources/image/upload/album/one.png'>&nbsp;아티스트 등록
				</h3>
		</div>

		<div class="col-md-12 column">
			<br /> <br />
			<div class="jumbotron" id="pom">
				<form id="artist" action="upload" method="post" accept-charset="UTF-8" enctype="multipart/form-data" >
					<div id="upload_main">
						<div class="col-md-2 col-md-offset-1">
							<br /> <img src="resources/image/upload/album/album_image.PNG"
								width="120%"><br /> <br /> <input type="file"
								name="artistImg" id="artistImg" accept=".gif, .jpg, .png"/>
						</div>
						<!-- end -->
						<br />
						<div class="row">
							<div class="col-md-5 col-md-offset-1">
								<label for="artistName" class="col-xs-4 control-label">아티스트</label>
								<div class="col-xs-8">
									<input type="text" class="form-control" id="artistName"
										name="artistName"><br />
								</div>
								<!-- 아티스트 타입 등록 -->
								<label for="artistType" class="col-xs-4 control-label">타입</label>
								<div class="col-xs-8">
									<select class="form-control" id="artistType" name="artistType">
										<option>솔로</option>
										<option>그룹</option>
										<option>밴드</option>
									</select><br />
								</div>
								<label for="artistGenre" class="col-xs-4 control-label">장르</label>
								<div class="col-xs-8">
									<!-- 아티스트 장르 등록 -->
									<select class="form-control" id="artistGenre"
										name="artistGenre">
										<option>발라드/댄스/팝</option>
										<option>일렉트로닉</option>
										<option>알앤비</option>
										<option>락/메탈</option>
										<option>재즈</option>
										<option>힙합</option>
										<option>인디</option>
									</select><br />
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
			<!-- 버튼 start -->
			<div align="center" style="margin-top: 160px">
				<div class="form-group">
					<button type="submit" class="btn btn-primary" id="regist">등록</button>
					<button type="reset" class="btn btn-primary" id="cencle">취소</button>
				</div>
			</div>
			<!-- end -->
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