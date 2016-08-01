<!-- 
	최초 작성일 : 2016-07-27
	작성자 : 정효진
	수정일 : 2016-07-27
	수정 내용 : 내 앨범에 존재할 경우 출력될 구문 작성
	내용 : 내 앨범에 존재하는 음원일 경우 열리는 모달
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  <div class="modal-content">
          <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
        <h4 class="modal-title custom_align" id="Heading">내 앨범</h4>
      </div>
          <div class="modal-body">
          	이미 내 앨범에 존재하는 곡입니다.
		</div><div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span>닫기</button>
      </div>
        </div>
    <!-- /.modal-content --> 
  </div>
        
