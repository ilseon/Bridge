<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
<%
	pageContext.setAttribute("check_id", request.getAttribute("check_id"));
%>
$(document).ready(function(){
	$( "input[name='userpasswordcheck']" ).focusout(function(){
		if($( "input[name='userpassword']" ).val() != $( "input[name='userpasswordcheck']" ).val()){			
			$("#checkpassspan").text("불일치"+$( "input[name='userId']" ).val()).css("color","red");			
		}else{
			$("#checkpassspan").text("일치"+$( "input[name='userId']" ).val()).css("color","blue");			
		}
	});	
});

 $(document).ready(function(){
	$( "input[type=password]" ).focusin(function(){
		if( $("#id_c").val()==""){			
			alert("아이디를 입력해 주세요!");
			 $('#id_c').focus();
		}
	});	
});


	function fnSubmit(form){
		if($("input[type=text]").val()=="" || $("#checkpassspan").attr('style')=="color:red"){
			alert("모든 값을 바르게 입력해 주세요!");
			return false;
		}else{
			document.top.submit();
		}
	}
	
	function submitForm(form1){//모든 사항을 기입하지 않을 경우 경고창 띄우기
		var elements = form1.getElementsByTagName("input");
		var spans = form1.getElementsByTagName("span");
		for(var i=0;i<elements.length;i++){
			if(elements[i].value==""){
				alert("모든 사항을 기입해 주세요!");
				return false;
			}
		}
		
		for(var i = 0 ; i<spans.length;i++){
			var att = spans[i].getAttribute("style");
			if(att=="color: red;"){
				alert("적합하지 않은 값이 있습니다.");//모든 값들이 기준에 부합하는지 확인
				return false;
			}
		}
		form1.submit();
	}
	


function fnId_check(){
	var id_c = $( "input[name='id_c']" ).val();
	document.form_c.check.value=id_c;
	document.form_c.submit();
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
   <form action="user.add" method="get" name="form_c" id="form_c"><input type="hidden" id="check" name="check" value=""/></form>
	<form method="post" action="user.add"  id="top">
		<input type="hidden" value="register" name="cmd"  />
		<table class="table" id="content_table">
			<tr>
						<th>아이디</th>
						<td>
							<div class="col-sm-3">
								<input type="text" class="form-control" name="id_c" id="id_c" value="${check_id}" placeholder="id" onchange="fnId_check()"/>
							</div>	
							<div class="col-sm-3">
								<a href="id_check?userId=${check_id}"><input type="button" class="btn btn-default" id="dupliBtn" name="dupliBtn" value="중복검사"/></a>
							</div>
							<div style="color:red" id="idcheckdiv" name="idcheckdiv"><form:errors path="userVO"/><form:errors path="userVO.userId"/></div>
							<div style="color:blue"><form:errors path="userVO.userIdCheck"/></div>

						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td>
							<div class="col-sm-3">
								<input type="password" name="userpassword" id="userpassword" class="form-control" placeholder="Password"/>
							</div>
						</td>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<td>
							<div class="col-sm-3">
								<input type="password" name="userpasswordcheck" id="userpasswordcheck" class="form-control" placeholder="Password"/>
							</div>
							<span class="col-sm-3" id="checkpassspan">
								
							</span>
						</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>
							<div class="form-group">
								<div class="col-sm-3">
									<input type="text" class="form-control" name="userName" placeholder="이름">
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
								<input type="text" class="form-control " name="useremail1">
							</div>
							<div class="col-sm-2">
									<select class="form-control " name="useremail2" >
										<option>@naver.com</option>
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
									<input type="button" class="form-control" value="가입하기" id="submitBtn" name="submitBtn" onclick="submitForm(this.form)">
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
