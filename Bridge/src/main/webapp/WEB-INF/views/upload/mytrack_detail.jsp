<%--
작성자 - 이주연
내용 - 업로드 트랙 디테일
시작날짜 - 2016/07/17
수정날짜 - 2016/07/20
변경내용 - 
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@page import="java.util.Enumeration"%>
<!DOCTYPE html>
<html>
<head>
<link href="/resources/bootstrap/css/bootstrap.css" rel="stylesheet"
	type="text/css" />
<script src="/resources/bootstrap/js/jquery-2.2.3.min.js"></script>
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
<script src="/resources/bootstrap/css/bootstrap.css" type="text/css"></script>
<script>
	//아티스트 정보 페이지 	
	function fnResigter() {
		window.open("upload_artist", "",
				"width=500, height=400, scrollbars=yes");
	}
</script>
<style>
#pom {
	border-radius: 17px;
	background-color: #EDE6E6;
	box-shadow: 2px 2px 2px 2px #E0E0E0;
}
#update{
	border: none;
	background-color:orange ;
}
#delete{
	border: none;
	background-color:#D13838;
}
</style>
</head>
<body>
	<!-- header, sideber start -->
	<%@include file="/WEB-INF/views/include/header.jsp"%>
	<%@include file="/WEB-INF/views/include/sidebar.jsp"%>
	<!-- end -->
	<!-- 상단 tab start -->
	<div class="container">
		<br /> <br />
		<!-- 상단 tab start -->
		<div class="col-md-12">
			<ul class="nav nav-tabs">
				<li><a href="upload">업로드하기</a></li>
				<li class="active"><a href="mytrack">내 트랙</a></li>
			</ul>
			<!-- end -->
			<br /> <br />
			<div class="jumbotron" id="pom">
				<!-- 업로드 정보 입력  -->
				<div id="upload_main">
					<!-- 이미지, 날짜 입력 -->
					<div class="col-md-2">
						<a href="#album_del" data-toggle="modal">
						<img src="resources/image/upload/album/album_art.jpg"
							width="160px" id="album_check"></a> <br /> <br /> <input type="file"
							name="uploadimage" id="uploadimage" />
					</div>
					<br />

					<form class="form-horizontal" id="f" method="post">
						<fieldset>
							<div class="col-md-5 col-md-offset-1">
								<div class="form-group">
									<!-- 앨범명 입력  -->
									<label for="album" class="col-lg-4 control-label">앨범명</label>
									<div class="col-md-7">
										<input type="text" class="form-control" id="album"
											placeholder="앨범명" value="Why So Lonely">
									</div>
								</div>
								<div class="form-group">
									<!-- 앨범 종류 입력 -->
									<label for="kind" class="col-lg-4 control-label">앨범 종류</label>
									<div class="col-md-7">
										<select class="form-control" id="kind">
											<option>싱글</option>
											<option>미니</option>
											<option>정규</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<!-- 장르 입력 -->
									<label for="genre" class="col-lg-4 control-label">장르</label>
									<div class="col-md-7">
										<select class="form-control" id="genre">
											<option>발라드/댄스/팝</option>
											<option>일렉트로닉</option>
											<option>알앤비</option>
											<option>락/메탈</option>
											<option>재즈</option>
											<option>힙합</option>
											<option>인디</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<!-- 아티스트  정보 입력을 위한 버튼 -->
									<label class="col-lg-4 control-label">아티스트</label>
									<div class="col-md-7">
										<div class="btn-group btn-group-justified">
											<a href="#" class="btn btn-info" onclick="fnResigter()">입력</a>
										</div>
									</div>
								</div>
								<div class="form-group">
									<!-- 등록할 음원의 수 입력 -->
									<label for="counter" class="col-lg-4 control-label">곡의
										수</label>
									<div class="col-md-3">
										<input type="text" class="form-control" id="counter"
											name="counter" value="3">
									</div>
									<div class="col-md-2" style="margin-left: 20px">
										<button class="btn" id="add">추가</button>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<!-- 날짜  -->
									<label for="date" class="col-lg-2 control-label">날짜</label>
									<div class="col-md-8">
										<input type="date" class="form-control" id="date" value="2016-07-10">
									</div>
								</div>
								<div class="form-group">
									<!-- 앨범에 대한 설명 입력 -->
									<label for="description" class="col-lg-2 control-label">설명</label>
									<div class="col-lg-8">
										<textarea class="form-control" rows="8" cols="70"
											id="description" placeholder="앨범에 대한 설명을 적어주세요.">'Why So Lonely'는 원더걸스가 처음 시도하는 레게팝 장르의 곡으로, 중독성 있는 기타 리프와 다채로운 리듬의 변화에 따른 분위기의 전환이 매력적인 노래다.
								</textarea>
									</div>
								</div>
							</div>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
		<!-- end -->
		<br /> <br />
		<!-- 등록한 음원에 대한 정보 start -->
		<div class="container">
			<!-- 입력 후 음원 수  파일 업로드 -->
			<form class="form-horizontal" id="f" method="get" action="mytrack">
				<div class="container">
					<div class="col-md-12">
						<br /> <br /> <input type="hidden" id="cnt" name="cnt" value="" />
						<table class="table">
							<tr>
								<th width="5%"></th>
								<th width="20%">음원파일</th>
								<th width="8%"><div style="color: blue">타이틀</div></th>
								<th width="30%">곡</th>
								<th width="15%">뮤비</th>
								<th width="10%"><div style="color: red">&nbsp;&nbsp;&nbsp;&nbsp;19세</div></th>
							</tr>
							<tbody>
								<tr><td><input type="checkbox" name="check" id="check"></td>
									<td><input type="file" name="upFile1" id="upFile1" /></td>
									<td><button class="btn btn-xs">
											<span class="glyphicon glyphicon-star" style="color: blue"
												id="title1"></span>
										</button></td>
									<td><input type="text" name="song" id="song1"
										class="form-control" /></td>
									<td><input type="text" name="musicvideo1" id="musicvideo1"
										class="form-control" /></td>
									<td>&nbsp;&nbsp;&nbsp;
										<button class="btn btn-xs">
											<span class="glyphicon glyphicon-star-empty" id="limit1"></span>
										</button>
									</td>
								</tr>
								<tr><td><input type="checkbox" name="check" id="check"></td>
									<td><input type="file" name="upFile2" id="upFile2" /></td>
									<td><button class="btn btn-xs">
											<span class="glyphicon glyphicon-star" style="color: blue"
												id="title1"></span>
										</button></td>
									<td><input type="text" name="song2" id="song2"
										class="form-control" /></td>
									<td><input type="text" name="musicvideo2" id="musicvideo2"
										class="form-control" /></td>
									<td>&nbsp;&nbsp;&nbsp;
										<button class="btn btn-xs">
											<span class="glyphicon glyphicon-star-empty" id="limit2"></span>
										</button>
									</td>
								</tr>
								<tr><td><input type="checkbox" name="check" id="check"></td>
									<td><input type="file" name="upFile3" id="upFile3" /></td>
									<td><button class="btn btn-xs">
											<span class="glyphicon glyphicon-star" style="color: blue"
												id="title3"></span>
										</button></td>
									<td><input type="text" name="song3" id="song3"
										class="form-control" /></td>
									<td><input type="text" name="musicvideo3" id="musicvideo3"
										class="form-control" /></td>
									<td>&nbsp;&nbsp;&nbsp;
										<button class="btn btn-xs">
											<span class="glyphicon glyphicon-star-empty" id="limit3"></span>
										</button>
									</td>
								</tr>
							</tbody>
						</table>

						<!-- end -->

						<!-- 버튼 start -->
						<div align="center" style="margin-top: 90px">
							<div class="form-group">
								<button type="submit" class="btn btn-primary" id="update">수정</button>
								<button type="submit" class="btn btn-primary" id="delete">삭제</button>
								<button type="reset" class="btn btn-primary" id="cencle">취소</button>
							</div>
						</div>
					</div>
					<!-- end -->
				</div>
			</form>
		</div>
	</div>
	<!-- end -->
	
	<!-- 앨범 삭제 모달 start -->
	<div class="modal fade" id="album_del" tabindex="-1" role="dialog"
		aria-labelledby="edit" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
					</button>
					<h4 class="modal-title custom_align" id="Heading">다운로드</h4>
				</div>
				<div class="modal-body">삭제하시겠습니까?</div>
				<div class="modal-footer ">
					<button type="button" class="btn btn-success">
						<span class="glyphicon glyphicon-ok-sign"></span> Yes
					</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">
						<span class="glyphicon glyphicon-remove"></span> No
					</button>
				</div>
			</div>
		</div>	
	</div>
	<!-- end -->
	
</body>
</html>