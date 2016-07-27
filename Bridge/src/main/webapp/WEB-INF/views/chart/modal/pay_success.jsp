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
			  // �ٿ���� ������ �̸��� ������
			  String fileName =request.getAttribute("fileName")+"";
			  
			  // Context�� ���� ������ �˾ƿ�
			  ServletContext context = getServletContext(); // ������ ���� ȯ�������� ������
			  
			  // ���� ������ ����Ǿ� �ִ� ������ ���
			  String realFolder = context.getRealPath("/upload/music");
			  // �ٿ���� ������ ��ü ��θ� filePath�� ����
			  String filePath = realFolder + "\\" + fileName;
			  
			  try{
			   // �ٿ���� ������ �ҷ���
			   File file = new File(filePath);
			   byte b[] = new byte[4096];
			   
			   // page�� ContentType���� �������� �ٲٱ� ���� �ʱ�ȭ��Ŵ
			   response.reset();
			   response.setContentType("application/octet-stream");
			   
			   // �ѱ� ���ڵ�
			   String Encoding = new String(fileName.getBytes("UTF-8"), "8859_1");
			   // ���� ��ũ�� Ŭ������ �� �ٿ�ε� ���� ȭ���� ��µǰ� ó���ϴ� �κ�
			   response.setHeader("Content-Disposition", "attachment; filename = " + Encoding);
			  
			   // ������ ���� ������ �о���� ���ؼ� ����
			   FileInputStream in = new FileInputStream(filePath);
			  
			   // ���Ͽ��� �о�� ���� ������ �����ϴ� ���Ͽ� ���ֱ� ���ؼ� ����
			   ServletOutputStream out2 = response.getOutputStream();
			   
			   int numRead;
			   // ����Ʈ �迭 b�� 0�� ���� numRead�� ���� ���Ͽ� ���� (���)
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
<h2>�ٿ�ε�</h2><hr/>
	<c:set var="i" value="0"/>
          	<c:set var="downloadlistall" value=""/>
          	<c:if test="${download_list!=null}">
				<c:forEach items="${download_list}" var="downloadlist" begin="0">
				<c:set var="i" value="${i+1}"/>
					<br/>${downloadlist.musicSubject}&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;${downloadlist.artistName}<br/><br/><hr/><br/>					
					<c:set var="downloadlistall" value="${downloadlistall} ${downloadlist.musicFile}"/>
				</c:forEach>
				�ٿ� �� �� : ${i}��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1�� �� �ݾ� : 2$<br/><br/>
			</c:if>			
          	<c:if test="${music!=null}">
          		<c:set var="downloadlistall" value="${downloadlistall} ${music.musicFile}"/>
				${music.musicSubject}&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;${music.artistName}<br/><br/><hr/><br/>
				 ${music.musicFile}
				�ٿ� �� �� : 1��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1�� �� �ݾ� : 2$<br/><br/>
				<c:set var="i" value="1"/>
			</c:if>
			<hr/>
			<a type="button" class="btn btn-success" id="download_now" onclick="downloadAll('${downloadlistall}')">���� �Ϸ�</a>
</body>
</html>