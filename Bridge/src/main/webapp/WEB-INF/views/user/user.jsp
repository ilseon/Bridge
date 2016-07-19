
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8"%>


<jsp:include page="../include/header.jsp" />
<link rel="stylesheet"
   href="">


<script src="../bootstrap/js/jquery-2.2.3.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
<!DOCTYPE html>
<html>
<head>
<title>회원가입</title>
</head>
<link href="/resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
<body>
<div class="container" align="center">
   <div class="row">
      <div class="col-md-10">
         <div class="navbar navbar-fixed" align="center"
            style="margin-bottom: 50px">
            <h3>회원가입</h3>
         </div>
      </div>
   </div>
   <div class="row" >
	<form method="post" action=""  id="top">

		<input type="hidden" value="register" name="cmd"  />
		<table class="table" id="content_table">

			<tr>
						<th>아이디</th>
						<td>
							<div class="col-sm-5">
								<input type="text" class="form-control" name="userid" id="userid" placeholder="id">
							</div>	
							<div class="col-sm-3">
								<input type="button" id="dupliBtn" value="중복검사"> 
							</div>
							<div class="col-sm-3" id="checkspan">
								
							</div>
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td>
							<div class="col-sm-5">
								<input type="password" name="userpassword" class="form-control" placeholder="Password">
							</div>
						</td>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<td>
							<div class="col-sm-5">
								<input type="password" name="userpasswordcheck" class="form-control" placeholder="Password">
							</div>
							<div class="col-sm-3" id="checkpassspan">
								
							</div>
						</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>
							<div class="form-group">
								<div class="col-sm-5">
									<input type="text" class="form-control" name="username" placeholder="이름">
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
							<div class="col-sm-5">
								<input type="email" class="form-control " name="useremail">
							</div>
							<div class="col-sm-2">
									<select class="form-control " name="tel1" >
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
									<input type="button" class="form-control" value="가입하기" id="submitBtn">
								</div>
								<div class="col-sm-3">
									<input type="button" class="form-control" value="취소" onclick="location.href=history.back()">
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
