<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<link href="/resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
<script src="/resources/bootstrap/js/jquery-2.2.3.min.js"></script>

<head>
<title>회원가입</title>
</head>

<jsp:include page="../include/header.jsp" />
<jsp:include page="../include/sidebar.jsp" />
<link href="/resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />

<body style="margin-top: 4%;">

<spring:hasBindErrors name="userVO"/>
<form:errors name="userVO"/>

<script>
 function fnPassRight(){
	
	if($( "#userpassword" ).val() != $( "#userpasswordcheck" ).val()){	
	
		$("#checkpassspan").text("일치하지않는 비빌번호입니다");			
	}else{
		$("#checkpassspan").text("비밀번호가일치합니다");			
	}
} 
 
 function fnId_check(){
	 $.get("/id_check?userId="+$('#userId').val());
 }
	</script>
	
<div class="container" align="center">
   <div class="row">
      <div class="col-md-9">
         <div class="navbar navbar-fixed" align="center"
            style="margin-bottom: 50px">
            <h3>회원가입</h3>
         </div>
      </div>
  <!--  </div>
   <div class="row" > -->
	<form method="post" action="user.add"  id="top" accept-charset="utf-8">
		<input type="hidden" value="register" name="cmd"  />
		<table class="table" id="content_table">
			<tr>
						<th>아이디</th>
						<td>
							<div class="col-sm-3">
								<input type="text" class="form-control" name="userId" id="userId" placeholder="id">
							</div>	
							<div class="col-sm-3">
								<input type="button" id="dupliBtn" onclick="fnId_check()"value="중복 검사">
							</div>
							<div style="color:red" class="col-sm-3" id="checkspan">
								<form:errors path="userVO.userId"/>
							</div>
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td>
							<div class="col-sm-3">
								<input type="password" name="userPassword" id="userpassword" class="form-control" placeholder="Password" >
								
							</div>
						</td>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<td>
							<div class="col-sm-3">
								<input type="password" name="userpasswordcheck" id="userpasswordcheck" onchange="fnPassRight()" class="form-control" placeholder="Password">
							</div>
							<div class="col-sm-3" id="checkpassspan">
								
							</div>
						</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>
							<div class="form-group">
								<div class="col-sm-3">
									<input type="text" class="form-control" name="userName" id="userName" placeholder="이름">
								</div>								
							</div>
						</td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td>
							<div class="form-group">
								<div class="col-sm-2">
									<select class="form-control" name="year">
										<c:forEach begin="1900" end="2016" step="1" var="i">
											<option>${1900+2016-i}</option>
										</c:forEach>
									</select>
								</div>
								<div class="col-sm-2">
									<select class="form-control" name="month">
										<c:forEach begin="1" end="12" step="1" var="i">
											<option>${i}</option>
										</c:forEach>
									</select>
								</div>
								<div class="col-sm-2">
									<select class="form-control" name="day">
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
								<div class="col-sm-2">
									<select class="form-control " name="tel1" >
										<option>010</option>
										<option>070</option>
										<option>02</option>
										<option>080</option>
										<option>060</option>
									</select>
								</div>
								<div class="col-sm-2">
									<input type="text" class="form-control " name="tel2">
								</div>
								<div class="col-sm-2">
									<input type="text" class="form-control" name="tel3">
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th>이메일 주소</th>
						<td>
							<div class="col-sm-3">
								<input type="text" class="form-control " name="useremail1" id="useremail1">
							</div>
							<div class="col-sm-2">
									<select class="form-control " name="useremail2" >
										<option>@naver</option>
										<option>@duam.net</option>
										<option>@gmail.com</option>
										<option>@dreamwiz.com</option>
										
									</select>
								</div>
								
						</td>
					</tr>
					
					
					<tr>
						<td colspan="2">
							<div class="form-group">
								<div class="col-sm-3 col-md-offset-3">
									<input type="submit" class="form-control" value="가입하기" id="submitBtn">
								</div>
								<div class="col-sm-3">
									<input type="reset" class="form-control" value="취소" onclick="location.href=history.back()">
								</div>
							</div>
						</td>
					</tr>
		</table>
		</form>
	</div>
</div>
<jsp:include page="../include/footer.jsp" />
</body>
</html>
