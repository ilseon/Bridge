<%--
작성자 - 김민정
내용 - 메인페이지
시작날짜 - 2016/07/19
수정날짜 - 2016/08/02
변경내용 - 인기차트 툴 변경
 --%>

<%@ page contentType="text/html; charset=UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<html>
<head>
<link href="/resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
<title>Home</title>
</head>

<script type="text/javascript">
$(document).ready(function() {
 $(".quick").animate( { "top": $(document).scrollTop() + 20 +"px" }, 500 ); 
 $(window).scroll(function(){
  $(".quick").stop();
  $(".quick").animate( { "top": $(document).scrollTop() + 20 + "px" }, 1000 );
 });
});


function player(num){
	   
	   var tmp=false;
	    if (tmp==false){       //최초 클릭이면 팝업을 띄운다
	        
	       $.ajax({
	           type: 'get',
	           data: {"value":num},
	         });
	    
	        tmp = true;
	       // alert(tmp);
	       Clip =   window.open("player?val="+num,"new","width=500, height=900, resizable=no, scrollbars=no, status=no, location=no, directories=no;")
	         //Clip.close();                         
	            Clip.focus();
	            
	       }
	       else{           //최초 클릭이 아니면
	        if(tmp){
	           $.ajax({
	              type: "post",
	              url: 'player',
	              data: {"val":num} ,
	           success:alert("POST")
	            });   
	         Clip.close();                         
	        }
	        else{
	           $.ajax({
	              type: 'get',
	              data: {"val":num},
	              success:alert("POST아님")
	            });
	           tmp = true;
	          }//없으면 팝업을 다시 띄울 수 있게 한다
	          Clip =   window.open("player?val="+num,"new","width=500, height=900, resizable=no, scrollbars=no, status=no, location=no, directories=no;")
	         tmp = true;
	        
	       }
	 
	};  
</script>


<body style="margin-top: 4%;">

	<%@include file="include/header.jsp"%>
	<%@include file="include/sidebar.jsp"%>

	<div class="container">
		<!-- 최신앨범 -->
		
			<div class="col-sm-12"
				style="border: 1px solid #BDBDBD; margin-bottom: 50px; margin-left: 5%;">
				<h4>최신앨범</h4> 
				
				
				<c:forEach var="album" begin="0" end="11" step="1" items="${albumList}">
					<div class="col-xs-6 col-md-2">
						<a href="/chart"><div class="thumbnail">
								<img src="/resources/image/shinhwa.PNG">
								<p>${album.albumName}</p>
							</div></a>
					</div>
				</c:forEach>
				
				
			</div>


			<!-- 인기차트 -->
			<div class="col-sm-12" style="border: 1px solid #BDBDBD;margin-left: 5%;">
				<div>
					<h4>인기 차트 (실시간 시간)</h4>
				</div>
				<br />

				<!-- 인기차트 테이블 -->
				<table class="table">
					<c:forEach begin="0" end="9" var="music" items="${musicList}" step="1">
						<tr style="height: 70px;">
						 <c:set var="rank" value="${rank+1}"/>
						<td width="5%">${rank}</td>
						<td width="10"><a href="/test"><img src="<%=request.getAttribute("realpath")%><c:out value="${music.albumImg}"/>" style="height:60px; width:60px;"/></a></td>
                         <td width="20%">${music.musicSubject}</td>
                         <td width="20%"><a href="/artist_detail?artistNumber=${music.artistNumber}">${music.artistName}</a></td>
                         <td width="20%"><a href="/album_detail?albumNumber=${music.albumNumber}">${music.albumName}</a></td>
                         <td width="5%"><button class="btn btn-default btn-xs"><span class="glyphicon glyphicon-play" style="color:red" onclick="player(${music.musicNumber})"></span></button></td>
                         <td width="5%"><button class="btn btn-default btn-xs" id="playlist"><span class="glyphicon glyphicon-plus" style="color:green"></span></button></td>
						</tr>
					</c:forEach>
				</table>
				<!-- 인기차트 테이블 끝 -->

			</div>
			<!-- 인기차트 끝-->

			<!-- 옆에 퀵메뉴 -->
			<div class="col-sm-1  " 
			style="position: fixed;  bottom: 20px; height: auto; right: 20px; margin-bottom:3%;" >
				<a href="#top">
				<input type="image" src="/resources/image/maintop.PNG" id="quick" />
				</a>
			</div>
			<!-- 옆에 퀵메뉴 끝 -->

		
	</div>
	<%@include file="include/footer.jsp"%>
</body>
</html>

