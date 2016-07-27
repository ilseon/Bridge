<%--
작성자 - 이주연
내용 - 좋아하는 곡 페이지
시작날짜 - 2016/07/17
수정날짜 - 
변경내용 - 
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	$(document).ready(
			function() {
				// 체크박스 전체 선택/해제를 위한 jquery
				$("#allCheck").click(
						function() {
							if ($("#allCheck").is(":checked")) {
								$('input:checkbox[name=check]:not(checked)')
										.prop("checked", true);
							} else {
								$('input:checkbox[name=check]:checked').prop(
										"checked", false);
							}
						});
				// 추가를 위한 jquery	
				$("#add").click(function() {
					if ($("input:checked").length == 0) {
						alert("곡을 선택해주세요.");
					} else {
						alert("추가되었습니다.");
					}
				});
				// 담기를 위한 jquery	
				$("#put").click(function() {
					if ($("input:checked").length == 0) {
						alert("곡을 선택해주세요.");
					} else {
						alert("내 앨범에 담겼습니다.");
					}
				});
				//삭제를 위한 jquery				
				$("#del").click(function() {
					if ($("input:checked").length == 0) {
						alert("곡을 선택해주세요.");
					} else {
						alert("삭제되었습니다.");
					}
				});
				// 다운도르를 위한 jquery				
				$("#down").click(function() {
					if ($("input:checked").length == 0) {
						alert("곡을 선택해주세요.");
					} else {
						alert("다운로드되었습니다.");
					}
				});
				// 듣기를 위한 jquery	
				$("#listen").click(function() {
					if ($("input:checked").length == 0) {
						alert("곡을 선택해주세요.");
					} else {
						alert("플레이어됩니다.");
					}
				});
			});
	//한 곡에 대한 선택 사항 처리
	function PopupWindow() {
		window
				.open(
						"/player",
						"popup",
						"width=500, height=700, left=30, top=30, scrollbars=no,titlebar=no,status=no,resizable=no,fullscreen=no");
	}
</script>
<style>
#tab {
	border: none;
	background-color: #DF6E76;
	box-shadow: 2px 2px 2px 2px #E0E0E0;
	color: white;
	margin-top: 30px
}
</style>
<body style="margin-top: 4%;">
	<!-- header, sideber start -->
	<%@include file="/WEB-INF/views/include/header.jsp"%>
	<%@include file="/WEB-INF/views/include/sidebar.jsp"%>
	<!-- end -->

	<!-- 상단 tab start -->
	<div class="container" style="margin-bottom: 150px">
		<div class="panel-heading col-md-2" id="tab">
			<h3 class="panel-title">좋아하는 곡</h3>
		</div>
		<!-- end -->
		<!-- 좋아하는 곡 or 앨범인지 표시 start
		<div class="col-md-12">
		<br/><br/>
			<ul class="nav nav-tabs">
				<li class="active"><a href="like_song">곡</a></li>
				<li><a href="like_album">앨범</a></li>
			</ul>
			<br/>
		</div>  -->

		<!-- end -->
		<!-- 곡에 대한 정보 -->
		<div class="col-md-12">
		<br/><br/>
			<br> &nbsp;&nbsp;<input type="checkbox" id="allCheck">
			&nbsp;<button class="btn btn-default btn-md" id="listen">
				<span class="glyphicon glyphicon-play" style="color: red"></span>듣기
			</button>
			<button class="btn btn-default btn-md" id="add">
				<span class="glyphicon glyphicon-plus" style="color: green"></span>재생
				목록에 추가
			</button>
			<button class="btn btn-default btn-md" id="myalbum">
				<span class="glyphicon glyphicon-paste"></span>내 앨범에 담기
			</button>
			<button class="btn btn-default btn-md" id="del">
				<span class="glyphicon glyphicon-trash"></span>&nbsp;삭제
			</button>
			<button class="btn btn-default btn-md" id="all_listen">
				<span class="glyphicon glyphicon-play" style="color: red"></span>전체
				듣기
			</button>
			<br> <br>
			<table class="table">
				<tr>
					<th width="3%"></th>
					<th width="4%">번호</th>
					<th width="18%"></th>
					<th width="20%">곡</th>
					<th width="20%">아티스트</th>
					<th width="7%">듣기</th>
					<th width="8%">재생목록</th>
					<th width="7%">내앨범</th>
					<th width="7%">다운</th>
					<th width="7%">뮤비</th>
				</tr>

				<c:forEach begin="1" end="2" var="j">
					<tr>
						<td><input type="checkbox" name="check" id="check${j}"></td>
						<td>${j}</td>
						<td><a href="test"><img
								src="resources/image/like/like_album.jpg" width="70px" /></a></td>
						<td>Why</td>
						<td><a href="test2">태연</a></td>
						<td width="7%"><button class="btn btn-default btn-xs">
								<span class="glyphicon glyphicon-play" style="color: red"
									onclick="PopupWindow()"></span>
							</button></td>
						<td width="7%"><button class="btn btn-default btn-xs">
								<span class="glyphicon glyphicon-plus" style="color: green"></span>
							</button></td>
						<td width="7%"><button class="btn btn-default btn-xs"
								data-title="MyAlbum" data-toggle="modal" data-target="#MyAlbum">
								<span class="glyphicon glyphicon-paste"></span>
							</button></td>
						<td width="7%"><button class="btn btn-default btn-xs"
								data-title="Download" data-toggle="modal"
								data-target="#Download">
								<span class="glyphicon glyphicon-download-alt"></span>
							</button></td>
						<td width="7%"><button class="btn btn-default btn-xs">
								<span class="glyphicon glyphicon-play-circle"></span>
							</button></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<!-- end -->
	<br />
	<br />
	<!--  footer start -->
	<%@include file="/WEB-INF/views/include/footer.jsp"%>
	<!--  end -->
	<!-- 다운로드 모달창 시작 -->
	<div class="modal fade" id="Download" tabindex="-1" role="dialog"
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
				<div class="modal-body">다운받으시겠습니까?</div>
				<div class="modal-footer ">
					<button type="button" class="btn btn-success">
						<span class="glyphicon glyphicon-ok-sign"></span> Yes
					</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">
						<span class="glyphicon glyphicon-remove"></span> No
					</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- 다운로드 모달창  끝 -->



	<!-- 내 앨범 추가 모달 시작 -->
	<div class="modal fade" id="MyAlbum" tabindex="-1" role="dialog"
		aria-labelledby="edit" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
					</button>
					<h4 class="modal-title custom_align" id="Heading">내 앨범에 추가</h4>
				</div>
				<div class="modal-body">해당 곡을 내 앨범에 추가하시겠습니까?</div>
				<div class="modal-footer ">
					<button type="button" class="btn btn-success">
						<span class="glyphicon glyphicon-ok-sign"></span> Yes
					</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">
						<span class="glyphicon glyphicon-remove"></span> No
					</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- 내 앨범 추가 모달 끝 -->

</body>
</html>