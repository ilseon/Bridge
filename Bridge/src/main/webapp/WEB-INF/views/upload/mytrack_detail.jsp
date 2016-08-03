<%--
작성자 - 이주연
내용 - 업로드 트랙 디테일
시작날짜 - 2016/07/17
수정날짜 - 2016/07/26
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
			
		//타입
		var type = $("#type").val();
		var typeArr = $("#albumType option");
		for (var i = 0; i < typeArr.length; i++) {
			if (typeArr.eq(i).text() == type) {
				$("#albumType option:eq(" + i + ")").prop("selected", true);
				break;
			}
		}	
		
		//장르
		var genre = $("#genre").val();
		var genreArr = $("#albumGenre option");
		for (var i = 0; i < genreArr.length; i++) {
			if (genreArr.eq(i).text() == genre) {
				$("#albumGenre option:eq(" + i + ")").prop(
						"selected", true);
				break;
			}
		}		
		
		var age  = $("#age").val();
		if(age == 1){
			$("#album input:radio[name=ageLimit]:radio[value='1']").prop("checked","checked");
		}else if(age = 0){
			//$("input:radio[name='ageLimit']:radio[value=0]").prop("checked", true);
			$("input:radio[name='ageLimit']:radio[value='0']").prop("checked","checked");
			//$("input:radio[name='satisfaction_score']:radio[value='5']").prop("checked",true);
		}
		
		// 삭제를 위한 jquery	
		$("#delBtn").click(function() {
			if ($("input:checked").length == 0) {
				alert("곡을 선택해주세요.");
			} else {
				alert("삭제되었습니다.");
			}
		});
		// 수정를 위한 jquery	
		$("#update").click(function() {
			if ($("input:checked").length == 0) {
				alert("곡을 선택해주세요.");
			} else {
				alert("수정되었습니다.");
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
	margin-top: 30px
}

#chp {
	margin-left: 80px;
}

#pom {
	border-radius: 17px;
	background-color: #EDE6E6;
	box-shadow: 2px 2px 2px 2px #E0E0E0;
}

#update {
	border: none;
	background-color: orange;
}

#delBtn {
	border: none;
	background-color: #D13838;
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
	color: white;
}

.table th {
	background-color: #ECA4A6;
	text-align: center;
	color: white;
}

.table td {
	text-align: center;
	background-color: white;
}

