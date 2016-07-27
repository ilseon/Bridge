<%@page import="java.util.List"%>
<%@page import="java.io.Console"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link href="/resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
<script src="/resources/bootstrap/js/jquery-2.2.3.min.js"></script>
<%
	List<String> musicfiles= (List)request.getAttribute("musicfiles");
	String realpath = (String)request.getAttribute("realpath");
%>
<title>다운로드</title>
</head>
<body style="align:center">
<h2>다운로드</h2><hr/>
	<c:set var="i" value="0"/>
          	<c:set var="downloadlistall" value=""/>
          	<c:if test="${download_list!=null}">
				<c:forEach items="${download_list}" var="downloadlist" begin="0">
				<c:set var="i" value="${i+1}"/>
					<br/>${downloadlist.musicSubject}&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;${downloadlist.artistName}<br/><br/><hr/><br/>					
					<c:set var="musicnumbers" value="${musicnumbers} ${downloadlist.musicNumber}"/>
				</c:forEach>
				다운 곡 수 : ${i}곡&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1곡 당 금액 : 2$<br/><br/>
			</c:if>			
          	<c:if test="${music!=null}">
          		<c:set var="musicnumbers" value="${musicnumbers} ${music.musicNumber}"/>
				${music.musicSubject}&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;${music.artistName}<br/><br/><hr/><br/>
				 ${music.musicFile}
				다운 곡 수 : 1곡&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1곡 당 금액 : 2$<br/><br/>
				<c:set var="i" value="1"/>
			</c:if>
			<hr/>
			<a type="button" class="btn btn-success" id="download_now" href="/download_all?musicfiles=<%=request.getAttribute("musicfiles")%>&realpath=<%=request.getAttribute("realpath")%>">결제 완료</a>
</body>
</html>