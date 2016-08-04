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
		$(".btn-primary").on("click", function() {

			var birth = f.userBirthday.value;
			var birthday = birth.spilt("-");
			var year = birthday[0];
			var month = birthday[1];
			var day = birthday[2];
		
			document.f.year.value = year;
			document.f.month.value = month;
			$("#day").val() = day;
		
			
			var phone = f.userPhone.value;
			var userPhone = phone.spilt("-");
			var tel1 = userPhone[0];
			var tel2 = userPhone[1];
			var tel3 = userPhone[2];
			
			document.f.tel1.value = tel1;
			document.f.tel2.value = tel2;
			document.f.tel13.value = tel3;
			
			var email = f.userEmail.value;
			var userEmail = email.spilt("-");
			var useremail1 = userEmail[0];
			var useremail2 = userEmail[1];
			
			document.f.useremail1.value = useremail1;
			document.f.useremail2.value = useremail2;
			
			if (!$("#pw").val()) {
				alert("비밀번호를 입력해주세요.");
				return false;
			} else if (!$("#pw2").val()) {
				alert("다시 한번 비밀번호를 입력해주세요.");
				return false;
			} else if ($("#pw").val() != $("#pw2").val()) {
				alert("비밀번호가 일치하지 않습니다.");
				return false;
			} else if ($("#pw").val() != $("#pw2").val()) {
				alert("비밀번호가 일치하지 않습니다.");
				return false;
			} else if (!$("#tel").val()) {
				alert("전화번호를 입력해주세요.");
				return false;
			} else if (!$("#email").val()) {
				alert("이메일을 입력해주세요.");
				return false;
			} else {
				alert("수정되었습니다.");
				$("#f").submit();
				self.location = "/app/";
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
			<form class="form-horizontal" id="f" method="post">
				<table class="table" id="content_table">
					<c:forEach var="list" items="${userList}">
						<tr>
							<th>아이디</th>
							<td>
								<div class="col-md-3">
									<input type="text" class="form-control" name="userId"
										id="userId" value="${list.userId}">
								</div>

							</td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td>
								<div class="col-md-3">
									<input type="password" name="userPassword" id="userPassword"
										class="form-control">
								</div>
							</td>
						</tr>
						<tr>
							<th>비밀번호 확인</th>
							<td>
								<div class="col-md-3">
									<input type="password" name="userpasswordcheck"
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
											name="userName" value="${list.userName}">
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<th>생년월일</th>
							<td>
								<div class="form-group">
									<input type="text" id="userBirthday" name="userBirthday"
										value="${list.userBirthday}" />
									<div class="col-md-2">
										<select class="form-control" name="year" id="year">
											<c:forEach begin="1900" end="2016" step="1" var="i">
												<option></option>
											</c:forEach>
										</select>
									</div>
									<div class="col-md-2">
										<select class="form-control" name="month" id="month">
											<c:forEach begin="1" end="12" step="1" var="i">
												<option></option>
											</c:forEach>
										</select>
									</div>
									<div class="col-md-2">
										<select class="form-control" name="day" id="day">
											<c:forEach begin="1" end="31" step="1" var="i">
												<option></option>
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
									<input type="text" id="userPhone" name="userPhone"
										value="${list.userPhone}" />
									<div class="col-md-2">
										<select class="form-control " id="tell" name="tel1">
											<option>010</option>
											<option>070</option>
											<option>02</option>
											<option>080</option>
											<option>060</option>
										</select>
									</div>
									<div class="col-md-2">
										<input type="text" class="form-control " id="tel2" name="tel2">
									</div>
									<div class="col-md-2">
										<input type="text" class="form-control" id="tel2" name="tel3">
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<th>이메일 주소</th>
							<td><input type="text" id="userEmail" name="userEmail"
								value="${list.userEmail}" />
								<div class="col-md-3">
									<input type="text" class="form-control " id="useremail1"
										name="useremail1">
								</div>
								<div class="col-md-3">
									<select class="form-control" id="useremail2" name="useremail2">
										<option>@naver</option>
										<option>@duam.net</option>
										<option>@gmail.com</option>
										<option>@dreamwiz.com</option>

									</select>
								</div></td>
						</tr>
					</c:forEach>
				</table>
			</form>
		</div>
		<!-- end -->
		<!-- 버튼 start -->
		<div class="col-md-12">
			<div align="center" style="margin-top: 80px">
				<div class="form-group">
					<button type="submit" class="btn btn-primary" >확인</button>
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