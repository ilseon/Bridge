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

<script src="/resources/bootstrap/css/bootstrap.css" type="text/css"></script>
<%@include file="/WEB-INF/views/include/header.jsp" %>
<%@include file="/WEB-INF/views/include/sidebar.jsp" %>
<style>
	.col-md-2{
		width:7%;
	}
	
	.sub{
		color: #8C8C8C
	}
	.box {width:100px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;}

</style>

<script>
$(function(){
	$("div")
})
</script>
<!-- 게시물  -->
<c:if test="${list.size() gt 1}">
<div class="row" style="padding-left: 20%">
   <c:forEach items="${list }" var="VideoVO">
     
        <div class="col-xs-6 col-md-2">   
        	
   			 <%-- <a href="iframe?video=${VideoVO.musicVideo}" data-toggle="modal" data-target="#iframe${Video.VO.musicNumber}">
   			  <div class="modal fade" id="iframe${Video.VO.musicNumber}">
                  <div class="modal-dialog">
                     <div class="modal-content"></div>
                  </div>
               </div>  --%>
               <a href="#" onClick="window.open('iframe?video=${VideoVO.musicVideo}','MusicVideo','width=596,height=345,top=100,left=700');return false">
   			 <div class="thumbnail box" style="width: 80%; height: 250px">
     			 <img src="https://img.youtube.com/vi/${VideoVO.musicVideo}/0.jpg">
     				 <div class="caption">
 		      
       					 <p>${VideoVO.musicSubject}</p>
       					 <p class="sub">${VideoVO.artistName}</p>
       					 <p class="sub">${VideoVO.albumDate} | ${VideoVO.albumType}</p>
      				</div>
       		</a>
    		</div>
 		 </div>
 		 
   </c:forEach>
   
 </div>
 </c:if>
 
 <c:if test="${list.size() eq 0}">
               <ul>
                  <li>모든 단어의 철자가 정확한지 확인해 보세요.</li>
                  <li>두 단어 이상일 경우 띄어쓰기를 확인하거나 단어 수를 줄여보세요.</li>
                  <li>아직 발매되지 않은 곡/앨범을 검색했을 수 있습니다.</li>
               </ul>
 </c:if>
 <!-- 페이징 -->
 <div class="row" style="padding-right: 400px">
 <div class="col-xs-6 col-xs-offset-6"">
 <nav>
<ul class="pagination">
    <li><a href="video?bno=${paging.firstPageNo}&searchType=&search=" class="first">&lt;&lt;</a></li>
   <li> <a href="video?bno=${paging.prevPageNo}&searchType=&search=" class="prev">&lt;</a></li>
    <li>
        <c:forEach var="i" begin="${paging.startPageNo}" end="${paging.endPageNo}" step="1">
            <c:choose>
                <c:when test="${i eq paging.pageNo}"><a href="video?bno=${i}&searchType=&search=" class="choice">${i}</a></c:when>
                <c:otherwise><a href="video?bno=${i}&searchType=&search=">${i}</a></c:otherwise>
            </c:choose>
        </c:forEach>
    <li>
   <li> <a href="video?bno=${paging.nextPageNo}&searchType=&search=" class="next">&gt;</a></li>
    <li><a href="video?bno=${paging.finalPageNo}&searchType=&search=" class="last">&gt;&gt;</a></li>
</ul>
</nav>
<form method="get" action="video?bno=1">
<div style="padding-right: 10px" >
<input type="hidden" name="bno" value="1"/>
		<select  name="searchType" id="searchType">
  			<option>제목</option>
  			<option>가수</option>
		</select>
			<input type="text" class="btn search" name="search" style="border: 3px solid red; border-radius:50px;" size="30"/>
			<input type="image" src="/resources/image/search.PNG"  style="vertical-align: middle; " />
</div>
</form>			
</div>
</div>
 <%@include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>