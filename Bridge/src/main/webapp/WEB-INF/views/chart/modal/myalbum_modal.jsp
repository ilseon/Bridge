<!-- 
	최초 작성일 : 2016-07-27
	작성자 : 정효진
	수정일 : 2016-07-29
	수정 내용 : 음원 번호 넘기기
	내용 : 내 앨범에 음원 추가하기
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  <div class="modal-content">
          <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
        <h4 class="modal-title custom_align" id="Heading">내 앨범 담기</h4>
      </div>
          <div class="modal-body">
          	<c:if test="${music!=null}">
	          	<br/>
	          	${music.musicSubject}&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;${music.artistName}<br/><br/><br/>
				 해당 곡을 내 앨범에 추가하시겠습니까?
				 <c:set var="href" value="/myalbum?musicnumber=${music.musicNumber}"/>
			</c:if>
			<c:set var="i" value="0"/>
			<c:set var="playlistall" value=""/>
          	<c:if test="${playlistAll!=null}">
				<c:forEach items="${playlistAll}" var="playlist" begin="0">
				<c:set var="i" value="${i+1}"/>
					<br/>${playlist.musicSubject}&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;${playlist.artistName}<br/><br/><hr/><br/>
					<c:set var="playlistall" value="${playlistall},${playlist.musicNumber}"/>
				</c:forEach>
				<c:set var="href" value="/myalbum_sev?playlistall=${playlistall}"/>
				 해당 곡들을 내 앨범에 추가하시겠습니까?<br/><br/>
			</c:if>			
		</div><div class="modal-footer">
        <a href="${href}" type="button" class="btn btn-success" ><span class="glyphicon glyphicon-ok-sign"></span>내 앨범 추가</a></a>
        <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> No</button>
      </div>
        </div>
    <!-- /.modal-content --> 
  </div>
        
