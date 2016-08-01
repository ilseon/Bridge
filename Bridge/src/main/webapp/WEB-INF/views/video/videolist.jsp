<!-- 
/*
 * 작성자 - 우병수
 * 내용 - 비디오 게시물 메인
 * 시작날짜 - 2016/07/20
 * 수정날짜 - 2016/07/22
 * 변경내용 - 제목 가수 발매일 데이터를 가져와서 10개
 			10개씩 뿌려준다 
 */
 -->


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
<style>
	.col-md-2{
		width:7%;
	}
</style>
<!-- 게시물  -->
<div class="row">
   <c:forEach items="${list }" var="VideoVO">
     
        <div class="col-xs-6 col-md-2">   
   			 <a href="https://www.youtube.com/watch?v=${VideoVO.musicVideo}">
   			 <div class="thumbnail" style="width: 80%">
     			 <img src="https://img.youtube.com/vi/${VideoVO.musicVideo}/0.jpg">
     				 <div class="caption">
       					 <p>제목 : ${VideoVO.musicSubject}</p>
       					 <p>가수 : ${VideoVO.artistName}</p>
       					 <p>발매일 : ${VideoVO.albumDate}</p>
      				</div>
       		</a>
    		</div>
 		 </div>       
   </c:forEach>
   
 </div>
 
 <!-- 페이징 -->
 <div class="row">
 <div class="col-xs-4 col-xs-offset-6">
 <nav>
<ul class="pagination">
    <li><a href="video?bno=${paging.firstPageNo}&searchType=&search=" class="first">처음 페이지</a></li>
   <li> <a href="video?bno=${paging.prevPageNo}&searchType=&search=" class="prev">이전 페이지</a></li>
    <li>
        <c:forEach var="i" begin="${paging.startPageNo}" end="${paging.endPageNo}" step="1">
            <c:choose>
                <c:when test="${i eq paging.pageNo}"><a href="video?bno=${i}&searchType=&search=" class="choice">${i}</a></c:when>
                <c:otherwise><a href="video?bno=${i}&searchType=&search=">${i}</a></c:otherwise>
            </c:choose>
        </c:forEach>
    <li>
   <li> <a href="video?bno=${paging.nextPageNo}&searchType=&search=" class="next">다음 페이지</a></li>
    <li><a href="video?bno=${paging.finalPageNo}&searchType=&search=" class="last">마지막 페이지</a></li>
</ul>
</nav>
<form method="get" action="video?bno=1">
<div style="pa">
<input type="hidden" name="bno" value="1"/>
		<select  name="searchType" id="searchType">
  			<option>제목</option>
  			<option>가수</option>
		</select>
			<input type="text" class="btn search" name="search" style="border: 3px solid red; border-radius:50px;"/>
			<input type="image" src="/resources/image/search.PNG"  style="vertical-align: middle; " />
</div>
</form>			
</div>
</div>
 <%@include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>