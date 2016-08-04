<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link href="/Bridge/resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"  />
<script src="/Bridge/resources/bootstrap/js/jquery-2.2.3.min.js"></script>
<script src="/Bridge/resources/bootstrap/js/bootstrap.min.js"></script> 

<!DOCTYPE html>
<html>
<head>
    <title>HTML5 Audio Player</title>
    <link rel="stylesheet" href="/Bridge/resources/css/style.css" media="screen">
    
 <script>
 $(function(){
	 var check=0;
	$("li a[aria-controls^=Lyrics]").click(function(){
		var musicLyrics=$("#playlist li.active").attr('musicLyrics');
		if(check==0){
		$("div[id^=Lyrics]").append('<p>'+musicLyrics+'</p>');
		check=1;
		}
		
	})
	$("li a[aria-controls^=home]").click(function(){		
		$("div[id^=Lyrics]").empty();
		check=0;
	})
	
});

 function deleteAll(){
	 $.ajax({
		  type: 'get',
		  url:"delplayer",
		  success:
			
				$("li a[aria-controls^=home]").ready(function(){		
					$("#playlist li").empty();
				}) 
			  
		});
	 
}
 
  function multiDelete(){
	      if($("#playlist input[type=checkbox]").is(":checked")){
	         var playAll = new Array();
	         
	         var list=$("#playlist input[type=checkbox]");
	         for(var i = 0 ; i<list.length; i++){
	            if(list[i].checked==true){
	               playAll.push(list[i].value);
	            }
	         }
	         alert(list.length);
			location.href="delplayermulti?playAll="+playAll;
			 
			 
	      }else if($("#playlist input[type=checkbox]:not(checked)")){
	          alert("곡을 선택해 주세요!");
	          return false;
	       }
	   } 
  var chk=0;
  $(document).ready(function(){
	 /*  $(document).keydown(function(){
			 if(event.keyCode==39){
				    audio.pause();
				    var next = $('#playlist li.active').next();
				    if (next.length == 0) {
				        next = $('#playlist li:first-child');
				    }
				    initAudio(next);
					audio.play();
					showDuration();
					
			 }else if(event.keyCode==37){
				    audio.pause();
				    var prev = $('#playlist li.active').prev();
				    if (prev.length == 0) {
				        prev = $('#playlist li:last-child');
				    }
				    initAudio(prev);
					audio.play();
					showDuration();
			 }
		 }) */
	 $(document).keyup(function(event){
		 if(event.keyCode==39){
			    audio.pause();
			    var next = $('#playlist li.active').next();
			    if (next.length == 0) {
			        next = $('#playlist li:first-child');
			    }
			    initAudio(next);
				audio.play();
				showDuration();
		 }else if(event.keyCode==37){
			    audio.pause();
			    var prev = $('#playlist li.active').prev();
			    if (prev.length == 0) {
			        prev = $('#playlist li:last-child');
			    }
			    initAudio(prev);
				audio.play();
				showDuration();
		 }else if(event.keyCode==32){
			 
			 if(chk==0){
					audio.play();
					$('#play').hide();
					$('#pause').show();
					$('#duration').fadeIn(400);
					showDuration();
					chk=1;
			 }else if(chk==1){
				 audio.pause();
					$('#pause').hide();
					$('#play').show();
				chk=0;
			 }
		 }else if(event.keyCode==38||event.keyCode==40){
			 $('#volume').change(function(){
					audio.volume = parseFloat(this.value / 10);
				});
		 }
	 })
	 
  });

 </script>
</head>
<body >
<div id="container">
	<div id="audio-image">
		<img class="cover" />
	</div>
	<div id="audio-player">
		<div id="audio-info">
			<span class="artist"></span>  <span class="title"></span>
		</div>
		 <input id="volume" type="range" min="0" max="10" value="5" />
		 <br>
		 <div id="buttons">
		 <span>
			<button id="prev"></button>
			<button id="play"></button>
			<button id="pause"></button>
			<button id="stop"></button>
			<button id="next"></button>
			
			</span>
		 </div>
		 <div class="clearfix"></div>
		 <div id="tracker">
			<div id="progressBar">
				<span id="progress"></span>
			</div>
			<span id="duration"></span>
		 </div>
		 <div class="clearfix"></div>
		 <ul class="nav nav-tabs" role="tablist">
    		<li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab"><p style="color: black;font: bolder;">재생목록</p></a></li>
<li role="presentation"><a href="#Lyrics" aria-controls="Lyrics" role="tab" data-toggle="tab">가사</a></li>    		
<li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">내앨범</a></li>
    		
  		</ul>
  		
  		 <div class="tab-content">
    <div role="tabpanel" class="tab-pane active" id="home">
     <div class="clearfix"></div>
     <div  style="overflow:scroll;height: 500px">
		 <ul id="playlist">
		 <c:set var="value" value="0"/>
			   <c:forEach items="${list}" var="MusicVO">
     				
     				<li song="Sleep Away.mp3" musicLyrics="${MusicVO.musicLyrics}" cover="album_art.jpg" artist="${MusicVO.artistName }" id="val"><input type="checkbox"value="${value }">${MusicVO.artistName } - ${MusicVO.musicSubject } </li>
   					<c:set var="value" value="${value+1 }"/>
   				</c:forEach>
		</ul>
		</div>
		<button onclick="deleteAll()" type="button" class="btn btn-default">목록삭제</button>
		<button type="button" class="btn btn-default" onclick="multiDelete()">선택삭제</button>
    </div>
    <div role="tabpanel" class="tab-pane" id="Lyrics"></div>
    <div role="tabpanel" class="tab-pane" id="messages">...</div>
    
  </div>
	</div>

</div>

<script src="/Bridge/resources/js/jquery.js"></script>
<script src="/Bridge/resources/js/main.js"></script>
</body>
</html>