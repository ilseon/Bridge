<%--
작성자 - 김민정
내용 - 페이지 위 노출
시작날짜 - 2016/07/19
수정날짜 - 2016/07/22
변경내용 - 헤더 디자인 및 로그인, 로그아웃 기능 완료
 --%>

 
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href="/resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
<script src="/resources/bootstrap/js/jquery-2.2.3.min.js"></script>
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>

<head>
<title>BRIDGE</title>
<link rel="shortcut icon" type="image/x-icon" href="/resources/image/favicon.ico" />
</head>


<style>
#fixed {
	height: 7%;
	width: 100%;
	font-size: 15px;
	top: 0px;
	left: 0px;
	background-color: white;
	position: fixed;
	z-index: 998;
}

.popover{
min-width: 530px;
min-height: 250px;
margin-bottom: 50px;
}

</style>

<script>
$(function(){
    $("#example-popover-2").popover({
        html : true,
        
        content: function() {
          return $("#example-popover-2-content").html();
        },

        title: function() {
          return $("#example-popover-2-title").html();
        }
    }); 
    
});

	function EmptyCheck() {
		if ($("#userId").val() == "" || $("#userPassword").val() == "" ) {
			alert("빈칸을 입력하세요.");		
			return false;
		}
		return true;
	}
</script>

<body style="margin-top: 4%;">
	<nav class="navbar navbar-default" id="fixed">
		<div class="container-fluid">
		
		<!-- 로고를 클릭시 메인으로 이동 -->
			<div class="navbar-header">	
				<a href="/">
				<img src="/resources/image/bridge.jpg"
					style="margin-top: 5px;" />
					</a>
			</div>

			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			
			<!-- 헤더 검색창부분 -->
				<form class="navbar-form  navbar-left " role="search" style="margin-left: 10%" action="headersearch" method="get">
				<input type="hidden" value="1" name="bno">
					<div class="form-group">
						<input type="text" class="btn search" style="border: 3px solid red; border-radius: 50px;" 
						name="headersearch" id="headersearch">
					</div>
					<input type="image" src="/resources/image/search.PNG" style="vertical-align: middle;" />
				</form>
				
			<!-- 아이디가 있을 경우와 없을 경우 드랍메뉴가 다름 : 로그인은 팝오버를 사용-->
				<c:choose>
				
					<c:when test="${(userid)==null}">
						<ul class="nav navbar-nav navbar-right" style="margin-right: 13%;">
							<li><a href="#" id="example-popover-2" data-placement="bottom" >로그인</a>
													
								<div id="example-popover-2-title" class="hidden" >로그인</div>
								<div id="example-popover-2-content" class="hidden">
									<div>
										<form class="form-horizontal" method="post" action="login" name="loginForm"  id="loginForm" onsubmit="return EmptyCheck()">
											<input type="hidden" value="login" name="cmd" />
											<div class="form-group ">
												<label for="inputEmail3" class="col-sm-2 control-label">아이디</label>
												<div class="col-sm-5">
													<input type="text" class="form-control " placeholder="id" name="userId" id="userId">
												</div>
												
											</div>

											<div class="form-group">
												<label for="inputPassword3" class="col-sm-2 control-label">비밀번호</label>
												<div class="col-sm-5">
													<input type="password" class="form-control"	placeholder="password" name="userPassword" id="userPassword">
												</div>
											</div>

											<div class="col-sm-offset-2 col-sm-11">
												<div>
													<a href="loginsearch">
													<label><button type="button" class="btn btn-link">아이디/비밀번호 찾기</button></label></a>
												</div>
												<input type="submit" class="btn btn-danger" value="아이디로 로그인"   />
											</div>
										</form>
									</div>
								</div>
		
								</li>
							<li><a href="user.add">회원가입</a></li>
						</ul>
					</c:when>

			
					<c:otherwise>
						<ul class="nav navbar-nav navbar-right " style="margin-right: 13%;">

							<li class="dropdown">
							<a href="#" class="dropdown-toggle"	data-toggle="dropdown" role="button" aria-expanded="false">${userid}
									<span class="caret"></span>
							</a>
								<ul class="dropdown-menu" role="menu">
									<li><a href="payment">결제내역</a></li>
									<li class="divider"></li>
									<li><a href="modify">정보관리</a></li>
									<li class="divider"></li>
									<li><a href="logout">로그아웃</a></li>
								</ul>
								</li>
						</ul>

					</c:otherwise>
				</c:choose>

			</div>
		</div>
	</nav>

</body>
</html>

