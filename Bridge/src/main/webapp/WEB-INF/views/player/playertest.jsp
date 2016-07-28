<%@ page contentType="text/html; charset=utf-8"%>
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
		 <input id="volume" type="range" min="0" max="100" value="50" />
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
		 <ul id="playlist" class="hidden">
			<li song="로꼬, GRAY (그레이) - GOOD (Feat. ELO).mp3" cover="MOuzcBERbsc/0.jpg" artist="로꼬, GRAY (그레이)">GOOD(Feat. ELO)</li>
			<li song="비프리 (B-Free) - NEW WAVE (Feat. Double K, Paloalto).mp3" cover="uPLpgROuB0c/0.jpg" artist="Linkin Park">One Step Closer.mp3</li>
			<li song="헤이즈 (Heize) - And July (Feat. DEAN, DJ Friz).mp3" cover="aLSefFxpW-Y/0.jpg" artist="Linkin Park">With You.mp3</li>
			<li song="Don Mills (던밀스) - 미래 (MEERAE).mp3" cover="cover1.jpg" artist="Linkin Park">Points Of Authority.mp3</li>
			<li song="Sik-K (식케이) - 랑데뷰.mp3" cover="cover1.jpg" artist="Linkin Park">Crawling.mp3</li>
			<li song="Linkin Park - Runaway.mp3" cover="cover1.jpg" artist="Linkin Park">Runaway.mp3</li>
			<li song="Linkin Park - By Myself.mp3" cover="cover1.jpg" artist="Linkin Park">By Myself.mp3</li>
			<li song="Linkin Park - In The End.mp3" cover="cover1.jpg" artist="Linkin Park">In The End.mp3</li>
			<li song="Linkin Park - A Place For My Head.mp3" cover="cover1.jpg" artist="Linkin Park">A Place For My Head.mp3</li>
			<li song="Linkin Park - Forgotten.mp3" cover="cover1.jpg" artist="Linkin Park">Forgotten.mp3</li>
			<li song="Linkin Park - Cure For The Itch.mp3" cover="cover1.jpg" artist="Linkin Park">Cure For The Itch.mp3</li>
			<li song="Linkin Park - Pushing Me Away.mp3" cover="cover1.jpg" artist="Linkin Park">Pushing Me Away.mp3</li>
		</ul>
		<button>삭제</button>
	</div>

</div>

<script src="/resources/js/jquery.js"></script>
<script src="/resources/js/main.js"></script>
</body>
</html>