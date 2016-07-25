<%--
작성자 - 조일선
내용 - 가수 정보 페이지
시작날짜 - 2016/07/19
수정날짜 - 2016/07/20
변경내용 - 07/20 : 가수내용출력, 댓글
		07/21 : 댓글 출력, 입력, 삭제, 더 보기
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <link href="/resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
  <script src="/resources/bootstrap/js/jquery-2.2.3.min.js"></script>
    <script src="/resources/bootstrap/js/bootstrap.min.js"></script>
</head>
<%@include file="../include/header.jsp" %>
<%@include file="../include/sidebar.jsp" %>
<body style="margin-top: 4%;">
<script>
	var replyCnt = 10; // 더보기를 위한
	var replyFirst = false; // 초기화를 위한
	var replyLast = false; // 마지막 페이지 인지
	
	// 댓글 가져오기 기능
	function getReply(start, end){	
		$.ajax({
				type : "POST",			 
				url : "getReplyList",			
				data : {"start" : start,
					"end" : end},		
				dataType : "json",
				success : function(data){
					if(data.length < 10) // 가져온 댓글 갯수가 10보다 작으면 마지막 페이지!
						replyLast = true;		
					
					var sessionUserNumber = '${usernumber}';					
					for(var i=0; i<data.length; i++){
						var artistReplyVO = data[i];				
						if(artistReplyVO.replyDept == 0){ // 기본 댓글
							$("#replyTable").append('<tr>' +
									'<th rowspan="2" width="20%">' + artistReplyVO.userNumber + '</th>' +
									'<td>' + artistReplyVO.replyContext + '</td>' +
								'</tr>' +
								'<tr>' +
									'<td>' + artistReplyVO.replyDate + (sessionUserNumber==artistReplyVO.userNumber? '<button id="replyDel' + artistReplyVO.replyNumber + '">삭제</button>' : '')+ '| <a data-toggle="collapse" href="#reply'+ artistReplyVO.replyNumber + '">답글쓰기 V</a>' +														
										'<div id="reply' + artistReplyVO.replyNumber + '" class="panel-collapse collapse">' +    					    
											'<div class="col-md-11">' +
													'<textarea rows="3" style="width: 100%; height: 100%; resize: none;" id="replyContent' + artistReplyVO.replyNumber + '"></textarea>' +
												'</div>' +
												'<div class="col-md-1" style="height: 70px; padding: 0px">' +
													'<button class="btn btn-default form-control" style="height: 100%" id="replyButton' + artistReplyVO.replyNumber + '">등록</button>' +
											'</div>' +
										'</div>' +	
									'</td>' +		
								'</tr>');
						}else{ // 리댓글
							$("#replyTable").append('<tr>' +
									'<th rowspan="2" width="20%">&nbsp;└─&nbsp;&nbsp;  ' + artistReplyVO.userNumber + '</th>' +
									'<td>' + artistReplyVO.replyContext + '</td>' +							
								'</tr>' +
								'<tr>' +
									'<td>' + artistReplyVO.replyDate +  (sessionUserNumber==artistReplyVO.userNumber? '<button id="replyDel' + artistReplyVO.replyNumber + '">삭제</button>' : '') + '</td>' +
								'</tr>');
						}						
					} 	
					if(!replyFirst)
						firstReadyReply();
					readyReply(); // 댓글의 창이 모두 만들어진 후에 실행되게 하기 위해서
					if(replyLast) // 마지막 페이지일때 더보기 버튼 숨기기
						$("#moreView").hide();
				}			
			});
	}
	
	getReply(1, 10); // 화면이 초기화 된 후 댓글 가져옴(처음에는 상위 10개의 댓글만 가져옴!)
	
	function firstReadyReply(){ 
		replyFirst = true;// 초기화 했다는 flag
		$("#DefaultReplyButton").click(function(){				
			var replyNumber = Number(0);	
			var replyContext = $("#DefaultReplyContent").val(); // 작성한 댓글 내용		
			var artistNumber = '${artistVO.artistNumber}';		
			
			ajaxWriteReply(replyNumber, replyContext, artistNumber);
		});	
	}
	
	function ajaxWriteReply(replyNumber, replyContext, artistNumber){
		 $.ajax({
				type : "POST",	 
				url : "replyWrite",
				data : {"replyNumber" : replyNumber,
						"replyContext" : replyContext,
						"artistNumber" : artistNumber},		
				dataType : "text",
				success : function(data){						
					$("#DefaultReplyContent").val("");
					$("#replyTable").empty(); // 초기화
					getReply(1, replyCnt);
				},				
			}); 
	}
	
	function readyReply(){ // 댓글의 창이 모두 만들어진 후에 실행되게 하기 위해서
		// 댓글 작성 기능	
		$("button[id^=replyButton]").click(function(){		
			var replyNumber = $(this).attr("id").replace(/[^0-9]/g,''); // 0이면 그냥 댓글, 1이상이면 대댓글			
			var replyContext = $("#replyContent" + replyNumber).val(); // 작성한 댓글 내용		
			var artistNumber = '${artistVO.artistNumber}';		
			
			ajaxWriteReply(replyNumber, replyContext, artistNumber);
		});		
	
		// 댓글 삭제 기능
		$("button[id^=replyDel]").click(function(){	
			if(confirm("정말 삭제하시겠습니까?")){
				var replyNumber = $(this).attr("id").replace(/[^0-9]/g,''); // 삭제할 댓글 번호						
				 $.ajax({
					type : "POST",	 
					url : "deleteReply",
					data : {"replyNumber" : replyNumber},		
					dataType : "text",
					success : function(data){	
						$("#replyTable").empty(); // 초기화
						getReply(1, replyCnt);
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
	<h2>${artistVO.artistName}</h2>
	<hr>
	<div class="container"> 
		<!-- 첫 번째 블럭(사진, 가수 소개) start -->
		<div class="col-md-5">
			<img src="/resources/image/ty.png" width="50%">
		</div>
		<div class="col-md-7">
			<table class="table">
				<tr>
					<td>유형</td>
					<td>${artistVO.artistType}</td>
				</tr>
				<tr>
					<td>장르</td>
					<td>${artistVO.artistGenre}</td>
				</tr>				
			</table>
		</div>
	</div>
	<!-- 첫 번째 블럭(사진, 가수 소개) end -->
	<br><br>
	<!-- ----------------------------------  -->
	
	<div class="container">
	<!-- 두 번째 블럭(곡) start -->
		<h3>수록곡(3)</h3>
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
				<th width="4%">번호</th>
				<th width="30%">곡</th>
				<th width="20%">아티스트명</th>
				<th width="7%">듣기</th>
				<th width="8%">재생목록</th>
				<th width="7%">내앨범</th>
				<th width="7%">다운</th>
				<th width="7%">뮤비</th>
				<th width="7%">좋아</th>				
			</tr>
			
			<c:forEach begin="1" end="7" var="j">
				<tr>
					<td><input type="checkbox" id="check${j}"></td>
					<td>${j}</td>
					<td>Why</td>
					<td>태연</td>
					<td>듣기</td>
					<td>재생목록</td>
					<td>내앨범</td>
					<td>다운</td>
					<td>뮤비</td>
					<td>좋아</td>				
				</tr>
			</c:forEach>
		</table>
		
	</div><!-- 두 번째 블럭(곡) end -->
	<br><br>
	<!-- ----------------------------------  -->
	<div class="container"><!-- 세 번째 블럭(앨범) start -->
		<h3>앨범</h3>
		<div class="row">
			<c:forEach begin="1" end="5" var="k">			
				<div class="col-md-3">
					<img src="/resources/image/album${k}.png" width="70%">
					<div>
						<h5>앨범제목</h5>
						<h5>태연</h5>
						<h5>발행일</h5>
					</div>
				</div>
			</c:forEach>
		</div>
	</div><!-- 세 번째 블럭(앨범) end -->
	
	<!-- ----------------------------------  -->
	<br><br>
	<div class="container"><!-- 네 번째 블럭(뮤직비디오) start -->		
		<h3>이 앨범의 뮤직비디오</h3>
		<div>
			<c:forEach begin="1" end="3" var="q">
				<div class="col-md-3">
					<img src="/resources/image/mv${q}.png" width="80%">
				</div>
			</c:forEach>
		</div>
	</div><!-- 네 번째 블럭(뮤직비디오) end -->
	
	<!-- ----------------------------------  -->
	<br><br>
	
	<div class="container"><!-- 다섯 번째 블럭(한마디) start -->
		<h3>한마디(12)</h3>
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
			<center><a onclick="getReply(replyCnt+1, replyCnt+10);reGetReply();" id="moreView">10개 더 보기</a></center>
		</div><!-- 한마디 테이블  end -->
	</div><!-- 다섯 번째 블럭(한마디) end -->
</body>
</html>