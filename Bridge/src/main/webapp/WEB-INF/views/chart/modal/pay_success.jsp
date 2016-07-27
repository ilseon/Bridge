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
<script>
	function downloadAll(downloadlistall){
		<%--  var d_path="<%=uploadPath%>"; --%>
		var downloadlist = downloadlistall.split(" ");
		for(var i = 1 ; i<downloadlist.length;i++){
			var yes = $.get("/file_name?fileName="downloadlist[i]);
			alert(yes);
			<% 
			  // 다운받을 파일의 이름을 가져옴
			  String fileName =request.getAttribute("fileName")+"";
			  
			  // Context에 대한 정보를 알아옴
			  ServletContext context = getServletContext(); // 서블릿에 대한 환경정보를 가져옴
			  
			  // 실제 파일이 저장되어 있는 폴더의 경로
			  String realFolder = context.getRealPath("/upload/music");
			  // 다운받을 파일의 전체 경로를 filePath에 저장
			  String filePath = realFolder + "\\" + fileName;
			  
			  try{
			   // 다운받을 파일을 불러옴
			   File file = new File(filePath);
			   byte b[] = new byte[4096];
			   
			   // page의 ContentType등을 동적으로 바꾸기 위해 초기화시킴
			   response.reset();
			   response.setContentType("application/octet-stream");
			   
			   // 한글 인코딩
			   String Encoding = new String(fileName.getBytes("UTF-8"), "8859_1");
			   // 파일 링크를 클릭했을 때 다운로드 저장 화면이 출력되게 처리하는 부분
			   response.setHeader("Content-Disposition", "attachment; filename = " + Encoding);
			  
			   // 파일의 세부 정보를 읽어오기 위해서 선언
			   FileInputStream in = new FileInputStream(filePath);
			  
			   // 파일에서 읽어온 세부 정보를 저장하는 파일에 써주기 위해서 선언
			   ServletOutputStream out2 = response.getOutputStream();
			   
			   int numRead;
			   // 바이트 배열 b의 0번 부터 numRead번 까지 파일에 써줌 (출력)
			   while((numRead = in.read(b, 0, b.length)) != -1){
			    out2.write(b, 0, numRead);
			   }
			   
			   out2.flush();
			   out2.close();
			   in.close();
			   
			  } catch(Exception e){
			  }
			 %>
			
		}
	}
	
	 
</script>

<title>Insert title here</title>
</head>
<body style="align:center">
<h2>다운로드</h2><hr/>
	<c:set var="i" value="0"/>
          	<c:set var="downloadlistall" value=""/>
          	<c:if test="${download_list!=null}">
				<c:forEach items="${download_list}" var="downloadlist" begin="0">
				<c:set var="i" value="${i+1}"/>
					<br/>${downloadlist.musicSubject}&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;${downloadlist.artistName}<br/><br/><hr/><br/>					
					<c:set var="downloadlistall" value="${downloadlistall} ${downloadlist.musicFile}"/>
				</c:forEach>
				다운 곡 수 : ${i}곡&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1곡 당 금액 : 2$<br/><br/>
			</c:if>			
          	<c:if test="${music!=null}">
          		<c:set var="downloadlistall" value="${downloadlistall} ${music.musicFile}"/>
				${music.musicSubject}&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;${music.artistName}<br/><br/><hr/><br/>
				 ${music.musicFile}
				다운 곡 수 : 1곡&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1곡 당 금액 : 2$<br/><br/>
				<c:set var="i" value="1"/>
			</c:if>
			<hr/>
			<a type="button" class="btn btn-success" id="download_now" onclick="downloadAll('${downloadlistall}')">결제 완료</a>
</body>
</html>