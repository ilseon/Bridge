
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="/resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
<script src="/resources/bootstrap/js/jquery-2.2.3.min.js"></script>
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>


<body>

	<!-- 전체 header -->
	<div class="col-md-12" style=" margin-bottom: 15px;" align="left"   >
		
		<!-- 왼쪽 로고 -->
		<img src="/resources/image/sample.PNG" align="left" style="height: 60px; width: 75px; " />

		<!-- 검색창 -->
		<div class="col-xs-6"  align="left" style="margin-top: 15px; margin-left: 175px;">	
			<input type="text" class="btn search" style="border: 3px solid red; border-radius:50px;"/>
			<input type="image" src="/resources/image/search.PNG"  style="vertical-align: middle; " />
		</div>
			
		
		<!-- 로그인 메뉴 -->
		<div class="col-xs-2 " align="right" style="margin-top: 20px;">
			<a href="#" data-toggle="modal" data-target="#login" style="color: black;">로그인 / </a> 
			<a href="#" style="color: black;">회원가입</a>
		</div>

		<!-- 로그인 모달 -->
		<div class="modal fade" id="login" role="dialog" style="height: 350px; width: 700px;">
		<div class="modal-header" style="background-color: white;">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">x</span>
			</button>
			<h4 class="modal-title">로그인</h4>
		</div>

		<div class="modal-body" style="background-color: white;">
			<div class="row ">
				<form class="form-horizontal" method="post" action="login">
					<input type="hidden" value="login" name="cmd" />
					<div class="form-group ">
						<label for="inputEmail3" class="col-sm-2 control-label">아이디</label>
						<div class="col-sm-5">
							<input type="text" class="form-control " placeholder="id"
								name="userid">
						</div>
					</div>

					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">비밀번호</label>
						<div class="col-sm-5">
							<input type="password" class="form-control"
								placeholder="password" name="userpassword">
						</div>
					</div>

					<div class="col-sm-offset-2 col-sm-11">
						<div>
							<label><button type="button" class="btn btn-link">아이디/비밀번호 찾기</button></label>
						</div>
						<input type="submit" class="btn btn-danger" value="아이디로 로그인" />

					</div>
				</form>
			</div>
		</div>

		<div class="modal-footer" style="background-color: white;">
			<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		</div>
		</div>
		<!-- 로그인 모달 끝 -->


	</div>


</body>
</html>

