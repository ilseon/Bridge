<!-- 
	최초 작성일 : 2016-07-17
	작성자 : 정효진
	수정일 : 2016-07-19
	내용 : 실시간 차트 페이지
 -->

<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script>
var user="${usernumber}";

/*
$(document).ready(function() {
	$("#Download").on("show.bs.modal", function (event) {
	var button = $(event.relatedTarget); // Button that triggered the modal
	var musicnumber = button.data("musicnumber"); // Extract info from data-* attributes
	var modal = $(this);

	modal.find(".modal-body a").href("/download_music?musicnumber="+musicnumber);
	});
});*/

//checkbox 전체 선택
$(document).ready(function(){
	$("#checkall").click(function () {
	        if ($("#checkall").is(':checked')) {
	            $("#mytable input[type=checkbox]").each(function () {
	                $(this).prop("checked", true);
	            });

	        } else {
	            $("#mytable input[type=checkbox]").each(function () {
	                $(this).prop("checked", false);
	            });
	        }
	    });
	});
	
var playlistAll = new Array();
	
//여러 곡을 선택한 경우
$(function(){
	$("#check_all .btn").click(function(){
		if($(this).attr('id')=="all_listen"){
			$("#mytable input[type=checkbox]").each(function () {
              $(this).prop("checked", true);
         	});	
		}
		if($("#mytable input[type=checkbox]").is(":checked")){
			if(user!=""){
			var list=$("#mytable input[type=checkbox]");
				for(var i = 0 ; i<list.length; i++){
					if(list[i].checked==true){
						playlistAll.push(list[i].value);
					}
				}
				
			var this_name=$(this).attr('id');
			
			if(this_name=="download"){
				$('#Download').modal({
			        remote: '/download_modal_sev?playlistAll='+playlistAll
				});
			}else if(this_name="myalbum"){
				$('#MyAlbum').modal({
			        remote: '/myalbum_modal_sev?playlistAll='+playlistAll
				});
			}
				
			}else{
				alert("로그인 후 이용하실 수 있는 서비스입니다!");	
			}
		}else if($("#mytable input[type=checkbox]:not(checked)")){
			alert("곡을 선택해 주세요!");
			return false;
		}
	})
});



//한 곡에 대한 선택 사항 처리
$(function(){
	$("#mytable .btn[id]").click(function(){
		var tagId = $(this).attr('id');
		if(user==""){
			alert("로그인 후 이용하실 수 있는 서비스입니다!");
			return false;
		}else if(tagId=="like"){
			if($(this).find("span").attr('style')==null){
				$.post("/like_music?musicnumber="+$(this).find("span").attr('id'));
				alert("'좋아요'를 눌러 주셨습니다!");
				$(this).find("span").css("color","red");
				
			}else if($(this).find("span").attr('style')!=null){
				$.get("/like_music_cancel?musicnumber="+$(this).find("span").attr('id'));
				alert("'좋아요'가 취소 되었습니다ㅠㅠ");
				$(this).find("span").css("color","");
			}
		}
	})
});

</script>

	<!-- 차트 시작 -->

		
        <div class="col-sm-11">
        <div class="table-responsive">   
        
        		<div id="check_all">
		        &nbsp;&nbsp;<input type="checkbox" id="checkall" name="checkall"/>
		        <a><button class="btn btn-default btn-xs" id="listen" onclick="PopupWindow()"><span class="glyphicon glyphicon-play" style="color:red"></span>듣기</button></a>
		        <button class="btn btn-default btn-xs" id="add_listen"><span class="glyphicon glyphicon-plus" style="color:green"></span>재생 목록에 추가</button>
		        <button class="btn btn-default btn-xs" id="myalbum"  data-toggle="modal"><span class="glyphicon glyphicon-paste"></span>내 앨범에 담기</button>
		        <button class="btn btn-default btn-xs" data-toggle="modal" id="download"><span class="glyphicon glyphicon-download-alt"></span>다운로드</button>
		        <button class="btn btn-default btn-xs" id="all_listen" onclick="PopupWindow()"><span class="glyphicon glyphicon-play" style="color:red"></span>전체 듣기</button>
				</div>
		
              <table id="mytable" class="table table-striped">
                   
                   <thead>
                   
                   <th width="3%"></th>
                   <th width="7%">순위</th>
                   <th width="23%">곡</th>
                   <th width="20%">아티스트</th>
                   <th width="7%">앨범</th>
                   <th width="7%">듣기</th>
                   <th width="7%">재생목록</th>
                   <th width="7%">내앨범</th>
                   <th width="7%">다운</th>
                   <th width="7%">뮤비</th>
                   <th width="7%">좋아</th>
                   </thead>
                   
				    <tbody> 
				    	<c:set var="rank" value="0"/>
				    	<c:forEach begin="0" end="100" var="music" items="${musicList}">
						<c:set var="rank" value="${rank+1}"/>
						    <tr>
							    <td width="3%"><input type="checkbox" value="${music.musicNumber}"/></td>
							    <td width="7%">${rank} &nbsp;<a href="/test"><img src="upload\album\<c:out value="${music.albumImg}"/>" style="height: 60px; width:60px;"></a></td>
							    <td width="23%">${music.musicSubject}</td>
							    <td width="20%"><a href="/test2"></a>${music.artistName}</td>
							    <td width="7%">${music.albumName}</td>
							    <td width="7%"><button class="btn btn-default btn-xs"><span class="glyphicon glyphicon-play" style="color:red" onclick="PopupWindow()"></span></button></td>
							    <td width="7%"><button class="btn btn-default btn-xs" id="playlist"><span class="glyphicon glyphicon-plus" style="color:green"></span></button></td>
							    <td width="7%"><a href="/myalbum_modal?musicnumber=${music.musicNumber}" class="btn btn-default btn-xs" data-toggle="modal" data-target="#MyAlbum" id="myalbum"><span class="glyphicon glyphicon-paste"></span></button></a></td>
							    <td width="7%"><a href="/download_modal?musicnumber=${music.musicNumber}" class="btn btn-default btn-xs" data-toggle="modal" data-target="#Download" id="download"><span class="glyphicon glyphicon-download-alt"></span></a></td>
							    <td width="7%"><a href="https://www.youtube.com/?gl=KR&hl=ko"><button class="btn btn-default btn-xs"><span class="glyphicon glyphicon-play-circle"></span></button></a></td>
							    <td width="7%">
							    	<button class="btn btn-default btn-xs" id="like">
							    	<c:set var="like_is" value="no"/>
							    	<c:forEach var="like" items="${likeList}">
							    		<c:if test="${like.musicNumber eq music.musicNumber}">
							    			<span class="glyphicon glyphicon-heart" style="color:red" id="${music.musicNumber}"></span>
							    			<c:set var="like_is" value="yes"/>
							    		</c:if>
							    	</c:forEach>
									<c:if test="${like_is eq 'no'}">
										<span class="glyphicon glyphicon-heart" id="${music.musicNumber}"></span>
									</c:if>
							    	</button><!-- </a> --></td>
						    </tr>
					    </c:forEach>
				    </tbody>
				        
				</table>
            </div>
            </div>

</div>
<!-- 차트 끝 -->
</div>

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
