<%@page import="org.springframework.web.multipart.MultipartHttpServletRequest"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.springframework.web.multipart.MultipartFile"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <script>
    $(document).ready(function(){
    	window.open('about:blank','download','width=1000,height=500');
    });
    
    </script>

         <%-- <% 
		  response.reset();
		  // �ٿ���� ������ �̸��� ������
		  List<String> fileName =(List)request.getAttribute("musicfiles");
		  String realpath = request.getAttribute("realpath")+"";
		  System.out.println(realpath);
		  String filePath=null;
		  
		  ServletOutputStream out2=null;
		  FileInputStream in=null;
		  MultipartFile multipartFile = null;
		  String storedFileName = null;
		  String originalFileName = null;
		  String originalFileExtension = null;
		  MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
		  try{

				  System.out.println(fileName.size()+"download_all_fileName.size()");
				  System.out.println(fileName.get(0));
				 // filePath=realpath+fileName.get(i);
				 Iterator<String> iterator = fileName.iterator();
				 File file = new File(realpath);
			       
				  
				  /*  File file = new File(filePath);
				   byte b[] = new byte[4096];
				   
				   response.reset();
				   response.setContentType("application/octet-stream");
				   
				   String Encoding = new String(fileName.get(i).getBytes("UTF-8"), "8859_1");
				   // ���� ��ũ�� Ŭ������ �� �ٿ�ε� ���� ȭ���� ��µǰ� ó���ϴ� �κ�
				   response.setHeader("Content-Disposition", "attachment; filename = " + Encoding);
				  
				   // ������ ���� ������ �о���� ���ؼ� ����
				   in = new FileInputStream(filePath);
				   out.clear();
				   out=pageContext.pushBody();
				   // ���Ͽ��� �о�� ���� ������ �����ϴ� ���Ͽ� ���ֱ� ���ؼ� ����
				   out2 = response.getOutputStream();
				   
				   int numRead;
				   // ����Ʈ �迭 b�� 0�� ���� numRead�� ���� ���Ͽ� ���� (���)
				   while((numRead = in.read(b, 0, b.length)) != -1){
				    out2.write(b, 0, numRead); */
				    
				    while(iterator.hasNext()){
			            multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			            if(multipartFile.isEmpty() == false){
			                originalFileName = multipartFile.getOriginalFilename();
			                originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
			    			 /*storedFileName = CommonUtils.getRandomString() + originalFileExtension; */
			                 
			                file = new File(realpath + originalFileName);
			                multipartFile.transferTo(file);
			            }
				    }
				    
				   //}

			 /*  out2.flush();
			  out2.close();
			  in.close(); */
			 }catch(Exception e){				 
		  }
		 %> --%>
		 
	 <% 
		  response.reset();
		  // �ٿ���� ������ �̸��� ������
		   List<String> fileName =(List)request.getAttribute("musicfiles");
		  String realpath = request.getAttribute("realpath")+"";
		  String filePath=null;
		  
		  ServletOutputStream out2=null;
		  FileInputStream in=null;
		  MultipartFile multipartFile = null;
		  try{
			 	for(int i=0;i<fileName.size();i++){
				  System.out.println(fileName.size()+"download_all_fileName.size()");
				  System.out.println(fileName.get(i));
				  filePath=realpath+fileName;
				  
				   File file = new File(filePath);
				   byte b[] = new byte[4096];
				   
				   response.reset();
				   response.setContentType("application/octet-stream");
				   
				   String Encoding = new String(fileName.get(i).getBytes("UTF-8"), "8859_1");
				   // ���� ��ũ�� Ŭ������ �� �ٿ�ε� ���� ȭ���� ��µǰ� ó���ϴ� �κ�
				   response.setHeader("Content-Disposition", "attachment; filename = " + Encoding);
				  
				   // ������ ���� ������ �о���� ���ؼ� ����
				   in = new FileInputStream(filePath);
				   out.clear();
				   out=pageContext.pushBody();
				   // ���Ͽ��� �о�� ���� ������ �����ϴ� ���Ͽ� ���ֱ� ���ؼ� ����
				   out2 = response.getOutputStream();
				   
				   int numRead;
				   // ����Ʈ �迭 b�� 0�� ���� numRead�� ���� ���Ͽ� ���� (���)
				   while((numRead = in.read(b, 0, b.length)) != -1){
				    out2.write(b, 0, numRead);				    
				   }
				}
			  out2.flush();
			  out2.close();
			  in.close();
			 }catch(Exception e){	
				
		  }
		 
		 %> 
