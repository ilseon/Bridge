<%--
작성자 - 이주연
내용 - 업로드하기 페이지
시작날짜 - 2016/07/17
수정날짜 - 
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
		var cnt = 0;
		//음원의 수를 확인하는 jquery 
		$("#add").click(function() {
			if (!$("#counter").val()) {
				alert("등록할 음원의 수를 입력해주세요.");
				return false;
			} else if ($("#counter").val() >= 8) {
				alert("최대 7개까지 등록가능합니다.");
				return false;
			} else {
				alert("추가되었습니다.");
				cnt = $("#counter").val();
			}
		});

		//업로드시 빠지는 항목을 체크하는 jquery 
		$("#upload").click(function() {
			var cnt = $("#counter").val();
			if (!$("#album").val()) {
				alert("앨범명을 입력해주세요.");
				return false;
			} else if (!$("#uploadimage").val()) {
				alert("앨범이미지를 업로드해주세요.");
				return false;
			} else if (!$("#date").val()) {
				alert("날짜를 입력해주세요.");
				return false;
			} else if (!$("#counter").val()) {
				alert("등록할 음원의 수를 입력해주세요.");
				return false;
			} else if (!$("#description").val()) {
				alert("앨범에 대한 설명을 입력해주세요.");
				return false;
			} else if (!$("#mv").val()) {
				alert("뮤비 링크를 등록해주세요.");
				return false;
			}
			for (var i = 0; i < cnt; i++) {
				if (!$("#upFile" + i).val()) {
					alert(i + "번째 음원 파일을 업로드해주세요.");
					return false;
				} else if (!$("#song" + i).val()) {
					alert(i + "번째 곡 명을 입력해주세요.");
					return false;
				} else if ($("#title" + i).length() == 0) {
					alert("타이틀을 체크해주세요.");
					return false;
				}
			}
		});
	});

	//아티스트 정보 페이지 
	function fnResigter() {
		window.open("upload_artist", "",
				"width=500, height=400, scrollbars=yes");
	}
</script>
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
			<br /> <br />
			<!-- 이미지, 날짜 입력 -->
			<div class="col-md-2 col-md-offset-1">
				<img src='resources/image/upload/album/album_image.PNG' width="100%">
				<br /> <br /> <input type="file" name="uploadimage"
					id="uploadimage" /> <br /> <input type="date"
					class="form-control" id="date" placeholder="날짜">
			</div>
			<br />

			<form class="form-horizontal" id="f" method="post">
				<fieldset>
					<div class="col-md-5">
						<div class="form-group">
							<!-- 앨범명 입력  -->
							<label for="album" class="col-lg-4 control-label">앨범명</label>
							<div class="col-md-8">
								<input type="text" class="form-control" id="album"
									placeholder="앨범명" value="">
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
							<!-- 장르 입력 -->
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
							<!-- 아티스트  정보 입력을 위한 버튼 -->
							<label class="col-lg-4 control-label">아티스트</label>
							<div class="col-md-8">
								<div class="btn-group btn-group-justified">
									<a href="#" class="btn btn-info" onclick="fnResigter()">입력</a>
								</div>
							</div>
						</div>
						<div class="form-group">
							<!-- 등록할 음원의 수 입력 -->
							<label for="counter" class="col-lg-4 control-label">추가할
								곡의 수</label>
							<div class="col-md-5">
								<input type="text" class="form-control" id="counter"
									name="counter" value="">
							</div>
							<div class="col-md-3">
								<button class="btn" id="add">추가</button>
							</div>
						</div>
					</div>
					<div class="col-md-7">
						<div class="form-group">
							<!-- 앨범에 대한 설명 입력 -->
							<label for="description" class="col-lg-2 control-label">설명</label>
							<div class="col-lg-8">
								<textarea class="form-control" rows="8" cols="70"
									id="description" placeholder="앨범에 대한 설명을 적어주세요.">
								</textarea>
							</div>
						</div>
						<div class="form-group">
							<!-- 뮤비 링크 입력 -->
							<label for="mv" class="col-lg-2 control-label">뮤비</label>
							<div class="col-md-8">
								<input type="text" class="form-control" id="mv"
									placeholder="링크를 추가해주세요." value="" />
							</div>
						</div>
					</div>
				</fieldset>
			</form>
			<!-- end -->
			<br /> <br />

			<!-- 입력 후 음원 수  파일 업로드 -->
			<%
				int cnt = 0;
				if (request.getParameter("counter") != null) {
					cnt = Integer.parseInt(request.getParameter("counter"));
				}
			%>
			<form class="form-horizontal" id="f" method="get" action="mytrack">
				<div class="container">
					<br />
					<div class="col-md-10 col-md-offset-1">
						<input type="hidden" id="cnt" name="cnt" value="" />
						<table class="table">
							<tr>
								<th>음원파일</th>
								<th><div style="color: blue">타이틀</div></th>
								<th>곡</th>
								<th><div style="color: red">19세</div></th>
							</tr>
							<%
								if (cnt == 0) {
							%>
							<tr>
								<td colspan="9" style="text-align: center"><h5>
										<strong> <br />현재 등록된 곡이 없습니다.
										</strong>
									</h5></td>
							</tr>
							<%
								}
								for (int i = 0; i < cnt; i++) {
							%>
							<tbody>
								<tr>
									<td><input type="file" name="upFile<%=i%>"
										id="upFile<%=i%>" /></td>
									<td>&nbsp;&nbsp;&nbsp;<input
											type="checkbox" name="title" id="title<%=i%>"></td>
									<td><input type="text" name="song" id="song<%=i%>"
										class="form-control" /></td>
									<td>&nbsp;&nbsp;<a><i class="glyphicon glyphicon-ok-sign" id="limit<%=i%>"
										style="color:red"></i></a>
									</td>
								</tr>
								<%
									}
								%>
							</tbody>
						</table>

						<!-- end -->

						<!-- 버튼 start -->
						<div align="center" style="margin-top: 90px">
							<div class="form-group">
								<button type="submit" class="btn btn-primary" id="upload">업로드</button>
								<button type="reset" class="btn btn-default">취소</button>
							</div>
						</div>
					</div>
					<!-- end -->
				</div>
			</form>
		</div>
	</div>
	<br />
	<br />
	<!--  footer start -->
	<%@include file="/WEB-INF/views/include/footer.jsp"%>
	<!--  end -->
</body>
</html>