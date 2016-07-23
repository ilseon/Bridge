package com.bridge.app.persistence;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileUpload { 

public String fileUpload(MultipartFile multipartFile, HttpSession httpSession){
       
	String fileInfo = null ; 
	
    // 업로드 파일이 존재하면
    if(multipartFile != null && !(multipartFile.getOriginalFilename().equals(""))) {
         
        //파일크기 제한 (5MB)
        long filesize = multipartFile.getSize(); //파일크기
        long limitFileSize = 5*1024*1024; //5MB
         
        // 저장경로
        String defaultPath = httpSession.getServletContext().getRealPath("/"); //서버기본경로 (프로젝트 폴더 아님)
        String path = defaultPath + File.separator + "upload" + File.separator + "board" + File.separator + "files" + File.separator + "";
         
        // 저장경로 처리
        File file = new File(path);
        if(!file.exists()) { //디렉토리 존재하지 않을경우 디렉토리 생성
            file.mkdirs();
        }
         
        // 파일 저장명 처리 (20150702091941-파일명)
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        String today= formatter.format(new Date());
        String originalName = multipartFile.getOriginalFilename(); //파일이름
        String modifyName = today + "-" + originalName;
         
        // Multipart 처리
        try{
            //서버에 파일 저장 (쓰기)
            multipartFile.transferTo(new File(path + modifyName));
             
            // 로그
            System.out.println("** upload 정보 **");
            System.out.println("** path : " + path + " **");
            System.out.println("** originalName : " + originalName + " **");
            System.out.println("** modifyName : " + modifyName + " **");
        }
        catch (Exception e){
            e.printStackTrace();
            System.out.println("/ 파일업로드 실패 - singleUploadFileAjax");
        }
         
        // mime
        String fileMime = multipartFile.getContentType();
         
    }     
    return fileInfo;
}
}