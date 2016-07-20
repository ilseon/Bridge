<%--
작성자 - 조일선
내용 - 앨범 정보 페이지
시작날짜 - 2016/07/19
수정날짜 - 
변경내용 - 
 --%>
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
	// 체크박스 전체 선택/해제를 위한 jquery
	$(function(){
		$("#allCheck").click(function(){
			if($(this).is(":checked")){ // 전체체크
				$("input[id^=check").prop("checked", true);
			}else{
				$("input[id^=check").prop("checked", false);
			}
		});
	});	
</script>

	<h2>Why - The 2nd Mini Album (앨범 제목)</h2>
	<hr>
	<div class="container"> <!-- 첫 번째 블럭(사진, 앨범 소개) start -->
		<div class="col-md-5">
			<img src="/resources/image/album.PNG" width="60%">
		</div>
		<div class="col-md-7" style="vertical-align: middle;">
			<table class="table" style="vertical-align: middle;">
				<tr>
					<td>아티스트</td>
					<td>태연</td>
				</tr>
				<tr>
					<td>앨범 종류</td>
					<td>미니</td>
				</tr>
				<tr>
					<td>발매일</td>
					<td>2016.06.27</td>
				</tr>
				<tr>
					<td>장르</td>
					<td>발라드</td>
				</tr>
			</table>
		</div>
	</div><!-- 첫 번째 블럭(사진, 앨범 소개) end -->
	<br><br>
	<!-- ----------------------------------  -->
	
	<div class="container"><!-- 두 번째 블럭(수록곡) start -->
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
		
	</div><!-- 두 번째 블럭(수록곡) end -->
	<br><br>
	<!-- ----------------------------------  -->
	<div class="container"><!-- 세 번째 블럭(앨범소개) start -->
		<h3>앨범 소개</h3>
		<div class="col-md-offset-2 col-md-10">			
			믿고 듣는 음원퀸 태연, 솔로 컴백!<br>
			두 번째 미니앨범 ‘Why’ 발매!<br>
			-폭넓은 음악 스타일 확인케하는 7곡 수록! 딘, 효연 피처링 참여!<br>
			
			<a data-toggle="collapse" href="#albumInfo">더보기</a>		   
			<div id="albumInfo" class="panel-collapse collapse">        
				작년 10월 첫 미니 앨범 ‘I’ 발매, 돌풍을 일으킨 태연.<br>
				첫 미니 앨범 ‘I’로 국내 음원 및 음반 차트 1위, 아이튠즈 종합 앨범 차트 1위, 미국 빌보드 월드 앨범 차트 1위 등 국내외 각종 차트 정상을 <br>
				석권해 글로벌한 관심과 인기를 입증했음은 물론, SM엔터테인먼트의 디지털 음원 공개 채널 ‘STATION’을 통해 선보인 ‘Rain’, <br>
				CM송 ‘제주도의 푸른 밤’ 등 발표하는 곡마다 음원 차트 1위를 싹쓸이하며 믿고 듣는 음원퀸으로 자리매김한 만큼, <br>
				그녀의 새로운 음악에 이목이 집중될 전망이다.
			</div>			
		</div>
	</div><!-- 세 번째 블럭(앨범소개) end -->
	
	<!-- ----------------------------------  -->
	<br><br>
	<div class="container"><!-- 네 번째 블럭(뮤직비디오) start -->
		
		<h3>이 앨범의 뮤직비디오</h3>
		<div>
			<img src="/resources/image/mv.PNG">
		</div>
	</div><!-- 네 번째 블럭(뮤직비디오) end -->
	
	<!-- ----------------------------------  -->
	<br><br>
	<div class="container"><!-- 다섯 번째 블럭(한마디) start -->
		<h3>한마디(12)</h3>
		<div class="row"><!-- 텍스트박스와 입력 버튼-->
			<div class="col-md-11">
				<textarea rows="5" style="width: 100%; height: 100%; resize: none;"></textarea>
			</div>
			<div class="col-md-1" style="height: 100px; padding: 0px">
				<button class="btn btn-default btn-lg form-control" style="height: 100%;">등록</button>
			</div>
		</div><!-- 텍스트박스와 입력 버튼 end-->
		
		<div><!-- 한마디 테이블 start -->
			<table class="table">
				<c:forEach begin="1" end="12" var="i">
					<tr>
						<th rowspan="2" width="20%">test${i}</th>
						<td>굳!</td>
					</tr>
					<tr>
						<td>2016.07.06 15:12 | <a data-toggle="collapse" href="#reply${i}">답글쓰기 V</a>
						
						<div id="reply${i}" class="panel-collapse collapse"> 
							<div class="row">   					    
								<div class="col-md-11">
									<textarea rows="3" style="width: 100%; height: 100%; resize: none;"></textarea>
								</div>
								<div class="col-md-1" style="height: 70px; padding: 0px">
									<button class="btn btn-default form-control" style="height: 100%">등록</button>
								</div>
							</div>
						</div>	
						</td>	
					</tr>				
				</c:forEach>
			</table>
		</div><!-- 한마디 테이블  end -->
	</div><!-- 다섯 번째 블럭(한마디) end -->	
