<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
$(document).ready(function(){
	$('#pay_now').click(function(){
		$('#pay').submit();
	});	
});

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
				<c:set var="href" value="/download_music_sev?musicnumbers=${playlistall}"/>
				다운 곡 수 : ${i}곡&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1곡 당 금액 : 700원<br/><br/>
			</c:if>			
          	<c:if test="${music!=null}">
			${music.musicSubject}&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;${music.artistName}<br/><br/><hr/><br/>
			 
			다운 곡 수 : 1곡&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1곡 당 금액 : 700원<br/><br/>
			<c:set var="i" value="1"/>
			<c:set var="href" value="/download_music?musicnumber=${music.musicNumber}"/>
			</c:if>
		<span id="order_container">
		<form id="pay" name="pay" method="post" action="https://www.sandbox.paypal.com/cgi-bin/webscr">
			            구매요청 : <input type="hidden" name="cmd" value="_xclick" size="50" /><br />
			            상점계정 : <input type="index" name="business" value="muhj89-facilitator@naver.com" size="50" /><br />
			            총 금액 : <input type="index" name="amount" value="${i*7}" size="50" /><br />
			            상품이름 : <input type="index" name="item_name" value="music" size="50" /><br />
			            결제후 이동되는 페이지 : <input type="index" name="return" value="http://localhost:8081${href}" size="50" /><br />
			     IPN메세지 받을 페이지 : <input type="hidden" name="notify_url" value="http://localhost:8081/chart/modal/pay_modal_fail" size="50" /><br />
			            결제 취소 페이지 : <input type="hidden" name="cancel_return" value="http://localhost:8081/chart/modal/pay_modal_cancel" size="50" /><br />
			            인코딩 : <input type="hidden" name="charset" value="UTF-8" size="50" /><br />
	            <input type="index" name="currency_type" value="USD" size="50" /><br />
            <input type="submit" value="pay" size="50" />
        </form>
		</span>
	</div>
	<div class="modal-footer">
        <button type="button" class="btn btn-success" id="pay_now"><span class="glyphicon glyphicon-ok-sign"></span>다운로드</a>
        <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> No</button>
    </div>
        </div>
    <!-- /.modal-content --> 
  </div>
        
