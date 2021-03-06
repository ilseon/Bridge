<%--
작성자 - 김민정
내용 - 페이지 옆 노출
시작날짜 - 2016/07/19
수정날짜 - 2016/07/28
변경내용 - 로그인이 안되있을경우 팝업창 노출 에러 해결
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="/Bridge/resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
<script src="/Bridge/resources/bootstrap/js/jquery-2.2.3.min.js"></script>
<script src="/Bridge/resources/bootstrap/js/bootstrap.min.js"></script>

<script>
   $(function() {
      $('input').click(function(e) {
         var userId = '${userid}';
         var checkId = $(this).attr('id');
         
   
   if (checkId == "like_song" || checkId == "myalbum"
                     || checkId == "download" || checkId == "upload"
                     || checkId == "mytrack") {
                  if (userId.length == 0) {
                     alert("로그인을 해주세요 !");
                  }
                  else if (checkId == "like_song") {
                     location.href = 'like_song';
                  } else if (checkId == "myalbum") {
                     location.href = 'my_album';
                  } else if (checkId == "download") {
                     location.href = 'download';
                  } else if (checkId == "upload") {
                     location.href = 'upload';
                  } else if (checkId == "mytrack") {
                     location.href = 'mytrack';
                  }
               }
            });
   });
</script>


<!-- 사이드바 전체-->
<div class="col-xs-12 col-sm-2" style="border-right:1px solid #BDBDBD;" >

<!-- 위쪽 메뉴 -->
<div class="list-group col-xs-12 col-sm-2" style="position: fixed; " >

  <a href="chart" class="list-group-item" style="border-color: white;"><input type="image" src="/Bridge/resources/image/mainchart.PNG"  /></a>
  <a href="new_album" class="list-group-item" style="border-color: white;"><input type="image" src="/Bridge/resources/image/mainalbum.PNG"   /></a>
  <a href="video?bno=1&searchType=&search=" class="list-group-item" style="border-color: white;"><input type="image" src="/Bridge/resources/image/mainmv.PNG"  /></a>
  <br/><br/><br/><hr/>
  
<!-- 중간 메뉴 -->
<a href="#" class="list-group-item" style="border-color: white;"><input type="image" src="/Bridge/resources/image/mainlike.PNG"   id="like_song" /></a>
<a href="#" class="list-group-item" style="border-color: white;"><input type="image" src="/Bridge/resources/image/mainmyalbum.PNG"  id="myalbum" /></a>
<a href="#" class="list-group-item" style="border-color: white;"><input type="image" src="/Bridge/resources/image/maindown.PNG"  id="download" /></a>
<hr/>
 
<!-- 아래 메뉴 -->
<a href="#" class="list-group-item" style="border-color: white;"><input type="image" src="/Bridge/resources/image/mainup.PNG"  id="upload" /></a>
<a href="#" class="list-group-item" style="border-color: white;"><input type="image" src="/Bridge/resources/image/maintrack.PNG"  id="mytrack" /></a>
<br/><br/><br/><br/><br/>

</div>
</div>