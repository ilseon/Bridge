<!-- 
	최초 작성일 : 2016-07-17
	작성자 : 정효진
	수정일 : 2016-07-18
	내용 : 실시간 차트 페이지
 -->

<%@ page contentType="text/html; charset=utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="/resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
<script src="/resources/bootstrap/js/jquery-2.2.3.min.js"></script>
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
<script src="/resources/bootstrap/css/bootstrap.css" type="text/css"></script>
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
	    
	    $("[data-toggle=tooltip]").tooltip();
	});
	
var list = new Array();
//checkbox를 일부분만 선택했을 경우
$('#listen').click(
	function(){
		var items = $("input:checked");//check된 경우
		consol.log(items[0]);
	}		
);
	
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
<!-- 실시간 차트 페이지의 메뉴 -->
<article id="container">

		<div class="col-md-12" style="font:10px">
		<div class="col-md-1">실시간 차트&nbsp;&nbsp;&nbsp;</div>
		<div class="col-md-1 dropdown">
			<!-- <span class="bar"></span> -->
			<a href="#" class="dropdown-toggle" data-toggle="dropdown">
			<span style="color:red">장르별 차트</span><span class="caret"></span></a>
	
			<ul class="dropdown-menu" style="font-size:15px; padding:5px; width=100px; align:center;">
				전체 차트<br/><br/>
				<a href="#">인디</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">알앤비</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">힙합</a><br/><br/>
				<a href="#">일렉트로닉</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">락/메탈</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">재즈</a><br/><br/>
				<a href="#">발라드/댄스/팝</a>
			</ul>
		</div>
		</div><br/><br/>
 
    <nav class="navbar">
            <div id="navbar" class="navbar">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="#" class="">곡 차트</a></li>
                    <li><a href="#">뮤직비디오 차트</a>
                </ul>
            </div>
    </nav>
    <hr/>
    
	<!-- 차트 시작 -->
	<div class="row">
		
        <div class="col-md-12">
        <div class="table-responsive">   
        	<form action="" method="POST">
        		<input type="hidden" name="" id="" value=""/>
		        &nbsp;&nbsp;<input type="checkbox" id="checkall"/>
		        <button class="btn btn-default btn-xs" id="listen"><span class="glyphicon glyphicon-play" style="color:red"></span>듣기</button>
		        <button class="btn btn-default btn-xs" id="add_listen"><span class="glyphicon glyphicon-plus"></span>재생 목록에 추가</button>
		        <button class="btn btn-default btn-xs" id="myalbum"><span class="glyphicon glyphicon-paste"></span>내 앨범에 담기</button>
		        <button class="btn btn-default btn-xs" id="download"><span class="glyphicon glyphicon-download-alt"></span>다운로드</button>
		        <button class="btn btn-default btn-xs" id="all_listen"><span class="glyphicon glyphicon-play" style="color:red"></span>전체 듣기</button>
			</form>
              <table id="mytable" class="table table-striped">
                   
                   <thead>
                   
                   <th></th>
                   <th>순위</th>
                   <th>곡</th>
                   <th>아티스트</th>
                   <th>앨범</th>
                   <th>듣기</th>
                   <th>재생목록</th>
                   <th>내앨범</th>
                   <th>다운</th>
                   <th>뮤비</th>
                   <th>좋아</th>
                   </thead>
                   
				    <tbody> 
				    	<c:forEach begin="1" end="100" var="lev">
						    <tr >
						    <td><input type="checkbox" value="${lev}"/></td>
						    <td>${lev} &nbsp;<a href="#"> <img src="/resources/image/shinhwa.PNG" style="height: 60px; width:60px;"></td>
						    <td>표적</td>
						    <td>신화</td>
						    <td>We</td>
						    <td><button class="btn btn-default btn-xs"><span class="glyphicon glyphicon-play"></span></button></td>
						    <td><button class="btn btn-default btn-xs"><span class="glyphicon glyphicon-plus"></span></button></td>
						    <td><button class="btn btn-default btn-xs" data-title="MyAlbum" data-toggle="modal" data-target="#MyAlbum" ><span class="glyphicon glyphicon-paste"></span></button></p></td>
						    <td><button class="btn btn-default btn-xs" data-title="Download" data-toggle="modal" data-target="#Download" ><span class="glyphicon glyphicon-download-alt"></span></button></p></td>
						    <td><button class="btn btn-default btn-xs"><span class="glyphicon glyphicon-play-circle"></span></button></td>
						    <td><button class="btn btn-default btn-xs"><span class="glyphicon glyphicon-heart"></span></button></td>
						    </tr>
					    </c:forEach>
				    </tbody>
				        
				</table>
            </div>
        </div>
	</div>
<!-- 차트 끝 -->


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
</article>
</body>
</html>