<%--
작성자 - 이주연
내용 - 아티스트 정보 등록 페이지
시작날짜 - 2016/07/17
수정날짜 - 
변경내용 - 
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@page import="java.util.Vector"%>
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
		// 아티스트 정보에 대한 항목 입력을 확인하는 jquery 
		$("#save").on("click", function() {
			if (!$("#artistname").val()) {
				alert("아티스트명을 입력해주세요.");
				return false;
			} else if (!$("#artistimg").val()) {
				alert("이미지를 업로드해주세요.");
				return false;
			} else if (!$("#artisttype").val()) {
				alert("타입을 선택해주세요.");
				return false;
			} else if (!$("#artistgenre").val()) {
				alert("장르를 선택해주세요.");
				return false;
			} else {
				opener.document.f.artistname.value = $("#artistname").val();
				opener.document.f.artistimg.value = $("#artistimg").val();
				opener.document.f.artisttype.value = $("#artisttype").val();
				opener.document.f.artistgenre.value = $("#artistgenre").val();
				opener.document.f.usernumber.value = $("#usernumber").val();
				alert("등록되었습니다.");
				self.close();
			}
		});
	});
</script>
<style>
#save {
	background-color: #F6C4BC;
	border: none;
}

#tab {
	border: none;
	background-color: #DF6E76;
	box-shadow: 2px 2px 2px 2px #E0E0E0;
	color: white;
}
</style>
<body>
	<br />
	<div class="container">
		<div class="col-md-12 column">
			<div class="panel panel-info">
				<div class="panel-heading" id="tab">
					<h3 class="panel-title">아티스트 정보 입력</h3>
				</div>
			</div>
		</div>
		<form id="f">
			<div class="col-xs-4">
				<input type="hidden" name="usernumber" id="usernumber" value="2" />
				<!-- 아티스트 이미지 등록 -->
				<br /> <img src="resources/image/upload/album/artist.jpg"
					width="120%"><br /> <br /> <input type="file"
					name="artistimg" id="artistimg" />
			</div>

			<div class="col-xs-7 col-xs-offset-1">
				<br />
				<div class="row">
					<!-- 아티스트명 입력 -->
					<label for="artistname" class="col-xs-4 control-label">아티스트</label>
					<div class="col-xs-7">
						<input type="text" class="form-control" id="artistname"><br />
					</div>

				</div>

				<div class="row">
					<!-- 아티스트 타입 등록 -->
					<label for="artisttype" class="col-xs-3 control-label">타입</label>
					<div class="col-xs-8">
						<select class="form-control" id="artisttype">
							<option>솔로</option>
							<option>그룹</option>
							<option>밴드</option>
						</select><br />
					</div>
				</div>
				<div class="row">
					<label for="artistgenre" class="col-xs-3 control-label">장르</label>
					<div class="col-xs-8">
						<!-- 아티스트 장르 등록 -->
						<select class="form-control" id="artistgenre">
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
		</form>
	</div>
	<!-- end -->
	<!-- 버튼 start -->
	<div align="center" style="margin-top: 50px">
		<div class="form-group">
			<button type="submit" class="btn btn-primary" id="save">저장</button>
			<button type="reset" class="btn btn-default"
				onclick="window.close();">닫기</button>
		</div>
	</div>
	<!-- end -->
</body>
</html>
