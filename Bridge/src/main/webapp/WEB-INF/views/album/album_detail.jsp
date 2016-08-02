<%--
작성자 - 조일선
내용 - 앨범 정보 페이지
시작날짜 - 2016/07/19
수정날짜 - 2016/07/20
		2016/07/27
변경내용 - 07/20 : 앨범내용출력, 댓글
		07/21 : 댓글 출력, 입력, 삭제, 더 보기
		07/27 : 곡 출력, 앨범 번호로 실제 DB 출력, 한마디 갯수, 더보기 세부사항
 --%>
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<link href="/resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
<!-- <script src="/resources/bootstrap/js/jquery-2.2.3.min.js"></script>
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
 -->

</head>

<body style="margin-top: 4%;">
<script>
	var replyCnt = 10; // 더보기를 위한
	var replyFirst = false; // 초기화를 위한
	var replyLast = false; // 마지막 페이지 인지
	
	// 댓글 가져오기 기능
	function getReply(start, end){	
		$.ajax({
				type : "POST",			 
				url : "albumGetReplyList",			
				data : {"start" : start,
						"end" : end,
						"albumNumber" : '${albumVO.albumNumber}'},		
				dataType : "json",
				success : function(data){
					replyLast = false;
					if(data.length != 10) // 가져온 댓글 갯수가 10이 아니면 마지막 페이지!
						replyLast = true;		
					
					var sessionUserNumber = '${usernumber}';					
					for(var i=0; i<data.length; i++){
						var albumReplyVO = data[i];				
						if(albumReplyVO.replyDept == 0){ // 기본 댓글
							$("#replyTable").append('<tr>' +
									'<th rowspan="2" width="20%">' + albumReplyVO.userId + '</th>' +
									'<td>' + albumReplyVO.replyContext + '</td>' +
								'</tr>' +
								'<tr>' +
									'<td>' + albumReplyVO.replyDate + (sessionUserNumber==albumReplyVO.userNumber? '<button id="replyDel' + albumReplyVO.replyNumber + '">삭제</button>' : '')+ '| <a data-toggle="collapse" href="#reply'+ albumReplyVO.replyNumber + '">답글쓰기 V</a>' +														
										'<div id="reply' + albumReplyVO.replyNumber + '" class="panel-collapse collapse">' +    					    
											'<div class="col-md-11">' +
													'<textarea rows="3" style="width: 100%; height: 100%; resize: none;" id="replyContent' + albumReplyVO.replyNumber + '"></textarea>' +
												'</div>' +
												'<div class="col-md-1" style="height: 70px; padding: 0px">' +
													'<button class="btn btn-default form-control" style="height: 100%" id="replyButton' + albumReplyVO.replyNumber + '">등록</button>' +
											'</div>' +
										'</div>' +	
									'</td>' +		
								'</tr>');
						}else{ // 리댓글
							$("#replyTable").append('<tr>' +
									'<th rowspan="2" width="20%">&nbsp;└─&nbsp;&nbsp;  ' + albumReplyVO.userId + '</th>' +
									'<td>' + albumReplyVO.replyContext + '</td>' +							
								'</tr>' +
								'<tr>' +
									'<td>' + albumReplyVO.replyDate +  (sessionUserNumber==albumReplyVO.userNumber? '<button id="replyDel' + albumReplyVO.replyNumber + '">삭제</button>' : '') + '</td>' +
								'</tr>');
						}						
					} 	
					if(!replyFirst)
						firstReadyReply();
					readyReply(); // 댓글의 창이 모두 만들어진 후에 실행되게 하기 위해서
					if(replyLast == true){ // 마지막 페이지일때 더보기 버튼 숨기기
						$("#moreView").hide();
					}else{
						$("#moreView").show();
					}
				}			
			});
	}
	
	getReply(1, 10); // 화면이 초기화 된 후 댓글 가져옴(처음에는 상위 10개의 댓글만 가져옴!)
	
	function firstReadyReply(){ 
		replyFirst = true;// 초기화 했다는 flag
		$("#DefaultReplyButton").click(function(){				
			var replyNumber = Number(0);	
			var replyContext = $("#DefaultReplyContent").val(); // 작성한 댓글 내용		
			var albumNumber = '${albumVO.albumNumber}';		
			
			ajaxWriteReply(replyNumber, replyContext, albumNumber);
		});	
	}
	
	function ajaxWriteReply(replyNumber, replyContext, albumNumber){
		if('${empty usernumber}' == true){ // 세션이 없으면 댓글 달 수 없음!
			alert("회원만 댓글을 달 수 있습니다.");			
		}else{
		 $.ajax({
				type : "POST",	 
				url : "albumReplyWrite",
				data : {"replyNumber" : replyNumber,
						"replyContext" : replyContext,
						"albumNumber" : albumNumber},		
				dataType : "text",
				success : function(data){						
					$("#DefaultReplyContent").val("");
					$("#replyTable").empty(); // 초기화
					getReply(1, replyCnt);
					
					var cnt = Number($("#replyCnt").text()) + 1;// 댓글 갯수 초기화
					$("#replyCnt").text(cnt);
				},				
			}); 
		}
	}
	
	function readyReply(){ // 댓글의 창이 모두 만들어진 후에 실행되게 하기 위해서
		// 댓글 작성 기능	
		$("button[id^=replyButton]").click(function(){		
			var replyNumber = $(this).attr("id").replace(/[^0-9]/g,''); // 0이면 그냥 댓글, 1이상이면 대댓글			
			var replyContext = $("#replyContent" + replyNumber).val(); // 작성한 댓글 내용		
			var albumNumber = '${albumVO.albumNumber}';		
			
			ajaxWriteReply(replyNumber, replyContext, albumNumber);
			
		});		
	
		// 댓글 삭제 기능
		$("button[id^=replyDel]").click(function(){	
			if(confirm("정말 삭제하시겠습니까?")){
				var replyNumber = $(this).attr("id").replace(/[^0-9]/g,''); // 삭제할 댓글 번호						
				 $.ajax({
					type : "POST",	 
					url : "albumDeleteReply",
					data : {"replyNumber" : replyNumber},		
					dataType : "text",
					success : function(data){	
						$("#replyTable").empty(); // 초기화
						getReply(1, replyCnt);
						
						var cnt = Number($("#replyCnt").text()) - 1; // 댓글 갯수 초기화
						$("#replyCnt").text(cnt);
					},				
				});
				

			}
		});		
		
	}
	
	// 더보기를 위한
	function reGetReply(){
		replyCnt += 10;	
	}
	
	
	
	// 체크박스 전체 선택/해제를 위한 jquery
	$(function(){
		$("#allCheck").click(function(){
			if($(this).is(":checked")){ // 전체체크
				$("input[id^=check]").prop("checked", true);
			}else{
				$("input[id^=check]").prop("checked", false);
			}
		});	
	});		
	
