<%@ page contentType="text/html; charset=UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="/resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
<script src="/resources/bootstrap/js/jquery-2.2.3.min.js"></script>
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
<script src="/resources/bootstrap/css/bootstrap.css" type="text/css"></script>
<%@include file="/WEB-INF/views/include/header.jsp" %>
<%@include file="/WEB-INF/views/include/sidebar.jsp" %>
<div class="row">
	
   <c:forEach begin="0" end="20" step="1">
     
        <div class="col-xs-6 col-md-1">   
   			 <a href="https://www.youtube.com/?gl=KR&hl=ko">
   			 <div class="thumbnail">
     			 <img src="/resources/image/album.PNG">
     				 <div class="caption">
       					 <p>제목</p>
       					 <p>가수</p>
       					 <p>발매일</p>
      				</div>
       		</a>
    		</div>
 		 </div>       
   </c:forEach>
   
 </div>
 <div class="row">
 <div class="col-xs-4 col-xs-offset-6">
 <nav>
  <ul class="pagination">
    <li>
      <a href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <li><a href="#">1</a></li>
    <li><a href="#">2</a></li>
    <li><a href="#">3</a></li>
    <li><a href="#">4</a></li>
    <li><a href="#">5</a></li>
    <li>
      <a href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>
<div style="pa">
		<select  name="searchType" id="searchType">
  			<option>제목</option>
  			<option>가수</option>
		</select>
			<input type="text" class="btn search" style="border: 3px solid red; border-radius:50px;"/>
			<input type="image" src="/resources/image/search.PNG"  style="vertical-align: middle; " />
</div>			
</div>
</div>
 <%@include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>