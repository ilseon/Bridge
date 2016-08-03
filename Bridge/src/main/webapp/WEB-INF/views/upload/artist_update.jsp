<%--
작성자 - 이주연
내용 - 아티스트 수정
시작날짜 - 2016/07/30
수정날짜 - 2016/07/30
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
		
		var dbartistType = $("#dbartistType").val();
		var TypeArr = $("#artistType").find("option").val();
		
		//TypeArr.each(function(i) {
			//var TypeValue = $(this).val();
		//});
		
		for(var i=0; TypeArr.length;  i++){
			var TypeValue = $("#artistType").val();		
		}
		
		if (TypeValue == dbartistType) {
			$("#artistType").prop("selected", "selected");
		}

		// 정보 수정 jquery 
		$("#update").click(function() {

			//var file = artist.artistImg.value;
			//alert(file);
			//var fileExt = file.substring(file.lastIndexOf('.') + 1); //파일확장자
			if ($("#artistType").val() == "선택") {
				alert("아티스트 타입을 선택해주세요.");
				return false;
			} else if ($("#artistGenre").val() == "선택") {
				alert("아티스트 장르를 선택해주세요.");
				return false;
			} else {
				alert("수정되었습니다.");
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
	margin-top: 30px;
}

#upload_main {
	margin-left: 100px;
}

#pom {
	border-radius: 17px;
	background-color: #E0E0E0;
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

.table th {
	text-align: center;
}

.table td {
	background-color: white;
	text-align: center;
}
</style>
<body style="margin-top: 4%;">
	<!-- header, sideber start -->
	<%@include file="/WEB-INF/views/include/header.jsp"%>
	<%@include file="/WEB-INF/views/include/sidebar.jsp"%>
	<!-- end -->

	<div class="container">
		<div class="panel-heading col-md-3" id="tab">
			<h3 class="panel-title">
				<img src='resources/image/upload/album/one.png'>&nbsp;&nbsp;아티스트
				수정
			</h3>
		</div>
		<div class="col-md-12">
			<br /> <br /> <br /> <br />
			<div class="jumbotron" id="pom">
				<div id="upload_main">
					<form id="artist" accept-charset="UTF-8" method="post"
						enctype="multipart/form-data" action="artistUpdateCom">
						<div class="col-md-2 col-md-offset-1">
							<input type="hidden" name="userNumber" id="userNumber"
								value="${userNumber}" /> <input type="hidden"
								name="artistNumber" id="artistNumber"
								value="${artistList.artistNumber}" /> <br /> <img
								src="/upload/artist/${artistList.artistImg}" width="120%"><br />
							<br />
							<input type="file" name="artistImg" id="artistImg"
								accept="image/*" />
						</div>
						<div class="col-md-5 col-md-offset-1">
							<br /> <label for="artistName" class="col-xs-4 control-label">아티스트</label>
							<div class="col-xs-8">
								<input type="text" id="dbartistName" name="dbartistName"
									value="${artistList.artistName}" class="form-control" /><br />
							</div>
							<!-- 아티스트 타입 등록 -->
							<label for="artistType" class="col-xs-4 control-label">타입</label>
							<div class="col-xs-8">
								<input type="text" id="dbartistType" name="dbartistType"
									value="${artistList.artistType}" /> <select
									class="form-control" id="artistType" name="artistType">
									<option>선택</option>
									<option>솔로</option>
									<option>그룹</option>
									<option>밴드</option>
								</select><br />
							</div>
							<label for="artistGenre" class="col-xs-4 control-label">장르</label>
							<div class="col-xs-8">
								<!-- 아티스트 장르 등록 -->
								<input type="text" id="dbartistGenre" name="dbartistGenre"
									value="${artistList.artistGenre}" /> <select
									class="form-control" id="artistGenre" name="artistGenre">
									<option>선택</option>
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
					</form>
					<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />
					<br />
				</div>
			</div>
			<!-- 버튼 start -->
			<div align="center" style="margin-top: 60px">
				<div class="form-group">
					<button type="submit" class="btn btn-primary" id="update">수정
					</button>
					<button type="reset" class="btn btn-primary" id="cencle">취소</button>
				</div>
			</div>
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