<!-- 
	최초 작성일 : 2016-07-17
	작성자 : 정효진
	수정일 : 2016-08-01
	수정 내용 : 뮤직 비디오 페이지 출력
	내용 : 실시간 차트 페이지 헤더
 -->
<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="/resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
 <script src="/resources/bootstrap/js/jquery-2.2.3.min.js"></script> 
<script>

function PopupWindow()
  {
     window.open("/player","popup", "width=500, height=700, left=30, top=30, scrollbars=no,titlebar=no,status=no,resizable=no,fullscreen=no");
  }


</script>
<script>
var user="${usernumber}";

//checkbox 전체 선택
$(document).ready(function(){
   $("#checkall").click(function () {
           if ($("#checkall").is(':checked')) {
               $("#mytable input[type=checkbox]").each(function () {
                   $(this).prop("checked", true);
               });

           } else {
               $("#mytable input[type=checkbox]").each(function () {
                   $(this).prop("checked", false);
               });
           }
       });
   });
   
//여러 곡을 선택한 경우
$(function(){
   $("#check_all .btn").click(function(){
      if($(this).attr('id')=="all_listen"){
         $("#mytable input[type=checkbox]").each(function () {
              $(this).prop("checked", true);
            });   
      }
      if($("#mytable input[type=checkbox]").is(":checked")){
         var playlistAll = new Array();
         if(user!=""){
         var list=$("#mytable input[type=checkbox]");
            for(var i = 0 ; i<list.length; i++){
               if(list[i].checked==true){
                  playlistAll.push(list[i].value);
               }
            } 
            
         var this_name=$(this).attr('id');
         
         if(this_name=="download"){
            $('#Download').modal({
                 remote: '/download_modal_sev?playlistAll='+playlistAll
            });
         }else if(this_name=="myalbum"){
            $('#MyAlbum').modal({
                 remote: '/myalbum_modal_sev?playlistAll='+playlistAll
            });
         }
            
         }else{
            alert("로그인 후 이용하실 수 있는 서비스입니다!");   
         }
      }else if($("#mytable input[type=checkbox]:not(checked)")){
         alert("곡을 선택해 주세요!");
         return false;
      }
   })
});



//한 곡에 대한 선택 사항 처리
$(function(){
   $("#mytable .btn[id]").click(function(){
      var tagId = $(this).attr('id');
      if(user==""){
         alert("로그인 후 이용하실 수 있는 서비스입니다!");
         return false;
      }else if(tagId=="like"){
         if($(this).find("span").attr('style')==null){
            $.post("/like_music?musicnumber="+$(this).find("span").attr('id'));
            alert("'좋아요'를 눌러 주셨습니다!");
            $(this).find("span").css("color","red");
            
         }else if($(this).find("span").attr('style')!=null){
            $.get("/like_music_cancel?musicnumber="+$(this).find("span").attr('id'));
            alert("'좋아요'가 취소 되었습니다ㅠㅠ");
            $(this).find("span").css("color","");
         }
      }
   })
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
<title>chart</title>
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
		<div class="col-sm-12" style="font:15px">
			<div class="col-sm-2">실시간 차트&nbsp;&nbsp;&nbsp;</div>
			<div class="col-sm-2 dropdown">
				<span class="bar"></span>
				<a href="#" class="dropdown-toggle" data-toggle="dropdown">
				<span style="color:red">
					<c:if test="${genre eq null}">장르별 차트</c:if>
					<c:if test="${genre eq 'indie'}">인디</c:if>
					<c:if test="${genre eq 'rnb'}">알앤비</c:if>
					<c:if test="${genre eq 'hiphop'}">힙합</c:if>
					<c:if test="${genre eq 'el'}">일렉트로닉</c:if>
					<c:if test="${genre eq 'rnm'}">락/메탈</c:if>
					<c:if test="${genre eq 'jazz'}">재즈</c:if>
					<c:if test="${genre eq 'bdp'}">발라드/댄스/팝</c:if>
					<span class="caret"></span></a>
				</span>
				<ul class="dropdown-menu" style="font-size:15px; padding:5px; width=100px; align:center;">
					<a href="/chart">전체차트</a>
					<br/><br/>
					<a href="/chart?genre=indie">인디</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/chart?genre=rnb">알앤비</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/chart?genre=hiphop">힙합</a><br/><br/>
					<a href="/chart?genre=el">일렉트로닉</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/chart?genre=rnm">락/메탈</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/chart?genre=jazz">재즈</a><br/><br/>
					<a href="/chart?genre=bdp">발라드/댄스/팝</a>
				</ul>
			</div>
		</div><br/><br/><br/>
	 <div class="col-sm-12">
	    <nav class="navbar">
	            <div id="navbar" class="navbar">
	                <ul class="nav navbar-nav">
						<c:if test="${page=='main' or page=='artist' or page=='album'}">
							<c:set var="active1" value="active"/>
	                    </c:if>
	                    <c:if test="${page=='video'}">
	                    	<c:set var="active2" value="active"/>
	                    </c:if>
	                    <li class="${active1}"><a href="chart" class="">곡 차트</a></li>
	                    <li class="${active2}"><a href="chart.video">뮤직비디오 차트</a></li>
	                </ul>
	            </div>
	    </nav>
	    <hr/>
	</div>
			<c:if test="${page=='main'}">
				<%@include file="/WEB-INF/views/chart/chart_now.jsp"%>
			</c:if>
			<c:if test="${page=='album'}">
				<%@include file="/WEB-INF/views/album/album_detail.jsp"%>
			</c:if>
			<c:if test="${page=='artist'}">
				<%@include file="/WEB-INF/views/artist/artist_detail.jsp"%>
			</c:if>
			<c:if test="${page=='video'}">
				<%@include file="/WEB-INF/views/video/videolist.jsp"%>
			</c:if>

	</div>
</div>

<!-- 다운로드 모달창 시작 -->
<div class="modal fade" id="Download" role="dialog" aria-labelledby="edit" aria-hidden="true">
      <div class="modal-dialog">
    <div class="modal-content"></div>
    <!-- /.modal-content --> 
  </div>
      <!-- /.modal-dialog --> 
    </div>
<!-- 다운로드 모달창  끝 -->    
    
    
    
<!-- 내 앨범 추가 모달 시작 -->
    <div class="modal fade" id="MyAlbum" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
      <div class="modal-dialog">
          <div class="modal-content">
         </div>
    <!-- /.modal-content --> 
     </div>
      <!-- /.modal-dialog --> 
   </div>
<!-- 내 앨범 추가 모달 끝 -->
<%@include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>