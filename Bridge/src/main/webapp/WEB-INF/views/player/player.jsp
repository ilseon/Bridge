<%@ page contentType="text/html; charset=utf-8"%>
<link href="/resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
<script src="/resources/bootstrap/js/jquery-2.2.3.min.js"></script>
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
<script src="/resources/bootstrap/css/bootstrap.css" type="text/css"></script>
    <link rel="stylesheet" type="text/css" href="/resources/plugin/css/style.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/demo.css">
    <script type="text/javascript" src="/resources/plugin/jquery-jplayer/jquery.jplayer.js"></script>
    <script type="text/javascript" src="/resources/plugin/ttw-music-player-min.js"></script>
    <script type="text/javascript" src="/resources/js/myplaylist.js"></script>
<!DOCTYPE html>
<html>
<head>
    <title></title>

    <script type="text/javascript">
        $(document).ready(function(){
            var description = '플레이어';

            $('body').ttwMusicPlayer(myPlaylist, {
                autoPlay:false, 
                description:description,
                jPlayer:{
                    swfPath:'/resources/plugin/jquery-jplayer' //You need to override the default swf path any time the directory structure changes
                }
            });
        });
    </script>
</head>
<body>

<div></div>

</body>
</html>