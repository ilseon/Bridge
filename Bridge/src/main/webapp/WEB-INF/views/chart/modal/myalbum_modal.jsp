<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <div class="modal-content">
          <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
        <h4 class="modal-title custom_align" id="Heading">다운로드</h4>
      </div>
          <div class="modal-body">
          	<br/>
			 해당 곡을 내 앨범에 추가하시겠습니까?
		</div><div class="modal-footer">
        <a href="/myalbum?musicnumber=${musicnumber}" type="button" class="btn btn-success" ><span class="glyphicon glyphicon-ok-sign"></span>내 앨범 추가</button></a>
        <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> No</button>
      </div>
        </div>
    <!-- /.modal-content --> 
  </div>
        
