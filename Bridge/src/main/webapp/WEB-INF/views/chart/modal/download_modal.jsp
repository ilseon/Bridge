<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <div class="modal-content">
          <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
        <h4 class="modal-title custom_align" id="Heading">다운로드</h4>
      </div>
          <div class="modal-body">
          	해당 노래를 다운받으시겠습니까?<br/>
          	
			 ${music.musicNumber}
		</div><div class="modal-footer">
        <a href="/download_music?musicnumber=${music.musicNumber}" type="button" class="btn btn-success" ><span class="glyphicon glyphicon-ok-sign"></span>다운로드</button></a>
        <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> No</button>
      </div>
        </div>
    <!-- /.modal-content --> 
  </div>
        
