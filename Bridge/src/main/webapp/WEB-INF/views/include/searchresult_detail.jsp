<!-- 
   최초 작성일 : 2016/07/28
   작성자 : 조일선
   수정일 : 2016/07/28
   내용 : 헤더의 검색어로 검색
 -->
<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script>
var user = "<c:out value='${userNumber}'/>";

$(document).ready(function() {
   $("#Download").on("show.bs.modal", function (event) {
   var button = $(event.relatedTarget); // Button that triggered the modal
   var musicnumber = button.data("musicnumber"); // Extract info from data-* attributes
   var modal = $(this);

   modal.find(".modal-body a").href("/download_music?musicnumber="+musicnumber);
   });
});

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
         alert("곡을 선택하셨습니다.");
         var list=$("#mytable input[type=checkbox]");
            for(var i = 0 ; i<list.length; i++){
               if(list[i].checked==true){
                  playlistAll.push(list[i].value);
               }
            }
            
         var this_name=$(this).attr('id');
         
         if(this_name=="download"){
            $("#Download").on("show.bs.modal", function (event) {
               var button = $(event.relatedTarget); // Button that triggered the modal
               var modal = $(this);

               modal.find(".modal-body a").href("/download_music_sev?musicnumber="+playlistAll);
               });
         }
            
         }else{
            alert("로그인을 해 주세요!");   
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
         alert("로그인을 해 주세요!");
         return false;
      }else if(tagId=="like"){
         if((this).children().attr('style')==null){
            alert("'좋아요'를 눌러 주셨습니다!");
            $(this).children().css("color","red");
            
         }else if($(this).children().attr('style')!=null){
            alert("'좋아요'가 취소 되었습니다ㅠㅠ");
            $(this).children().css("color","");
         }
      }
   })
});

</script>

   <!-- 차트 시작 -->

      
        <div class="col-sm-11">
        <div class="table-responsive">   
        
              <div id="check_all">
              <input type="hidden" name="" id="" value=""/>
              &nbsp;&nbsp;<input type="checkbox" id="checkall" name="checkall"/>
              <a><button class="btn btn-default btn-xs" id="listen" onclick="PopupWindow()"><span class="glyphicon glyphicon-play" style="color:red"></span>듣기</button></a>
              <button class="btn btn-default btn-xs" id="add_listen"><span class="glyphicon glyphicon-plus" style="color:green"></span>재생 목록에 추가</button>
              <button class="btn btn-default btn-xs" id="myalbum"><span class="glyphicon glyphicon-paste"></span>내 앨범에 담기</button>
              <button class="btn btn-default btn-xs" data-title="Download" data-toggle="modal" data-target="#Download" id="download"><span class="glyphicon glyphicon-download-alt"></span>다운로드</button>
              <button class="btn btn-default btn-xs" id="all_listen" onclick="PopupWindow()"><span class="glyphicon glyphicon-play" style="color:red"></span>전체 듣기</button>
            </div>
      
              <table id="mytable" class="table table-striped">
                   
                   <thead>
                   
                   <th width="3%"></th>
                   <th width="7%"></th>
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
                   <c:forEach begin="0" end="100" var="music" items="${searchList}">

                      <tr>
                         <td width="3%"><input type="checkbox" value="${music.musicNumber}"/></td>
                         <td width="7%"><a href="/album_detail?albumNumber=${music.albumNumber}"><img src="<%=request.getContextPath()%>/upload/album/${music.albumImg}" style="height: 60px; width:60px;"></a></td>
                         <td width="23%">${music.musicSubject}</td>
                         <td width="20%"><a href="/artist_detail?artistNumber=${music.artistNumber}">${music.artistName}</a></td>
                         <td width="7%"><a href="/album_detail?albumNumber=${music.albumNumber}">${music.albumName}</a></td>
                         <td width="7%"><button class="btn btn-default btn-xs"><span class="glyphicon glyphicon-play" style="color:red" onclick="PopupWindow()"></span></button></td>
                         <td width="7%"><button class="btn btn-default btn-xs" id="playlist"><span class="glyphicon glyphicon-plus" style="color:green"></span></button></td>
                         <td width="7%"><a href="/myalbum?musicnumber=${music.musicNumber}"><button class="btn btn-default btn-xs" data-title="MyAlbum" data-toggle="modal" data-target="#MyAlbum" id="myalbum"><span class="glyphicon glyphicon-paste"></span></button></a></td>
                         <td width="7%"><a href="/download_modal?musicnumber=${music.musicNumber}" class="btn btn-default btn-xs" data-toggle="modal" data-target="#Download" id="download"><span class="glyphicon glyphicon-download-alt"></span></a></td>
                         <td width="7%"><a href="https://www.youtube.com/?gl=KR&hl=ko"><button class="btn btn-default btn-xs"><span class="glyphicon glyphicon-play-circle"></span></button></a></td>
                         <td width="7%"><!-- <a href="/like_music?musicnumber=${music.musicNumber}"> -->
                            <button class="btn btn-default btn-xs" id="like">
                            <c:forEach var="like" items="${likeList}">
                               <c:if test="${like eq music.musicNumber}">
                                  <span class="glyphicon glyphicon-heart" style="color:red"></span>
                               </c:if>
                               <c:if test="${like != music.musicNumber}">
                                  <span class="glyphicon glyphicon-heart"></span>
                              </c:if>
                            </c:forEach>
                           
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
          <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
        <h4 class="modal-title custom_align" id="Heading">내 앨범에 추가</h4>
      </div>
          <div class="modal-body">
       
           해당 곡을 내 앨범에 추가하시겠습니까?
      </div>
        <div class="modal-footer ">
        <button type="button" class="btn btn-success" ><span class="glyphicon glyphicon-ok-sign"></span> Yes</button>
        <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> No</button>
      </div>
        </div>
    <!-- /.modal-content --> 
  </div>
      <!-- /.modal-dialog --> 
    </div>
    
    <!-- 페이징 -->
  <div class="col-xs-5 col-xs-offset-5">
       <nav>
      <ul class="pagination">
          <li><a href="headersearch?bno=${paging.firstPageNo}&headersearch=${paging.search}" class="first">처음 페이지</a></li>
         <li> <a href="headersearch?bno=${paging.prevPageNo}&headersearch=${paging.search}" class="prev">이전 페이지</a></li>
          <li>
              <c:forEach var="i" begin="${paging.startPageNo}" end="${paging.endPageNo}" step="1">
                  <c:choose>
                      <c:when test="${i eq paging.pageNo}"><a href="headersearch?bno=${i}&headersearch=${paging.search}" class="choice">${i}</a></c:when>
                      <c:otherwise><a href="headersearch?bno=${i}&headersearch=${paging.search}">${i}</a></c:otherwise>
                  </c:choose>
              </c:forEach>
          <li>
         <li> <a href="headersearch?bno=${paging.nextPageNo}&headersearch=${paging.search}" class="next">다음 페이지</a></li>
          <li><a href="headersearch?bno=${paging.finalPageNo}&headersearch=${paging.search}" class="last">마지막 페이지</a></li>
      </ul>
      </nav>
   </div>
<!-- 내 앨범 추가 모달 끝 -->