<!-- 
	최초 작성일 : 2016-07-17
	작성자 : 정효진
	수정일 : 2016-07-19
	내용 : 실시간 차트 페이지
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
		if($("#check_all .btn")==$("#listen_all")){
			$("#mytable input[type=checkbox]").each(function () {
                $(this).prop("checked", true);
            });	
		}
		else if($("#mytable input[type=checkbox]").is(":checked")){
			alert("곡을 선택하셨습니다.");
		}else if($("#mytable input[type=checkbox]:not(checked)")){
			alert("곡을 선택해 주세요!");
		}
	})
});
//한 곡에 대한 선택 사항 처리
function PopupWindow()
  {
     window.open("/player","popup", "width=500, height=700, left=30, top=30, scrollbars=no,titlebar=no,status=no,resizable=no,fullscreen=no");
  }
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
<body>
<%@include file="/WEB-INF/views/include/header.jsp" %>
<%@include file="/WEB-INF/views/include/sidebar.jsp" %>
<!-- 실시간 차트 페이지의 메뉴 -->
<div id="container">
		<div class="row">
		<div class="col-sm-8" style="font:10px">
			<div class="col-sm-2">실시간 차트&nbsp;&nbsp;&nbsp;</div>
			<div class="col-sm-2 dropdown">
				<span class="bar"></span>
				<a href="#" class="dropdown-toggle" data-toggle="dropdown">
				<span style="color:red">
					<c:if test="${genre}.empty">장르별 차트</c:if>
					<c:if test="${genre}!=null">${genre}</c:if>
				</span>
				장르별 차트<span class="caret"></span></a>
		
				<ul class="dropdown-menu" style="font-size:15px; padding:5px; width=100px; align:center;">
					전체 차트<br/><br/>
					<a href="/chart_genre?genre=indie">인디</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/chart_genre?genre=rnb">알앤비</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/chart_genre?genre=hiphop">힙합</a><br/><br/>
					<a href="/chart_genre?genre=el">일렉트로닉</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/chart_genre?genre=rnm">락/메탈</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/chart_genre?genre=jazz">재즈</a><br/><br/>
					<a href="/chart_genre?genre=bdp">발라드/댄스/팝</a>
				</ul>
			</div>
		</div><br/><br/>
 <div class="col-sm-8">
    <nav class="navbar">
            <div id="navbar" class="navbar">
                <ul class="nav navbar-nav">

                    <li class="active"><a href="#" class="">곡 차트</a></li>
                    <li><a href="chart.video">뮤직비디오 차트</a>

                </ul>
            </div>
    </nav>
    <hr/>
</div>
	<!-- 차트 시작 -->

		
        <div class="col-sm-8">
        <div class="table-responsive">   
        	<form action="" method="POST">
        		<div id="check_all">
        		<input type="hidden" name="" id="" value=""/>
		        &nbsp;&nbsp;<input type="checkbox" id="checkall" name="checkall"/>
		        <button class="btn btn-default btn-xs" id="listen"><span class="glyphicon glyphicon-play" style="color:red"></span>듣기</button>
		        <button class="btn btn-default btn-xs" id="add_listen"><span class="glyphicon glyphicon-plus" style="color:green"></span>재생 목록에 추가</button>
		        <button class="btn btn-default btn-xs" id="myalbum"><span class="glyphicon glyphicon-paste"></span>내 앨범에 담기</button>
		        <button class="btn btn-default btn-xs" id="download"><span class="glyphicon glyphicon-download-alt"></span>다운로드</button>
		        <button class="btn btn-default btn-xs" id="all_listen"><span class="glyphicon glyphicon-play" style="color:red"></span>전체 듣기</button>
				</div>
			</form>
              <table id="mytable" class="table table-striped">
                   
                   <thead>
                   
                   <th width="3%"></th>
                   <th width="7%">순위</th>
                   <th width="23%">곡</th>
                   <th width="20%">아티스트</th>
                   <th width="7%">앨범</th>
                   <th width="7%">듣기</th>
                   <th width="7%">재생목록</th>
                   <th width="7%">내앨범</th>
                   <th width="7%">다운</th>
                   <th width="7%">뮤비</th>
                   <th width="7%">좋아</th>
                   </thead>
                   
				    <tbody> 
				    	<c:forEach begin="1" end="100" var="lev">

						    <tr>
							    <td width="3%"><input type="checkbox" value="${lev}"/></td>
							    <td width="7%">${lev} &nbsp;<a href="/test"> <img src="/resources/image/shinhwa.PNG" style="height: 60px; width:60px;"></td>
							    <td width="23%">표적</td>
							    <td width="20%"><a href="/test2">신화</a></td>
							    <td width="7%">We</td>
							    <td width="7%"><button class="btn btn-default btn-xs"><span class="glyphicon glyphicon-play" style="color:red" onclick="PopupWindow()"></span></button></td>
							    <td width="7%"><button class="btn btn-default btn-xs"><span class="glyphicon glyphicon-plus" style="color:green"></span></button></td>
							    <td width="7%"><button class="btn btn-default btn-xs" data-title="MyAlbum" data-toggle="modal" data-target="#MyAlbum" ><span class="glyphicon glyphicon-paste"></span></button></p></td>
							    <td width="7%"><button class="btn btn-default btn-xs" data-title="Download" data-toggle="modal" data-target="#Download" ><span class="glyphicon glyphicon-download-alt"></span></button></p></td>
							    <td width="7%"><button class="btn btn-default btn-xs"><span class="glyphicon glyphicon-play-circle"></span></button></td>
							    <td width="7%"><button class="btn btn-default btn-xs"><span class="glyphicon glyphicon-heart" style="color:red"></span></button></td>
						    </tr>
					    </c:forEach>
				    </tbody>
				        
				</table>
            </div>
            </div>

</div>
<!-- 차트 끝 -->
<%@include file="/WEB-INF/views/include/footer.jsp"%>
</div>

<!-- 다운로드 모달창 시작 -->
<div class="modal fade" id="Download" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
      <div class="modal-dialog">
    <div class="modal-content">
          <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
        <h4 class="modal-title custom_align" id="Heading">다운로드</h4>
      </div>
          <div class="modal-body">
          	다운받으시겠습니까?
      </div>
          <div class="modal-footer ">
        <button type="button" class="btn btn-success" ><span class="glyphicon glyphicon-ok-sign"></span> Yes</button>
        <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> No</button>
      </div>
        </div>
    <!-- /.modal-content --> 
  </div>
      <!-- /.modal-dialog --> 
    </div>
<!-- 다운로드 모달창  끝 -->    
    
    
    
<!-- 내 앨범 추가 모달 시작 -->
    <div class="modal fade" id="MyAlbum" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
      <div class="modal-dialog">
    <div class="modal-content">
          <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
        <h4 class="modal-title custom_align" id="Heading">내 앨범에 추가</h4>
      </div>
          <div class="modal-body">
       
     		해당 곡을 내 앨범에 추가하시겠습니까?
      </div>
        <div class="modal-footer ">
        <button type="button" class="btn btn-success" ><span class="glyphicon glyphicon-ok-sign"></span> Yes</button>
        <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> No</button>
      </div>
        </div>
    <!-- /.modal-content --> 
  </div>
      <!-- /.modal-dialog --> 
    </div>
<!-- 내 앨범 추가 모달 끝 -->
</body>