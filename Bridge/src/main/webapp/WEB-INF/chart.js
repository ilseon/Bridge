/**
 *  
 	담당 : 정효진
	최종 수정 일자 : 2016-08-02
	댓글 수정 페이지

 */

var user="${usernumber}";

//checkbox 전체 선택
$(document).ready(function(){
   $("#checkall").click(function () {
           if ($("#checkall").is(':checked')) {
               $("#mytable input[type=checkbox]").each(function () {
                   $(this).prop("checked", true);
               });

           } else {
               $("#mytable input[type=checkbox]").each(function () {
                   $(this).prop("checked", false);
               });
           }
       });
   });
   
//여러 곡을 선택한 경우
$(function(){
   $("#check_all .btn").click(function(){
      if($(this).attr('id')=="all_listen"){
         $("#mytable input[type=checkbox]").each(function () {
              $(this).prop("checked", true);
            });   
      }
      if($("#mytable input[type=checkbox]").is(":checked")){
         var playlistAll = new Array();
         if(user!=""){
         var list=$("#mytable input[type=checkbox]");
            for(var i = 0 ; i<list.length; i++){
               if(list[i].checked==true){
                  playlistAll.push(list[i].value);
               }
            } 
            
         var this_name=$(this).attr('id');
         
         if(this_name=="download"){
            $('#Download').modal({
                 remote: '/download_modal_sev?playlistAll='+playlistAll
            });
         }else if(this_name=="myalbum"){
            $('#MyAlbum').modal({
                 remote: '/myalbum_modal_sev?playlistAll='+playlistAll
            });
         }
            
         }else{
            alert("로그인 후 이용하실 수 있는 서비스입니다!");   
         }
      }else if($("#mytable input[type=checkbox]:not(checked)")){
         alert("곡을 선택해 주세요!");
         return false;
      }
   })
});



//한 곡에 대한 선택 사항 처리
$(function(){
   $("#mytable .btn[id]").click(function(){
      var tagId = $(this).attr('id');
      if(user==""){
         alert("로그인 후 이용하실 수 있는 서비스입니다!");
         return false;
      }else if(tagId=="like"){
         if($(this).find("span").attr('style')==null){
            $.post("/like_music?musicnumber="+$(this).find("span").attr('id'));
            alert("'좋아요'를 눌러 주셨습니다!");
            $(this).find("span").css("color","red");
            
         }else if($(this).find("span").attr('style')!=null){
            $.get("/like_music_cancel?musicnumber="+$(this).find("span").attr('id'));
            alert("'좋아요'가 취소 되었습니다ㅠㅠ");
            $(this).find("span").css("color","");
         }
      }
   })
});

function player(num){
   
   var tmp=false;
    if (tmp==false){       //최초 클릭이면 팝업을 띄운다
        
       $.ajax({
           type: 'get',
           data: {"value":num},
         });
    
        tmp = true;
       // alert(tmp);
       Clip =   window.open("player?val="+num,"new","width=500, height=900, resizable=no, scrollbars=no, status=no, location=no, directories=no;")
         //Clip.close();                         
            Clip.focus();
            
       }
       else{           //최초 클릭이 아니면
        if(tmp){
           $.ajax({
              type: "post",
              url: 'player',
              data: {"val":num} ,
           success:alert("POST")
            });   
         Clip.close();                         
        }
        else{
           $.ajax({
              type: 'get',
              data: {"val":num},
              success:alert("POST아님")
            });
           tmp = true;
          }//없으면 팝업을 다시 띄울 수 있게 한다
          Clip =   window.open("player?val="+num,"new","width=500, height=900, resizable=no, scrollbars=no, status=no, location=no, directories=no;")
         tmp = true;
        
       }
 
};  
