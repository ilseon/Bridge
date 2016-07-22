<%--
작성자 - 이주연
내용 - 업로드 1단계 페이지
시작날짜 - 2016/07/17
수정날짜 - 2016/07/20
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
<script>
	$(document).ready(function() {
		//숫자만 입력하는 jquery 
		$(function() {
			$('#counter').keyup(function() {
				$(this).val($(this).val().replace(/[^0-9]/g, ""));
			});
		});
		var cnt = 0;
		//음원의 수를 확인하는 jquery 
		$("#add").click(function() {
			if (!$("#albumname").val()) {
				alert("앨범명을 입력해주세요.");
				return false;
			} else if (!$("#albumimg").val()) {
				alert("앨범이미지를 업로드해주세요.");
				return false;
			} else if (!$("#albumdate").val()) {
				alert("날짜를 입력해주세요.");
				return false;
			} else if (!$("#albumcontent").val()) {
				alert("앨범에 대한 설명을 입력해주세요.");
				return false;
			} else if (!$("#counter").val()) {
				alert("등록할 음원의 수를 입력해주세요.");
				return false;
			} else if ($("#counter").val() <= 0) {
				alert("최소 0개 이상은 등록해야합니다.");
				return false;
			} else if ($("#counter").val() >= 8) {
				alert("8개 이상은 등록할 수 없습니다.");
				return false;
			} else {
				alert("추가되었습니다.");
				//cnt = $("#counter").val();
				$("#album").submit();
			}
		});
	});

	function fnResigter() {
		opener.document.f.value = null;

	}

	//아티스트 정보 페이지 
	function fnAristSubmit() {
		window.open("upload_artist", "",
				"width=500, height=400, scrollbars=yes");
	}
</script>
<style>
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
			<br />
			<div class="jumbotron" id="pom">
				<form id="album" name="album" action="upload" method="post" accept-charset="UTF-8">
					<!-- 아티스트 항목 값 -->
					<input type="hidden" name="artistname" id="artistname" value="${artistname}"/> 
					<input type="hidden" name="artistimg" id="artistimg" value="${artistimg}"/> 
					<input type="hidden" name="artisttype" id="artisttype" value="${artisttype}"/>
					<input type="hidden" name="artistgenre" id="artistgenre" value="${artistgenre}"/>
					<input type="hidden" name="usernumber" id="usernumber" value="${artistnumber}"/>

					<div id="upload_main">
						<br />
						<!-- 앨범(이미지, 날짜, 아티스트 정보) 입력 start -->
						<div class="col-md-2 col-md-offset-1">
							<img src='resources/image/upload/album/album_image.PNG'
								width="150%"><br /> <input type="file" name="albumimg"
								id="albumimg" /><br /> <input type="date" class="form-control"
								name="albumdate" id="albumdate" style="width: 148%;"><br />
							<!-- 아티스트  정보 입력 -->
							<div class="row">
								<label for="artist" class="control-label"
									style="margin-left: 18px">아티스트</label>
								<div class="btn-group btn-group-justified"
									style="width: 50%; margin-left: 114px; margin-top: -30px">
									<a href="#" class="btn btn-info" onclick="fnAristSubmit()"
										id="artist_regist">등록</a>
								</div>
							</div>
							<br /> <input type="hidden" name="artist_artistnumber"
								id="artist_artistnumber" value="1" />
						</div>
						<!-- end -->
						<!-- 앨범(앨범명, 앨범종류, 장르, 설명, 곡 수 ) 입력 start  -->
						<div class="row">
							<div class="col-md-5 col-md-offset-1">
								<!-- 앨범명 입력  -->
								<label for="albumname" class="col-lg-4 control-label">앨범명</label>
								<div class="col-md-8">
									<input type="text" class="form-control" id="albumname"
										name="albumName" placeholder="앨범명"> <br />
								</div>
								<!-- 앨범 종류 입력 -->
								<label for="albumtype" class="col-lg-4 control-label">앨범
									종류</label>
								<div class="col-md-8">
									<select class="form-control" id="albumtype" name="albumtype">
										<option>싱글</option>
										<option>미니</option>
										<option>정규</option>
									</select> <br />
								</div>
								<!-- 장르 입력 -->
								<label for="albumgenre" class="col-lg-4 control-label">장르</label>
								<div class="col-md-8">
									<select class="form-control" id="albumgenre" name="albumgenre">
										<option>발라드/댄스/팝</option>
										<option>일렉트로닉</option>
										<option>알앤비</option>
										<option>락/메탈</option>
										<option>재즈</option>
										<option>힙합</option>
										<option>인디</option>
									</select> <br />
								</div>
								<!-- 앨범에 대한 설명 입력 -->
								<label for="albumcontent" class="col-lg-4 control-label">설명</label>
								<div class="col-lg-8">
									<textarea class="form-control" rows="6" cols="70"
										id="albumcontent" name="albumcontent"
										placeholder="앨범에 대한 설명을 적어주세요.">
								</textarea>
									<br />
								</div>
								<!-- 등록할 음원의 수 입력 -->
								<label for="counter" class="col-lg-4 control-label">곡의 수</label>
								<div class="col-md-3">
									<input type="text" class="form-control" id="counter"
										name="counter" value="">
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