<%--
작성자 - 이주연
내용 - 내 앨범 페이지
시작날짜 - 2016/07/17
수정날짜 - 
변경내용 - 
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
 <script src="/Bridge/resources/bootstrap/js/jquery-2.2.3.min.js"></script> 
 <script src="/Bridge/resources/chart.js"></script>
</head>
<style>
#tab {
	border: none;
	background-color: #DF6E76;
	box-shadow: 2px 2px 2px 2px #E0E0E0;
	color: white;
	margin-top: 30px
}
</style>
<body style="margin-top: 4%;">
	<!-- header, sideber start -->
	<%@include file="/WEB-INF/views/include/header.jsp"%>
	<%@include file="/WEB-INF/views/include/sidebar.jsp"%>
	<!-- end -->
	
	 <div class="col-sm-8" style="margin-bottom: 150px">
        	<div class="panel-heading col-md-2" id="tab">
				<h3 class="panel-title">내 앨범</h3>
			</div><br/><br/><br/><br/><br/><br/>
        <div class="table-responsive">   
        
            <div id="check_all">
					<br /> <br /> <br> &nbsp;&nbsp;<input type="checkbox"
						id="checkall" name="checkall"> &nbsp;
					<button class="btn btn-default btn-md" id="listen">
						<span class="glyphicon glyphicon-play" style="color: red"></span>듣기
					</button>
					<button class="btn btn-default btn-md" id="add_listen">
						<span class="glyphicon glyphicon-plus" style="color: green"></span>재생
						목록에 추가
					</button>
					<button class="btn btn-default btn-md" data-toggle="modal" id="download">
						<span class="glyphicon glyphicon-download-alt"></span>다운로드
					</button>
					<button class="btn btn-default btn-md" id="delete" name="myalbum">
						<span class="glyphicon glyphicon-trash"></span>&nbsp;삭제
					</button>
					<button class="btn btn-default btn-md" id="all_listen">
						<span class="glyphicon glyphicon-play" style="color: red"></span>전체
						듣기
					</button>
			</div>
      
              <table id="mytable" class="table table-striped">
                   
                   <thead>
                   
             			<th width="3%"></th>
						<th width="6%">번호</th>
						<th width="18%"></th>
						<th width="15%">곡</th>
						<th width="15%">아티스트</th>
						<th width="15%">앨범</th>
						<th width="7%">듣기</th>
						<th width="8%">재생목록</th>
						<th width="7%">다운</th>
						<th width="7%">뮤비</th>
                   </thead>
                   
                <tbody> 
                   <c:set var="j" value="0"></c:set>
				<c:forEach var="list" items="${MyalbumList}">
					<c:set var="j" value="${j+1}"></c:set>
						<input type="hidden" id="musicNumber" name="musicNumber"
							value="${list.musicNumber}" />
					<tr>
						<td><input type="checkbox" name="check" id="check${j}" value="${list.musicNumber}"></td>
						<td>${j}</td>
						<td><a href="album_detail"><img
								src="/Bridge/resources/image/upload/album/${list.albumImg}" width="70px" /></a></td>
						<td>${list.musicSubject}</td>
						<td><a href="artist_detail">${list.artistName}</a></td>
						<td><a href="album_detail">${list.albumName}</a></td>
						<td width="7%"><button class="btn btn-default btn-xs" onclick="player(${list.musicNumber})">
								<span class="glyphicon glyphicon-play" style="color: red"
									></span>
							</button></td>
						<td width="7%"><button class="btn btn-default btn-xs" onclick="player(${list.musicNumber})">
								<span class="glyphicon glyphicon-plus" style="color: green"></span>
							</button></td>
							<td width="7%"><button class="btn btn-default btn-xs"
									data-title="Download" data-toggle="modal"
									data-target="#Download">
									<span class="glyphicon glyphicon-download-alt"></span>
								</button></td>
							<td width="7%"><a onClick="window.open('iframe?video=${list.musicVideo}','MusicVideo','width=596,height=345,top=100,left=700');return false">
									<button class="btn btn-default btn-xs">
									<span class="glyphicon glyphicon-play-circle"></span>
								</button></a></td>
						</tr>
					</tr>
				</c:forEach>
                </tbody>
                    
            </table>
            </div>
            </div>
	

	<!--  footer start -->
	<%@include file="/WEB-INF/views/include/footer.jsp"%>
	<!-- 다운로드 모달창 시작 -->
<div class="modal fade" id="Download" role="dialog" aria-labelledby="edit" aria-hidden="true">
      <div class="modal-dialog">
    <div class="modal-content"></div>
    <!-- /.modal-content --> 
  </div>
      <!-- /.modal-dialog --> 
    </div>
<!-- 다운로드 모달창  끝 -->    
    
    
    
<!-- 내 앨범 추가 모달 시작 -->
    <div class="modal fade" id="MyAlbum" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
      <div class="modal-dialog">
          <div class="modal-content">
         </div>
    <!-- /.modal-content --> 
     </div>
      <!-- /.modal-dialog --> 
   </div>
<!-- 내 앨범 추가 모달 끝 -->

<!-- 삭제 모달 시작 -->
    <div class="modal fade" id="Delete" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
      <div class="modal-dialog">
          <div class="modal-content">
         </div>
    <!-- /.modal-content --> 
     </div>
      <!-- /.modal-dialog --> 
   </div>
<!-- 삭제 모달 끝 -->
</body>
</html>