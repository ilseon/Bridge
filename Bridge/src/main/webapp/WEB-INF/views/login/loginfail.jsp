<%--
작성자 - 김민정
내용 - 로그인 실패 페이지
시작날짜 - 2016/07/27
수정날짜 - 
변경내용 - 
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href="/resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
<script src="/resources/bootstrap/js/jquery-2.2.3.min.js"></script>
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>


<script>
   function EmptyCheckTest() {
       if ($("#userIdTest").val() == ""  ) {
    	  $("#userPasswordTest1").append("");
         $("#userIdTest1").append("아이디를 입력해주세요" );         
         return false;
      }      
      else if($("#userPasswordTest").val() == ""){
    	  $("#userIdTest1").append("");
         $("#userPasswordTest1").append("비밀번호를 입력해주세요" );   
         return false;      
      }
      return true;
   }
      
</script>

<body style="margin-top: 4%;">

   <%@include file="../include/header.jsp"%>
   <%@include file="../include/sidebar.jsp"%>

   <div class="container">
      <div class="row">

         <div class="col-sm-11"   style="border: 1px solid #BDBDBD; margin-bottom: 50px; margin-right: 6%;">
            <img src="/resources/image/sample.PNG" style="margin-top: 3%; margin-left: 50%; margin-bottom: 3%;" />

            <form class="form-horizontal" method="post" action="login" name="loginForm" id="loginForm" onsubmit="return EmptyCheckTest()" style="margin-left: 27%;">
               <input type="hidden" value="login" name="cmd" />
               <div class="form-group ">
                  <label for="inputEmail3" class="col-sm-2 control-label">아이디</label>
                  <div class="col-sm-5">
                     <input type="text" class="form-control " placeholder="id"   name="userId" id="userIdTest">
                  </div>
                  </div>


            <p style="margin-left: 18%; margin-bottom: 2%; color: red;" id="userIdTest1"></p>



               <div class="form-group">
                  <label for="inputPassword3" class="col-sm-2 control-label">비밀번호</label>
                  <div class="col-sm-5">
                     <input type="password" class="form-control"   placeholder="password" name="userPassword" id="userPasswordTest">
                  </div>
               </div>
               
               <p style="margin-left: 18%; margin-bottom: 2%; color: red;" id="userPasswordTest1"></p>


               <c:choose>
                  <c:when test="${(loginmsg)==1}">
                     <div style="margin-left: 18%; margin-bottom: 1%;">
                     로그인에 실패하셨습니다. 다시한번 확인해주세요</div>
                  </c:when>
               </c:choose>




               <div class="col-sm-offset-2 col-sm-11">
                  <div>
                     <a href="loginsearch"><label><button type="button"   class="btn btn-link">아이디/비밀번호 찾기</button></label></a>
                  </div>
                  <input type="submit" class="btn btn-danger" value="아이디로 로그인" style="margin-bottom: 5%;" />
               </div>
            </form>

         </div>

      </div>
   </div>
   <%@include file="../include/footer.jsp"%>
</body>
</html>