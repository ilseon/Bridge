<%--
작성자 - 이주연
내용 - 업로드한 내 트랙 페이지
시작날짜 - 2016/07/17
수정날짜 - 
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
	$(document).ready(function() {
		$(".btn").on("click", function() {
			if ($("#checkdel:checked").length > 0) {
				$("#del").click(function() {
					alert("삭제되었습니다.");
				});
			} else {
				alert("앨범을 선택해주세요.");
			}
		});
	});
	//아티스트 정보 페이지 	
	function fnResigter() {
		window.open("upload_artist", "",
				"width=500, height=400, scrollbars=yes");
	}
</script>
</head>
<body>
	<!-- header, sideber start -->
	<%@include file="/WEB-INF/views/include/header.jsp"%>
	<%@include file="/WEB-INF/views/include/sidebar.jsp"%>
	<!-- end -->
	<!-- 상단 tab start -->
	<div class="container">
		<br /> <br />
		<div class="col-md-12">
			<ul class="nav nav-tabs">
				<li><a href="upload">업로드하기</a></li>
				<li class="active"><a href="/app/uplaod/upload_2">내 트랙</a></li>
			</ul>
			<!-- 삭제 button -->
			<div align="right" style="margin-top: -40px">
				<button class="btn btn-default btn-md" id="del">
					<span class="glyphicon glyphicon-trash"></span>&nbsp;삭제
				</button>
			</div>
			<!-- end -->
			<br /> <br />
			<!-- 이미지, 날짜 입력 -->
			<div class="col-md-3 col-md-offset-1">
				<div class="form-group">
					<input type="checkbox" name="check" id="checkdel" />&nbsp;&nbsp;
					&nbsp;&nbsp;<a href="test2"><img
						src='resources/image/upload/album/album_art.jpg' width="65%">
					</a><br /> <br /> <input type="file" name="uploadimage"
						id="uploadimage" style="margin-left: 35px" /><br /> <input
						type="date" class="form-control" id="date" placeholder="날짜"
						style="width: 70%; margin-left: 35px">
				</div>
			</div>
			<br />

			<!-- 앨범명, 장르, 아티스트, 음원 추가, 앨범설명, 뮤비링크   -->
			<form class="form-horizontal">
				<fieldset>
					<div class="col-md-5">
						<div class="form-group">
							<label for="album" class="col-lg-4 control-label">앨범명</label>
							<div class="col-md-8">
								<input type="text" class="form-control" id="album"
									placeholder="앨범명" value="Why So Lonely">
							</div>
						</div>
						<div class="form-group">
							<!-- 앨범 종류 입력 -->
							<label for="kind" class="col-lg-4 control-label">앨범 종류</label>
							<div class="col-md-8">
								<select class="form-control" id="kind">
									<option>싱글</option>
									<option>미니</option>
									<option>정규</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="genre" class="col-lg-4 control-label">장르</label>
							<div class="col-md-8">
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
							<label class="col-lg-4 control-label">아티스트</label>
							<div class="col-md-8">
								<div class="btn-group btn-group-justified">
									<a href="#" class="btn btn-info" onclick="fnResigter()">원더걸스</a>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="counter" class="col-lg-4 control-label">음원의 수</label>
							<div class="col-md-5">
								<input type="text" class="form-control" id="counter"
									name="counter" placeholder="1" value="3">
							</div>
							<div class="col-md-3">
								<button class="btn">확인</button>
							</div>
						</div>
					</div>
					<div class="col-md-7">
						<div class="form-group">
							<label for="description" class="col-lg-2 control-label">설명</label>
							<div class="col-lg-8">
								<textarea class="form-control" rows="8" cols="70"
									id="description" placeholder="앨범에 대한 설명을 적어주세요.">'Why So Lonely'는 원더걸스가 처음 시도하는 레게팝 장르의 곡으로, 중독성 있는 기타 리프와 다채로운 리듬의 변화에 따른 분위기의 전환이 매력적인 노래다.
								</textarea>
							</div>
						</div>
						<div class="form-group">
							<label for="mv" class="col-lg-2 control-label">뮤비</label>
							<div class="col-md-8">
								<input type="text" class="form-control" id="mv"
									placeholder="링크를 추가해주세요."
									value="https://www.youtube.com/watch?v=PYGODWJgR-c" />
							</div>
						</div>
					</div>
				</fieldset>
			</form>

			<!-- end -->
			<br /> <br />

			<!-- 등록한 음원에 대한 정보 start -->
			<div class="container">
				<br />
				<div class="col-md-10 col-md-offset-1">
					<table class="table">
						<tr>
							<th>음원</th>
							<th><div style="color: blue">타이틀</div></th>
							<th>곡</th>
							<th><div style="color: red">19</div></th>
						</tr>
						<tbody>
							<c:forEach begin="1" end="1" step="1">
								<tr>
									<td><input type="file" name="upFile1" id="upFile" value="" /></td>
									<td><label style="float: left"> <input
											type="checkbox" name="title" checked="checked" />
									</label></td>
									<td><input type="text" name="song" id="song"
										value="Why So Lonely" class="form-control" /></td>
									<td>&nbsp;&nbsp;<a><i
											class="glyphicon glyphicon-ok-sign" style="color: red"></i></a></td>
								</tr>
								<tr>
									<td><input type="file" name="upFile2" id="upFile" /></td>
									<td><label style="float: left"> <input
											type="checkbox" name="title" />
									</label></td>
									<td><input type="text" name="song" id="song"
										value="아름다운 그대에게" class="form-control" /></td>
									<td>&nbsp;&nbsp;<a><i
											class="glyphicon glyphicon-ok-sign" style="color: red"></i></a></td>
								</tr>
								<tr>
									<td><input type="file" name="upFile3" id="upFile" /></td>
									<td><label style="float: left"> <input
											type="checkbox" name="title" />
									</label></td>
									<td><input type="text" name="song" id="song"
										value="Sweet & Easy" class="form-control" /></td>
									<td>&nbsp;&nbsp;<a><i
											class="glyphicon glyphicon-ok-sign" style="color: red"></i></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<!-- end -->
		</div>
	</div>
</body>
</html>