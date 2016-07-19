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
	
var listAll = new Array();
	
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
			var list=$("#mytable input[type=checkbox]");
				for(var i = 0 ; i<list.length; i++){
					if(list[i].checked==true){
						listAll.push(list[i].value);
					}
				}
		}else if($("#mytable input[type=checkbox]:not(checked)")){
			alert("곡을 선택해 주세요!");
			return false;
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
<div class="container">
	<div class="row">
		<div class="col-sm-11" style="font:10px">
			<div class="col-sm-2">실시간 차트&nbsp;&nbsp;&nbsp;</div>
			<div class="col-sm-2 dropdown">
				<span class="bar"></span>
				<a href="#" class="dropdown-toggle" data-toggle="dropdown">
				<span style="color:red">
					장르별 차트<span class="caret"></span></a>
				</span>
				<ul class="dropdown-menu" style="font-size:15px; padding:5px; width=100px; align:center;">
					전체 차트<br/><br/>
					<a href="/chart_genre?genre=indie">인디</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/chart_genre?genre=rnb">알앤비</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/chart_genre?genre=hiphop">힙합</a><br/><br/>
					<a href="/chart_genre?genre=el">일렉트로닉</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/chart_genre?genre=rnm">락/메탈</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/chart_genre?genre=jazz">재즈</a><br/><br/>
					<a href="/chart_genre?genre=bdp">발라드/댄스/팝</a>
				</ul>
			</div>
		</div><br/><br/>
	 <div class="col-sm-11">
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
		<c:if test="">
			<%@include file="/WEB-INF/views/chart/chart_now.jsp" %>
		</c:if>

	</div>
</div>
<%@include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>