<!-- 
	최초 작성일 : 2016-07-17
	작성자 : 정효진
	수정일 : 2016-07-30
	수정 내용 : 넘길 결제 정보 작성
	내용 : 결제 사항 확인 페이지
 -->

<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script language='javascript'>
$(document).ready(function(){
	$('#pay_now').click(function(){
		$('#pay').submit();
	});	
});


function paycheck(){
	 var gsWin = window.open('about:blank','payviewer','width=1000,height=500');
	 var frm =document.pay;
	 frm.target ="payviewer";
	 frm.method ="post";
	 frm.submit();
}

<%
	if(request.getAttribute("playlist_all")!=null){
		List playlist_all = (List)request.getAttribute("playlist_all");
		System.out.println(playlist_all.get(0)+"playlist_all");
	}
%>


</script>


  <div class="modal-content">
     <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
        <h4 class="modal-title custom_align" id="Heading">다운로드</h4>
      </div>
      <div class="modal-body">
          	<c:set var="i" value="0"/>
          	<c:set var="playlistall" value=""/>
          	<c:if test="${playlistAll!=null}">
				<c:forEach items="${playlistAll}" var="playlist" begin="0">
				<c:set var="i" value="${i+1}"/>
					<br/>${playlist.musicSubject}&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;${playlist.artistName}<br/><br/><hr/><br/>					
					<c:set var="playlistall" value="${playlistall},${playlist.musicNumber}"/>
				</c:forEach>
				<c:set var="href" value="/download_music_sev?musicnumbers=${playlistall}&playlist_all=${requestScope.playlist_all}"/>
				다운 곡 수 : ${i}곡&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1곡 당 금액 : 2$<br/><br/>
			</c:if>			
          	<c:if test="${music!=null}">
			${music.musicSubject}&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;${music.artistName}<br/><br/><hr/><br/>
			 
			다운 곡 수 : 1곡&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1곡 당 금액 : 2$<br/><br/>
			
			<c:set var="i" value="1"/>
			<c:set var="href" value="/download_music?musicnumber=${music.musicNumber}"/>
			</c:if>
			총 금액 : ${i*2}$
		<span id="order_container">
		<form id="pay" name="pay" method="post" action="https://www.sandbox.paypal.com/cgi-bin/webscr">
			            <input type="hidden" name="cmd" value="_xclick" size="50" /><br />
			            <input type="hidden" name="business" value="muhj89-facilitator@naver.com" size="50" /><br />
			            <input type="hidden" name="amount" value="${i*2}" size="50" /><br />
			            <input type="hidden" name="item_name" value="music" size="50" /><br />
			            <input type="hidden" name="return" value="http://localhost:8080${href}" size="50" /><br />
			            <input type="hidden" name="notify_url" value="http://localhost:8080/chart/modal/pay_modal_fail" size="50" /><br />
			            <input type="hidden" name="cancel_return" value="http://localhost:8080/chart/modal/pay_modal_cancel" size="50" /><br />
			            <input type="hidden" name="charset" value="UTF-8" size="50" /><br />
	           			<input type="hidden" name="currency_type" value="USD" size="50" /><br />
            <!-- <input type="submit" value="pay" size="50" /> -->
        </form>
		</span>
	</div>
	<div class="modal-footer">
        <a type="button" class="btn btn-success" id="pay_now" onclick="paycheck()" data-dismiss="modal"><span class="glyphicon glyphicon-ok-sign"></span>다운로드</a>
        <a type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> No</button>
    </div>
        </div>
    <!-- /.modal-content --> 
  </div>
        