</script>	

	<h2>${albumVO.albumName}</h2>
	<hr>
	<div class="container"> <!-- 첫 번째 블럭(사진, 앨범 소개) start -->	
		<div class="col-md-5">
			<img src="<%=request.getContextPath()%>/upload/album/${albumVO.albumImg}" width="60%">
		</div>
		<div class="col-md-7" style="vertical-align: middle;">
			<table class="table" style="vertical-align: middle;">
				<tr>
					<td>아티스트</td>
					<td>${albumVO.artistName}</td>
				</tr>
				<tr>
					<td>앨범 종류</td>
					<td>${albumVO.albumType}</td>
				</tr>
				<tr>
					<td>발매일</td>
					<td>${albumVO.albumDate}</td>
				</tr>
				<tr>
					<td>장르</td>
					<td>${albumVO.albumGenre}</td>
				</tr>
			</table>
		</div>
	</div><!-- 첫 번째 블럭(사진, 앨범 소개) end -->
	<br><br>
	<!-- ----------------------------------  -->
	
	<div class="container"><!-- 두 번째 블럭(수록곡) start -->
		<h3>수록곡(${fn:length(musicList)})</h3>
		<div><!-- 버튼들 -->
			<input type="checkbox" id="allCheck">
			<button class="btn">듣기</button>
			<button class="btn">재생목록에 추가</button>
			<button class="btn">내 앨범에 담기</button>
			<button class="btn">다운로드</button>
			<button class="btn">전체듣기</button>
		</div>
		<br>
		<table class="table">
			<tr>
				<th width="3%"></th><!-- 체크박스열 -->
				<th width="5%">번호</th>
				<th width="30%">곡</th>
				<th width="20%">아티스트명</th>
				<th width="7%">듣기</th>
				<th width="8%">재생목록</th>
				<th width="7%">내앨범</th>
				<th width="7%">다운</th>
				<th width="7%">뮤비</th>
				<th width="7%">좋아</th>						
			</tr>
			
			<c:set var="cnt" value="1"/>
			<c:forEach var="musicVO" items="${musicList}" >				
				<tr>
					<td><input type="checkbox" id="check${musicVO.musicNumber}"></td>
					<td>${cnt}</td>
					<td>${musicVO.musicSubject} &nbsp; <c:if test="${musicVO.musicTitle == 1}"><img src="/resources/images/musicTitle.png" width="15%"/></c:if></td>
					<td>${musicVO.artistName}</td>
					<td>듣기</td>
					<td>재생목록</td>
					<td>내앨범</td>
					<td>다운</td>
					<td>뮤비</td>
					<td>좋아</td>				
				</tr>
				<c:set var="cnt" value="${cnt+1}"/>
			</c:forEach>
		</table>
		
	</div><!-- 두 번째 블럭(수록곡) end -->
	<br><br>
	<!-- ----------------------------------  -->
	<div class="container"><!-- 세 번째 블럭(앨범소개) start -->
		<h3>앨범 소개</h3>
		<div class="col-md-offset-2 col-md-10">			
			${albumVO.albumContent}			
			<!-- <a data-toggle="collapse" href="#albumInfo">더보기</a>		   
			<div id="albumInfo" class="panel-collapse collapse">        
				작년 10월 첫 미니 앨범 ‘I’ 발매, 돌풍을 일으킨 태연.<br>
				첫 미니 앨범 ‘I’로 국내 음원 및 음반 차트 1위, 아이튠즈 종합 앨범 차트 1위, 미국 빌보드 월드 앨범 차트 1위 등 국내외 각종 차트 정상을 <br>
				석권해 글로벌한 관심과 인기를 입증했음은 물론, SM엔터테인먼트의 디지털 음원 공개 채널 ‘STATION’을 통해 선보인 ‘Rain’, <br>
				CM송 ‘제주도의 푸른 밤’ 등 발표하는 곡마다 음원 차트 1위를 싹쓸이하며 믿고 듣는 음원퀸으로 자리매김한 만큼, <br>
				그녀의 새로운 음악에 이목이 집중될 전망이다.
			</div>	 -->		
		</div>
	</div><!-- 세 번째 블럭(앨범소개) end -->
	
	<!-- ----------------------------------  -->
	<br><br>
	<div class="container"><!-- 네 번째 블럭(뮤직비디오) start -->
		
		<h3>이 앨범의 뮤직비디오</h3>
		<div>
			<c:forEach var="videoVO" items="${videoList}" >				
				<div class="col-xs-6 col-md-4">
					<a href="https://www.youtube.com/watch?v=${videoVO.musicVideo}">
						<div class="thumbnail" style="width: 80%">
							<img src="https://img.youtube.com/vi/${videoVO.musicVideo}/0.jpg">
							<div class="caption">
								<p>제목 : ${videoVO.musicSubject}</p>
								<p>가수 : ${videoVO.artistName}</p>
								<p>발매일 : ${videoVO.albumDate}</p>
							</div>
						</div>
					</a>
				</div>					
			</c:forEach>			
		</div>
	</div><!-- 네 번째 블럭(뮤직비디오) end -->
	
	<!-- ----------------------------------  -->
	<br><br>
	<div class="container"><!-- 다섯 번째 블럭(한마디) start -->
		<h3>한마디(<label id="replyCnt">${replyCnt}</label>)</h3>
		<div><!-- 텍스트박스와 입력 버튼-->
			<div class="col-md-11">
				<textarea rows="5" style="width: 100%; height: 100%; resize: none;" id="DefaultReplyContent"></textarea>
			</div>
			<div class="col-md-1" style="height: 100px; padding: 0px">
				<button class="btn btn-default btn-lg form-control" style="height: 100%" id="DefaultReplyButton">등록</button>
			</div>
		</div><!-- 텍스트박스와 입력 버튼 end-->
		
		<div><!-- 한마디 테이블 start -->
			<table class="table" id="replyTable">				
			</table>			
			<center><a onclick="getReply(replyCnt+1, replyCnt+10);reGetReply();" id="moreView">더 보기</a></center>
		</div><!-- 한마디 테이블  end -->
	</div><!-- 다섯 번째 블럭(한마디) end -->
	
		<%@include file="../include/footer.jsp"%>
</body>
</html>