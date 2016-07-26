<%--
작성자 - 이주연
내용 - 업로드 1단계 페이지
시작날짜 - 2016/07/17
수정날짜 - 2016/07/26
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
<title>Upload1_Album</title>
<script>
	$(document).ready(function() {
		//숫자만 입력하는 jquery 
		$(function() {
			$("#counter").keyup(function() {
				$(this).val($(this).val().replace(/[^0-9]/g, ""));
			});
			
		});
		//음원의 수를 확인하는 jquery 
		$("#add").click(function() {
			if (!$("#albumName").val()) {
				alert("앨범명을 입력해주세요.");
				return false;
			} else if (!$("#albumImg").val()) {
				alert("앨범이미지를 업로드해주세요.");
				return false;
			} else if (!$("#albumDate").val()) {
				alert("날짜를 입력해주세요.");
				return false;
			} else if (!$("#albumContent").val()) {
				alert("앨범에 대한 설명을 입력해주세요.");
				return false;
			} else if (!$("#counter").val()) {
				alert("등록할 음원의 수를 입력해주세요.");
				return false;
			} else if ($("#counter").val() <= 0) {
				alert("최소 0개 이상은 등록해야합니다.");
				return false;
			} else if ($("#counter").val() >= 8) {
				alert("최대 7개까지 등록할 수 있습니다.");
				return false;
			} else {
				alert("추가되었습니다.");
				$("#album").submit();
			}
		});
		
		//19세 제한에 대한 값을 전달하는 jquery
		$("#ageLimit").click(function() {		
			if($("#ageLimit").checked == true) {
				document.album.check.value = 1;
				alert("19세 이상 회원들만 이용할 수 있도록 설정합니다.");
				return false;
			} else{		
				document.album.check.value = 0;
			}
			alert("체크 값 : "+$("#ageLimit").val());
			alert("체크 값 : "+document.album.check.value);
		});		
	});
</script>
<style>
#tab {
	border: none;
	background-color: #DF6E76;
	box-shadow: 2px 2px 2px 2px #E0E0E0;
	color: white;
	margin-top:30px
}
#upload_main {
	margin-left: 100px;
}
#pom {
	border-radius: 17px;
	background-color: #EDE6E6;
	box-shadow: 2px 2px 2px 2px #E0E0E0;
}
#song_table {
	border-radius: 17px;
	background-color: white;
	box-shadow: 2px 2px 2px 2px #E0E0E0;
}
#artist_regist {
	border: none;
	box-shadow: 2px 2px 2px 2px #E0E0E0;
	background-color: #F6C4BC;
}
#add {
	border: none;
	box-shadow: 2px 2px 2px 2px #E0E0E0;
	background-color: #DF6E76;
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
					<img src='resources/image/upload/album/two.png'>&nbsp;앨범 등록
				</h3>

		</div>
		<div class="col-md-12">
			<br /> <br />
			<div class="jumbotron" id="pom">
				<form id="album" name="album" action="upload2" method="post" enctype="multipart/form-data"
					accept-charset="UTF-8">
					<!-- 아티스트 항목 값 -->
					<input type="hidden" name="artistName" id="artistName"
						value="${artistVO.artistName}" /> <input type="hidden"
						name="artistImg" id="artistImg" value="${artistVO.artistImg}" />
					<input type="hidden" name="artistType" id="artistType"
						value="${artistVO.artistType}" /> <input type="hidden"
						name="artistGenre" id="artistGenre"
						value="${artistVO.artistGenre}" /> <input type="hidden"
						name="artistNumber" id="artistNumber"
						value="${artistVO.artistNumber}" /> <input type="hidden"
						name="userNumber" id="userNumber" value="${artistVO.userNumber}" />

					<div id="upload_main">
						<!-- 앨범(이미지, 날짜, 아티스트 정보) 입력 start -->
						<div class="col-md-2 col-md-offset-1">
							<img src='resources/image/upload/album/album_image.PNG'
								width="150%"><br /> <br /> <input type="file"
								name="albumImg" id="albumImg" /><br /> <input type="date"
								class="form-control" name="albumDate" id="albumDate"
								style="width: 148%;"><br /> <br />
						</div>
						<!-- end -->
						<!-- 앨범(앨범명, 앨범종류, 장르, 설명, 곡 수 ) 입력 start  -->
						<div class="row">
							<div class="col-md-5 col-md-offset-1">
								<!-- 앨범명 입력  -->
								<label for="albumName" class="col-lg-4 control-label">앨범명</label>
								<div class="col-md-8">
									<input type="text" class="form-control" id="albumName"
										name="albumName" placeholder="앨범명"> <br />
								</div>
								<!-- 앨범 종류 입력 -->
								<label for="albumType" class="col-lg-4 control-label">앨범
									종류</label>
								<div class="col-md-8">
									<select class="form-control" id="albumType" name="albumType">
										<option>싱글</option>
										<option>미니</option>
										<option>정규</option>
									</select> <br />
								</div>
								<!-- 장르 입력 -->
								<label for="albumGenre" class="col-lg-4 control-label">장르</label>
								<div class="col-md-8">
									<select class="form-control" id="albumGenre" name="albumGenre">
										<option>발라드/댄스/팝</option>
										<option>일렉트로닉</option>
										<option>알앤비</option>
										<option>락/메탈</option>
										<option>재즈</option>
										<option>힙합</option>
										<option>인디</option>
									</select> <br />
								</div>
								<!-- 19세 여부 체크 -->
								<label for="albumContent" class="col-lg-4 control-label">
								<span style="text-decoration: underline;color:red">19세</span>&nbsp;제한
								</label>
								<div class="col-md-8">
									  <input type="checkbox" name="ageLimit" id="ageLimit"/>
									    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								</div>
								<br />
								<!-- 앨범에 대한 설명 입력 -->
								<label for="albumContent" class="col-lg-4 control-label">설명</label>
								<div class="col-lg-8">
									<textarea class="form-control" rows="6" cols="70"
										id="albumContent" name="albumContent"
										placeholder="앨범에 대한 설명을 적어주세요.">
								</textarea>
									<br />
								</div>
								<!-- 등록할 음원의 수 입력 -->
								<label for="counter" class="col-lg-4 control-label">곡의 수</label>
								<div class="col-md-3">
									<input type="text" class="form-control" id="counter"
										name="counter">
								</div>
								<div class="col-md-1" style="margin-left: 60px">
									<button class="btn btn-primary" id="add">추가</button>
								</div>
							</div>
						</div>
					</div>
					<!-- end -->
				</form>
			</div>
		</div>
	</div>
	<br />
	<br />
	<!--  footer start -->
	<%@include file="/WEB-INF/views/include/footer.jsp"%>
	<!--  end -->
</body>
</html>