#btn {
	background-color: white;
}
</style>
</head>
<body style="margin-top: 4%;">
	<!-- header, sideber start -->
	<%@include file="/WEB-INF/views/include/header.jsp"%>
	<%@include file="/WEB-INF/views/include/sidebar.jsp"%>
	<!-- end -->
	<!-- 상단 tab start -->
	<div class="container">
		<!-- 상단 tab start -->
		<div class="container" style="margin-bottom: 150px">
			<div class="panel-heading col-md-2" id="tab">
				<h3 class="panel-title">내 트랙</h3>
			</div>
			<!-- end -->
			<div class="col-md-12">
				<form class="form-horizontal" id="album" method="post"
					enctype="multipart/form-data">
					<c:forEach var="list" items="${albumList}" begin="1" end="1">
						<br />
						<br />
						<div class="jumbotron" id="pom">
							<div id="upload_main">
								<div class="col-md-2 col-md-offset-1" id="chp">
									<a href="#album_del" data-toggle="modal"> <img
										src="upload/album/${list.albumImg}" width="160px"
										id="album_check"></a> <br /> <br /> <input type="file"
										name="albumImg" id="albumImg" /> <br />
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<!-- 앨범명 입력  -->
										<label for="album" class="col-lg-4 control-label">앨범명</label>
										<div class="col-md-7">
											<input type="text" class="form-control" id="albumName"
												name="albumName" value="${list.albumName}">
										</div>
									</div>
									<div class="form-group">
										<!-- 앨범 종류 입력 -->
										<label for="kind" class="col-lg-4 control-label">앨범 종류</label>
										<div class="col-md-7">
									<input type="hidden" id="type" name="type" value="${list.albumType}" />	
											<select class="form-control" id="albumType" name="albumType">
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
										<input type="hidden" id="genre" name="genre" value="${list.albumGenre}" />	
											<select class="form-control" id="albumGenre"
												name="albumGenre">
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
										<!-- 장르 입력 -->
										<label for="genre" class="col-lg-4 control-label">날짜</label>
										<div class="col-md-7">
											<input type="date" class="form-control" name="albumDate"
												id="albumDate" value="${list.albumDate}"><br />
										</div>
										<input type="hidden"  name="age"
											id="age" value="${list.ageLimit}"><br />
										<!-- 19세 여부 체크 -->
										<label for="ageLimit" class="col-lg-4 control-label">이용
											연령</label>
										<div class="col-md-8">
											&nbsp;모든 연령&nbsp;&nbsp;<input type="radio" id="ageLimit"
												name="ageLimit" value="0"/>&nbsp;&nbsp;<br />
											19세 이상 <input type="radio" id="ageLimit" name="ageLimit" value="1"/>
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</div>
									</div>
								</div>
								<div class="col-md-5">
									<div class="form-group">
										<!-- 앨범에 대한 설명 입력 -->
										<label for="description" class="col-lg-2 control-label">설명</label>
										<div class="col-lg-8">
											<textarea class="form-control" rows="10" cols="100"
												name="albumContent" id="albumContent">
												${list.albumContent}
											</textarea>
										</div>
									</div>
								</div>
							</div>
							<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />
							<br /> <br />
						</div>
					</c:forEach>
				</form>
				<br />
				<form class="form-horizontal" id="music" method="post"
					enctype="multipart/form-data">

					<table class="table">
						<tr>
							<th width="3%"><a href=""> <input type="hidden" id="del"
									name="del" value="${list.musicNumber}" /></a></th>
							<th width="6%">트랙</th>
							<th width="12%">음원 파일</th>
							<th width="8%">타이틀</th>
							<th width="23%">곡</th>
							<th width="1%"></th>
							<th width="19%">뮤비</th>
							<th width="1%"></th>
							<th width="35%">가사</th>
						</tr>
						<!-- 음원파일, 곡, 타이틀, 뮤비 -->
							<c:set var="j" value="0"></c:set>
							<c:forEach var="list" items="${musicList}" >
							<c:set var="j" value="${j+1}"></c:set>
							<tbody>
								<tr>
									<td><input type="checkbox" name="check" id="check"
										value="${list.musicNumber}"></td>
									<td><strong>${j}</strong></td>
									<td><input type="file" name="musicFile" id="musicFile"
										accept="audio/*" /><br />${list.musicFile}</td>
									<td><input type="checkbox" name="musicTitle"
										id="musicTitle" value="1"></td>
									<td><input type="text" name="musicSubject"
										id="musicSubject" class="form-control" width="20%"
										value="${list.musicSubject}" /></td>
									<td></td>
									<td><input type="text" name="musicVideo" id="musicVideo"
										class="form-control" value="${list.musicVideo}" /></td>
									<td></td>
									<td><textarea class="form-control" rows="4" cols="70"
											id="musicLyrics" name="musicLyrics">
												${list.musicLyrics}
										</textarea></td>
								</tr>
							</tbody>							
						</c:forEach>
					</table>
				</form>
			</div>


			<!-- end -->

			<!-- 버튼 start -->
			<div class="col-md-12">
				<div align="center" style="margin-top: 150px">
					<div class="form-group">
						<button type="submit" class="btn btn-primary" id="update">수정</button>
						<button type="submit" class="btn btn-primary" id="delBtn">삭제</button>
						<button type="reset" class="btn btn-primary" id="cencle"
							onclick="location.href='mytrack'">취소</button>
					</div>
				</div>
			</div>
		</div>
		<!-- end -->
	</div>
	<!-- end -->
</body>
</html>