<!-- 
	���� �ۼ��� : 2016-07-27
	�ۼ��� : ��ȿ��
	������ : 2016-07-30
	���� ���� : �ٿ�ε� ���� ����
	���� : ���� �Ϸ� ������ �� �ٿ�ε� ���� ������
 -->

<%@page import="java.util.zip.ZipEntry"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.util.zip.ZipOutputStream"%>
<%@page import="java.util.ArrayList"%>
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
    	    
		    	window.open(url,'Download');
		    	window.open('about:blank','download','width=1000,height=500');
    
    });

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
			 	if(fileName.size()==1){
				  System.out.println(fileName.size()+"download_all_fileName.size()");
				  System.out.println(fileName.get(0));
				  filePath=realpath+fileName.get(0);
				  
				   File file = new File(filePath);
				   byte b[] = new byte[4096];
				   
				   response.reset();
				   response.setContentType("application/octet-stream");
				   
				   String Encoding = new String(fileName.get(0).getBytes("UTF-8"), "ISO-8859_1");
				   // ���� �̸� ����
				   response.setHeader("Content-Disposition", "attachment; filename = " + Encoding);
				   response.setHeader("Content-Transfer-Encoding", "binary");
				   response.setContentLength((int)file.length());
				   response.setHeader("Connection", "close");
				   
				   in = new FileInputStream(filePath);
				   out.clear();
				   out=pageContext.pushBody();
				   out2 = response.getOutputStream();
				   
				   int numRead;
				   //��º�
				   while((numRead = in.read(b, 0, b.length)) != -1){
				    out2.write(b, 0, numRead);				    
				   }
				}else{
					List<File> files = new ArrayList();
					for(int i = 0 ;i<fileName.size();i++){
						files.add(new File(realpath+fileName.get(i)));
					}

					   byte b[] = new byte[4096];
					   
					   response.reset();
					   response.setContentType("Content-type: text/zip");
					   
					   String Encoding = new String(fileName.get(0).getBytes("UTF-8"), "8859_1");
					   //�ٿ�ε� �� �������� �̸� ����
					   response.setHeader("Content-Disposition","attachment; filename=music.zip");

					   //out ������ ���ֱ� ���� ��ü������ ������� �ִ� out ��ü�� �ݾ��ش�.
					   out.clear();
					   out=pageContext.pushBody();
					   //zip���Ͽ� ���� �о�� ����
					   out2 = response.getOutputStream();
					   ZipOutputStream zos = new ZipOutputStream(new BufferedOutputStream(out2));
					   
					   
					   for (File file : files) {

							System.out.println("Adding " + file.getName());
							zos.putNextEntry(new ZipEntry(file.getName()));

							// Get the file
							FileInputStream fis = null;
							try {
								fis = new FileInputStream(file);

							} catch (FileNotFoundException fnfe) {
								zos.write(("ERRORld not find file " + file.getName())
										.getBytes());
								zos.closeEntry();
								System.out.println("Couldfind file "
										+ file.getAbsolutePath());
								continue;
							}

							BufferedInputStream fif = new BufferedInputStream(fis);

							int data = 0;
							while ((data = fif.read()) != -1) {
								zos.write(data);
							}
							fif.close();

							zos.closeEntry();
							System.out.println("Finishedng file " + file.getName());
						}

						zos.close();
				}
			  out2.flush();
			  out2.close();
			  in.close();
			 }catch(Exception e){	
				
		  }
		 
		 %>
    </script>