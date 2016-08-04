<!-- 
   최초 작성일 : 20160728
   작성자 : 조일선
   수정일 : 2016/07/28
   내용 : 헤더의 검색어로 검색
 -->
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%
   session.setAttribute("userNumber","3");
   session.setAttribute("userId", "test1");
%>
<link href="/resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
<script src="/resources/bootstrap/js/jquery-2.2.3.min.js"></script>
<script>
function PopupWindow()
  {
     window.open("/player","popup", "width=500, height=700, left=30, top=30, scrollbars=no,titlebar=no,status=no,resizable=no,fullscreen=no");
  }
</script>
<title>search</title>
</head>
<style>
.navbar{
background:rgba(255,255,255,0.25);
border: none;
}
.nav>li>a, .dropdown-menu>li>a:focus, .dropdown-menu>li>a:hover, .dropdown-menu>li>a, .dropdown-menu>li{
  border-bottom: 3px solid transparent;
}
.nav>li>a:focus, .nav>li>a:hover,.nav .open>a, .nav .open>a:focus, .nav .open>a:hover, .dropdown-menu>li>a:focus, .dropdown-menu>li>a:hover{
  border-bottom: 3px solid transparent;
  background: none;
}
.navbar a, .dropdown-menu>li>a, .dropdown-menu>li>a:focus, .dropdown-menu>li>a:hover, .navbar-toggle{
 color: black;
}
.nav li:hover:nth-child(8n+1), .nav li.active:nth-child(8n+1){
  border-bottom: red 3px solid;
}
.nav li:hover:nth-child(8n+2), .nav li.active:nth-child(8n+2){
  border-bottom: red 3px solid;
}
.navbar-toggle .icon-bar{
    color: #fff;
    background: #fff;
}
.dropdown {
    background:#fff;
    
}
.dropdown-menu>li>a {
    color:#428bca;
}
.dropdown ul.dropdown-menu {
    border-radius:4px;
    box-shadow:none;
    margin-top:20px;
    width:230px;
    min-width:80px;
    align:middle;
}
.dropdown ul.dropdown-menu:before {
    content: "";
    border-bottom: 10px solid #fff;
    border-right: 10px solid transparent;
    border-left: 10px solid transparent;
    position: absolute;
    top: -10px;
    right: 16px;
    z-index: 10;
}
.dropdown ul.dropdown-menu:after {
    content: "";
    border-bottom: 12px solid #ccc;
    border-right: 12px solid transparent;
    border-left: 12px solid transparent;
    position: absolute;
    top: -12px;
    right: 14px;
    z-index: 9;
}
.table tbody>tr>td.vert-align{
    vertical-align: middle;
}
</style>
<body style="margin-top: 4%;">
<%@include file="/WEB-INF/views/include/header.jsp" %>
<%@include file="/WEB-INF/views/include/sidebar.jsp" %>
<!-- 실시간 차트 페이지의 메뉴 -->
<div class="container">
   <div class="row">
      <br/><br/>   
         <c:if test="${paging.totalCount gt 1}">
            <h3><mark>'${paging.search}'</mark> 검색 결과</h3> <hr/>
               <%@include file="/WEB-INF/views/include/searchresult_detail.jsp"%>
            </c:if>
      <c:if test="${paging.totalCount eq 0}">
            <h3><mark>'${paging.search}'</mark> 검색 결과가 없습니다.</h3> <hr/>
               <ul>
                  <li>모든 단어의 철자가 정확한지 확인해 보세요.</li>
                  <li>두 단어 이상일 경우 띄어쓰기를 확인하거나 단어 수를 줄여보세요.</li>
                  <li>아직 발매되지 않은 곡/앨범을 검색했을 수 있습니다.</li>
               </ul>
         </c:if>   

   </div>
</div>
<%@include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>