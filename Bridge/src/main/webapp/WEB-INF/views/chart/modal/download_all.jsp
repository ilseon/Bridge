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
		  // 다운받을 파일의 이름을 가져옴
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
				   // 파일 링크를 클릭했을 때 다운로드 저장 화면이 출력되게 처리하는 부분
				   response.setHeader("Content-Disposition", "attachment; filename = " + Encoding);
				  
				   // 파일의 세부 정보를 읽어오기 위해서 선언
				   in = new FileInputStream(filePath);
				   out.clear();
				   out=pageContext.pushBody();
				   // 파일에서 읽어온 세부 정보를 저장하는 파일에 써주기 위해서 선언
				   out2 = response.getOutputStream();
				   
				   int numRead;
				   // 바이트 배열 b의 0번 부터 numRead번 까지 파일에 써줌 (출력)
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
		  // 다운받을 파일의 이름을 가져옴
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
				   // 파일 링크를 클릭했을 때 다운로드 저장 화면이 출력되게 처리하는 부분
				   response.setHeader("Content-Disposition", "attachment; filename = " + Encoding);
				  
				   // 파일의 세부 정보를 읽어오기 위해서 선언
				   in = new FileInputStream(filePath);
				   out.clear();
				   out=pageContext.pushBody();
				   // 파일에서 읽어온 세부 정보를 저장하는 파일에 써주기 위해서 선언
				   out2 = response.getOutputStream();
				   
				   int numRead;
				   // 바이트 배열 b의 0번 부터 numRead번 까지 파일에 써줌 (출력)
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
