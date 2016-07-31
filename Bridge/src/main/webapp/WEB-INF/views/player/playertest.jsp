<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link href="/resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"  />
<script src="/resources/bootstrap/js/jquery-2.2.3.min.js"></script>
<script src="/resources/bootstrap/js/bootstrap.min.js"></script> 

<!DOCTYPE html>
<html>
<head>
    <title>HTML5 Audio Player</title>
    <link rel="stylesheet" href="/resources/css/style.css" media="screen">
    
 <script>
 </script>
</head>
<body>
<div id="container">
	<div id="audio-image">
		<img class="cover" />
	</div>
	<div id="audio-player">
		<div id="audio-info">
			<span class="artist"></span> - <span class="title"></span>
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
    		<li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">가사</a></li>
    		<li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">내앨범</a></li>
    		
  		</ul>
  		
  		 <div class="tab-content">
    <div role="tabpanel" class="tab-pane active" id="home">
     <div class="clearfix"></div>
		 <ul id="playlist">
			<li song="로꼬, GRAY (그레이) - GOOD (Feat. ELO).mp3" cover="MOuzcBERbsc/0.jpg" artist="로꼬, GRAY (그레이)">GOOD(Feat. ELO)</li>
			<li song="비프리 (B-Free) - NEW WAVE (Feat. Double K, Paloalto).mp3" cover="uPLpgROuB0c/0.jpg" artist="비프리 (B-Free)">NEW WAVE (Feat. Double K, Paloalto)</li>
			<li song="헤이즈 (Heize) - And July (Feat. DEAN, DJ Friz).mp3" cover="aLSefFxpW-Y/0.jpg" artist="헤이즈 (Heize)">And July (Feat. DEAN, DJ Friz)</li>
			<li song="Don Mills (던밀스) - 미래 (MEERAE).mp3" cover="cover1.jpg" artist="Don Mills (던밀스)">미래 (MEERAE).mp3</li>
			<li song="Sik-K (식케이) - 랑데뷰.mp3" cover="cover1.jpg" artist="Sik-K (식케이)">랑데뷰</li>
			<li song="Linkin Park - Pushing Me Away.mp3" cover="${music.musicVideo }/0.jpg" artist="${music.artistName }" id="val">${music.musicSubject }</li>
			${val }
			${music.musicVideo }입니다 
		</ul>
    </div>
    <div role="tabpanel" class="tab-pane" id="profile">${music.musicLyrics }</div>
    <div role="tabpanel" class="tab-pane" id="messages">...</div>
    
  </div>
		<button>삭제</button>
	</div>

</div>

<script src="/resources/js/jquery.js"></script>
<script src="/resources/js/main.js"></script>
</body>
</html>