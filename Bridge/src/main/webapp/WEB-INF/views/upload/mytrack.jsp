<%--
작성자 - 이주연
내용 - 업로드한 내 트랙 페이지
시작날짜 - 2016/07/17
수정날짜 - 2016/07/26
변경내용 - 
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="/Bridge/resources/bootstrap/js/jquery-2.2.3.min.js"></script>
<script src="/Bridge/resources/bootstrap/js/bootstrap.min.js"></script>
<script src="/Bridge/resources/bootstrap/css/bootstrap.css" type="text/css"></script>
</head>
<script>
   $(document).ready(function() {
      //삭제를 확인하는 jquery 
      $(".btn").on("click", function() {
         if ($("input:checked").length > 0) {
            $("#del").click(function() {
               alert("삭제되었습니다.");
            });
         } else {
            alert("앨범을 선택해주세요.");
         }
      });
   });
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
   <div class="container">
      <!-- 상단 tab start -->
      <div class="container" style="margin-bottom: 150px">
         <div class="panel-heading col-md-2" id="tab">
            <h3 class="panel-title">내 트랙</h3>
         </div>

         <!-- end -->
         <div class="col-md-12">
            <br />
            <br />
            <!-- 앨범 정보 start -->
            <form class="form-horizontal">
               <c:forEach var="list" items="${albumList}">
                  <div class="col-sm-3">
                     <div class="form-group">
                        <a href="mytrack_detail?albumNumber=${list.albumNumber}"><img
                           src="/Bridge/resources/image/upload/album/${list.albumImg}" width="65%"></a>
                           
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-sm-3">
                        <div class="form-group">
                           <table class="table">
                              <tr>
                                 <th>아티스트</th>
                                 <td>${list.artistName}</td>
                              </tr>
                              <tr>
                                 <th>앨범 종류</th>
                                 <td>${list.albumType}</td>
                              </tr>
                              <tr>
                                 <th>발매일</th>
                                 <td>${list.albumDate}</td>
                              </tr>
                              <tr>
                                 <th>장르</th>
                                 <td>${list.albumGenre}</td>
                              </tr>
                           </table>
                        </div>
                        <br />
                     </div>
                  </div>
               </c:forEach>
            </form>
         </div>
      </div>
   </div>
   <!-- end -->
   <br />
   <br />
   <!--  footer start -->
   <%@include file="/WEB-INF/views/include/footer.jsp"%>
   <!--  end -->
</body>
</html>