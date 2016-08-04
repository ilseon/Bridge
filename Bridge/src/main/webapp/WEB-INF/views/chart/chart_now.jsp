<!-- 
   최초 작성일 : 2016-07-17
   작성자 : 정효진
   수정일 : 2016-08-01
   수정 내용 : 앨범 이미지 출력
   내용 : 실시간 차트 페이지
 -->

<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<script>
function player(num){
	var Clip;
	var tmp=false;
	
	 if (tmp==false){       //최초 클릭이면 팝업을 띄운다
		 
		  Clip =window.open("player?val="+num,"new","width=500, height=900, resizable=no, scrollbars=no, status=no, location=no, directories=no;");
		  tmp = true;
		 }else{
	 			if(tmp==true){
	
	 		 }
		 }
 
 
 
}; 
</script>
   <!-- 차트 시작 -->

      
        <div class="col-sm-11">
        <div class="table-responsive">   
        
              <div id="check_all">
              &nbsp;&nbsp;<input type="checkbox" id="checkall" name="checkall"/>
              <button class="btn btn-default btn-xs" id="listen"><span class="glyphicon glyphicon-play" style="color:red"></span>듣기</button>
              <button class="btn btn-default btn-xs" id="add_listen"><span class="glyphicon glyphicon-plus" style="color:green"></span>재생 목록에 추가</button>
              <button class="btn btn-default btn-xs" id="myalbum"  data-toggle="modal"><span class="glyphicon glyphicon-paste"></span>내 앨범에 담기</button>
              <button class="btn btn-default btn-xs" data-toggle="modal" id="download"><span class="glyphicon glyphicon-download-alt"></span>다운로드</button>
              <button class="btn btn-default btn-xs" id="all_listen"><span class="glyphicon glyphicon-play" style="color:red"></span>전체 듣기</button>
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
                         <td width="7%">${rank} &nbsp;<a href="/test"><img src="<%=request.getAttribute("realpath")%><c:out value="${music.albumImg}"/>" style="height:60px; width:60px;"/></a></td>
                         <td width="23%">${music.musicSubject}</td>
                         <td width="20%"><a href="/artist_detail?artistNumber=${music.artistNumber}">${music.artistName}</a></td>
                         <td width="7%"><a href="/album_detail?albumNumber=${music.albumNumber}">${music.albumName}</a></td>
                         <td width="7%"><button class="btn btn-default btn-xs"><span class="glyphicon glyphicon-play" style="color:red" onclick="player(${music.musicNumber})"></span></button></td>
                         <td width="7%"><button class="btn btn-default btn-xs" id="playlist" onclick="player(${music.musicNumber})"><span class="glyphicon glyphicon-plus" style="color:green"></span></button></td>
                         <td width="7%"><a href="/myalbum_modal?musicnumber=${music.musicNumber}" class="btn btn-default btn-xs" data-toggle="modal" data-target="#MyAlbum" id="myalbum"><span class="glyphicon glyphicon-paste"></span></button></a></td>
                         <td width="7%"><a href="/download_modal?musicnumber=${music.musicNumber}" class="btn btn-default btn-xs" data-toggle="modal" data-target="#Download" id="download"><span class="glyphicon glyphicon-download-alt"></span></a></td>
                         <td width="7%"><a href="#" onClick="window.open('iframe?video=${music.musicVideo}','MusicVideo','width=596,height=345,top=100,left=700');return false"><button class="btn btn-default btn-xs"><span class="glyphicon glyphicon-play-circle"></span></button></a></td>
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

