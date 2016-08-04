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

<style>
.sub{
		color: #8C8C8C
	}
</style>
<script src="/resources/bootstrap/css/bootstrap.css" type="text/css"></script>


<!-- 뮤직비디오 게시물 출력  -->
<div class="col-sm-11">
   <c:forEach items="${list }" var="VideoVO">
        <div class="col-sm-3">   
               <a href="#" onClick="window.open('iframe?video=${VideoVO.musicVideo}','MusicVideo','width=596,height=345,top=100,left=700');return false">
   			 <div class="thumbnail" style="width: 80%;height: 250px">
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
 

		

</body>
</html>