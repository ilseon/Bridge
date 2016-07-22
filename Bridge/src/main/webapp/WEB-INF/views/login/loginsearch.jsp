<%--
작성자 - 김민정
내용 - 아이디/비밀번호 찾기 페이지
시작날짜 - 2016/07/19
수정날짜 - 
변경내용 - 
 --%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href="/resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
<script src="/resources/bootstrap/js/jquery-2.2.3.min.js"></script>
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>


<body style="margin-top: 4%;">

	<%@include file="../include/header.jsp"%>
	<%@include file="../include/sidebar.jsp"%>

	<div class="container">
		<div class="row">
		<!-- 아이디 찾기 부분 -->
			<div class="col-sm-5" style="border: 1px solid #BDBDBD; margin-bottom: 50px; margin-right: 6%;">
				<h4 style="margin-bottom: 10%;">아이디 찾기</h4>

				<form class="form-horizontal" method="POST" action="searchid">

					<div class="form-group">
						<span class="glyphicon glyphicon-ok" style="color: red"></span> <label
							for="inputEmail3" class="col-sm-3 control-label">이름</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="userName">
						</div>
					</div>

					<div class="form-group">
						<span class="glyphicon glyphicon-ok" style="color: red"></span> <label
							for="inputEmail3" class="col-sm-3 control-label">생년월일</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="userBirthday" />
						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-12" style="margin-left: 35%;">
							<input type="submit" class="btn btn-danger" value="아이디 찾기" />
						</div>
					</div>

					<div>당신의 아이디는 ${usersearchid } 입니다 ! </div>

				</form>




			</div>
			<!-- 아이디 찾기 부분 끝 -->
			
			<!-- 비밀번호 찾기 부분 -->
			<div class="col-sm-5" style="border: 1px solid #BDBDBD; margin-bottom: 50px;">
				<h4 style="margin-bottom: 10%;">비밀번호 찾기</h4>
				
				<form class="form-horizontal" method="POST">

					<div class="form-group">
						<span class="glyphicon glyphicon-ok" style="color: red"></span> <label
							for="inputEmail3" class="col-sm-3 control-label">아이디</label>
						<div class="col-sm-6">
							<input type="email" class="form-control" id="id">
						</div>
					</div>

					<div class="form-group">
						<span class="glyphicon glyphicon-ok" style="color: red"></span> <label
							for="inputEmail3" class="col-sm-3 control-label">이메일</label>
						<div class="col-sm-6">
							<input type="email" class="form-control" id="email" />
						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-12" style="margin-left: 22%;">
							<input type="submit" class="btn btn-danger" value="비밀번호 찾기 (이메일로 보내기)" />
						</div>
					</div>

					<div>당신의 비밀번호는 - 입니다 !</div>



				</form>
				
				
			</div>
			<!-- 비밀번호 찾기 부분 끝 -->
			
		</div>
	</div>









	<%@include file="../include/footer.jsp"%>

</body>