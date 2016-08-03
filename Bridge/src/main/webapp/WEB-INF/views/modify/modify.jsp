<%--
작성자 - 이주연
내용 - 개인정보변경 페이지
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
	//정보수정에 대한 항목 입력을 확인하는 jquery 
	$(document).ready(function() {
		//년도
		var year = $("#useryear").val();
		var yearArr = $("#year option");
		for (var i = 0; i < yearArr.length; i++) {
			if (yearArr.eq(i).text() == year) {
				$("#year option:eq(" + i + ")").prop("selected", true);
				break;
			}
		}

		//월
		var monthArr = $("#month option");
		var month = $("#usermonth").val();
		if (month < 10) {
			for (var i = 0; i < monthArr.length; i++) {
				if (0 + monthArr.eq(i).text() == month) {
					$("#month option:eq(" + i + ")").prop("selected", true);
					break;
				}
			}
		} else if (month >= 10) {
			for (var i = 0; i < monthArr.length; i++) {
				if (monthArr.eq(i).text() == month) {
					$("#month option:eq(" + i + ")").prop("selected", true);
					break;
				}
			}
		}

		//일
		var dayArr = $("#day option");
		var day = $("#userday").val();
		if (day < 10) {
			for (var i = 0; i <dayArr.length; i++) {
				if (0 + dayArr.eq(i).text() == day) {
					$("#day option:eq(" + i + ")").prop("selected", true);
					break;
				}
			}
		} else if (day >= 10) {
			for (var i = 0; i <dayArr.length; i++) {
				if (dayArr.eq(i).text() == day) {
					$("#day option:eq(" + i + ")").prop("selected", true);
					break;
				}
			}
		}

		//번호 앞자리
		var tel1 = $("#userPhone").val();
		var telArr = $("#tel1 option");
		for (var i = 0; i < telArr.length; i++) {
			if (telArr.eq(i).text() == tel1) {
				$("#tel1 option:eq(" + i + ")").prop("selected", true);
				break;
			}
		}
		//이메일
		var email = $("#userEmail").val();
		var emailArr = $("#useremail2 option");
		for (var i = 0; i < emailArr.length; i++) {
			if (emailArr.eq(i).text() == email) {
				$("#useremail2 option:eq(" + i + ")").prop("selected", true);
				break;
			}
		}

		$(".btn-primary").on("click", function() {
			if (!$("#userPassword").val()) {
				alert("비밀번호를 입력해주세요.");
				return false;
			} else if (!$("#PwCheck").val()) {
				alert("다시 한번 비밀번호를 입력해주세요.");
				return false;
			} else if ($("#userPassword").val() != $("#PwCheck").val()) {
				alert("비밀번호가 일치하지 않습니다.");
				return false;
			} else if (!$("#tel2").val() || !$("#tel3").val()) {
				alert("전화번호를 입력해주세요.");
				return false;
			} else if (!$("#useremail1").val()) {
				alert("이메일을 입력해주세요.");
				return false;
			} else {
				alert("수정되었습니다.");
				$("#f").submit();
			}
		});
	});
</script>
<style>
#main {
	margin-bottom: 150px;
}
</style>
</head>
<body style="margin-top: 4%;">
	<!-- header, sideber start -->
	<%@include file="/WEB-INF/views/include/header.jsp"%>
	<%@include file="/WEB-INF/views/include/sidebar.jsp"%>
	<!-- end -->

	<!-- 상단 tab start-->
	<div class="container" id="main">
		<br /> <br />
		<div class="col-md-12">
			<ul class="nav nav-tabs">
				<li class="active"><a href="modify">개인정보변경</a></li>
				<li><a href="withdrawal">회원탈퇴</a></li>
			</ul>
		</div>
		<!-- end -->

		<!-- 첫 번째 블럭(개인정보수정) start -->
		<div class="col-md-10 col-md-offset-1">
			<br /> <br />
			<h5>
				<strong>가입시 등록한 정보입니다.</strong>
			</h5>
			<br /> <br />
			<form class="form-horizontal" id="f" method="post" action="modifyComfirm">
				<table class="table" id="content_table">
					<tr>
						<th>아이디</th>
						<td>
							<div class="col-md-3">
								<input type="text" class="form-control" name="userId"
									id="userId" value="${user.userId}" readonly="readonly">
							</div>

						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td>
							<div class="col-md-3"> <input type="password"
									name="userPassword" id="userPassword" class="form-control">
							</div>
						</td>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<td>
							<div class="col-md-3">
								<input type="password" name="PwCheck" id="PwCheck"
									class="form-control">
							</div>
						</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>
							<div class="form-group">
								<div class="col-md-3">
									<input type="text" class="form-control" id="userName"
										name="userName" value="${user.userName}" readonly="readonly">
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td>
							<div class="form-group">
								<div class="col-md-2">
									<input type="hidden" id="useryear" name="useryear"
										value="${user.year}" /> <select class="form-control"
										name="year" id="year" disabled="disabled">
										<c:forEach begin="1900" end="2016" step="1" var="i">
											<option>${i}</option>
										</c:forEach>
									</select>
								</div>
								<div class="col-md-2">
									<input type="hidden" id="usermonth" name="usermonth"
										value="${user.month}" /> <select class="form-control"
										name="month" id="month" disabled="disabled">
										<c:forEach begin="1" end="12" step="1" var="i">
											<option>${i}</option>
										</c:forEach>
									</select>
								</div>
								<div class="col-md-2">
									<input type="hidden" id="userday" name="userday"
										value="${user.day}" /> <select class="form-control"
										name="day" id="day" disabled="disabled">
										<c:forEach begin="1" end="31" step="1" var="i">
											<option>${i}</option>
										</c:forEach>
									</select>
								</div>
							</div>
						</td>
					</tr>


					<tr>
						<th>휴대폰 번호</th>
						<td>
							<div class="form-group">
								<input type="hidden" id="userPhone" name="userPhone"
									value="${user.tel1}" />
								<div class="col-md-2">
									<select class="form-control " id="tel1" name="tel1">
										<option>070</option>
										<option>010</option>
										<option>02</option>
										<option>080</option>
										<option>060</option>
									</select>
								</div>
								<div class="col-md-2">
									<input type="text" class="form-control " id="tel2" name="tel2"
										value="${user.tel2}">
								</div>
								<div class="col-md-2">
									<input type="text" class="form-control" id="tel3" name="tel3"
										value="${user.tel3}">
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th>이메일 주소</th>
						<td>
							<div class="col-md-3">
								<input type="text" class="form-control " id="useremail1"
									name="useremail1" value="${user.useremail1}">
							</div>
							<div class="col-md-3">
								<input type="hidden" id="userEmail" name="userEmail"
									value="${user.useremail2}" /> <select class="form-control"
									id="useremail2" name="useremail2">
									<option>@duam.net</option>
									<option>@naver.com</option>
									<option>@gmail.com</option>
									<option>@dreamwiz.com</option>
								</select>
							</div>
						</td>
					</tr>
				</table>
			</form>
		</div>
		<!-- end -->
		<!-- 버튼 start -->
		<div class="col-md-12">
			<div align="center" style="margin-top: 80px">
				<div class="form-group">
					<button type="submit" class="btn btn-primary">확인</button>
					<button type="reset" class="btn btn-default">취소</button>
				</div>
			</div>
		</div>
		<!-- end -->
	</div>
	<!-- end -->
	<br />
	<br />
	<!--  footer start -->
	<%@include file="/WEB-INF/views/include/footer.jsp"%>
	<!--  end -->
</body>
</html>