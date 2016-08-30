<%--
작성자 - 이주연
내용 - 업로드 1단계 페이지
시작날짜 - 2016/07/17
수정날짜 - 2016/07/24
변경내용 - 
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<script src="/Bridge/resources/bootstrap/js/jquery-2.2.3.min.js"></script>
<script src="/Bridge/resources/bootstrap/js/bootstrap.min.js"></script>
<script src="/Bridge/resources/bootstrap/css/bootstrap.css" type="text/css"></script>
</head>
</head>
<title>Upload1_Artist</title>
<script>
   $(document).ready(
         function() {
            //등록된 아티스트 등록, 수정, 삭제하는 jquery
            var name = $("#artistName").val();
            $("#artistRegist").click(function() {
               alert(name + " 선택되었습니다.");
               $("#artistList").submit();
            });

            function readURL(input) {
               if (input.files && input.files[0]) {
                  var reader = new FileReader();
                  reader.onload = function(e) {
                     $('#UploadedImg').attr('src', e.target.result);
                  }
                  reader.readAsDataURL(input.files[0]);
               }
            }

            // 아티스트 정보에 대한 항목 입력을 확인하는 jquery 
            $("#regist").click(
                  function() {
                     var name = $("#artist").find("#artistName");
                     var file = $("#artist").find("#artistImg").val();
                     var type = $("#artist").find("#artistType");
                     var genre = $("#artist").find("#artistGenre");
                     var fileExt = file
                           .substring(file.lastIndexOf('.') + 1); //파일확장자 

                     if (!name.val()) {
                        alert("아티스트명을 입력해주세요.");
                        return false;
                     } else if (fileExt.toUpperCase() == "MP3"
                           || fileExt.toUpperCase() == "AVI"
                           || fileExt.toUpperCase() == "JSP") {
                        alert("이미지 파일만 업로드할 수 있습니다. 다시 확인해주세요.");
                        return false;
                     } else if (type.val() == "선택") {
                        alert("아티스트 타입을 선택해주세요.");
                        return false;
                     } else if (genre.val() == "선택") {
                        alert("아티스트 장르를 선택해주세요.");
                        return false;
                     } else {
                        alert("등록되었습니다.");
                        $("#artist").submit();
                     }
                  });
         });
</script>
<style>
#tab {
   border: none;
   background-color: #DF6E76;
   box-shadow: 2px 2px 2px 2px #E0E0E0;
   color: white;
   margin-top: 30px;
}

#upload_main {
   margin-left: 100px;
}

#pom {
   border-radius: 17px;
   background-color: white;
   box-shadow: 2px 2px 2px 2px #E0E0E0;
}

#pom2 {
   border-radius: 17px;
   background-color: #EDE6E6;
   box-shadow: 2px 2px 2px 2px #E0E0E0;
}

#null {
   margin-left: 385px;
}

#regist {
   border: none;
   box-shadow: 2px 2px 2px 2px #E0E0E0;
}

#cencle {
   border: none;
   box-shadow: 2px 2px 2px 2px #E0E0E0;
   background-color: gray;
}

.table th {
   text-align: center;
   background-color: #EDE6E6;
}

.table td {
   background-color: #E0E0E0;
   text-align: center;
}
</style>
<body style="margin-top: 4%;">
   <!-- header, sideber start -->
   <%@include file="/WEB-INF/views/include/header.jsp"%>
   <%@include file="/WEB-INF/views/include/sidebar.jsp"%>
   <!-- end -->
   <div class="container">
      <div class="panel-heading col-md-3" id="tab">
         <h3 class="panel-title">
            <img src="/Bridge/resources/image/upload/album/one.png">&nbsp;&nbsp;아티스트
            정보 및 등록
         </h3>
      </div>
      <div class="col-md-12">
         <br /> <br />
         <div class="row">
            <div class="jumbotron" id="pom">
               <form id="artistList" accept-charset="UTF-8" method="get">
                  <table class="table">
                     <tr>
                        <th width="8%">번호</th>
                        <th width="25%">아티스트</th>
                        <th width="13%">타입</th>
                        <th width="13%">장르</th>
                        <th width="8%">등록</th>
                        <th width="8%">수정</th>
                        <th width="8%">삭제</th>
                     </tr>
                     <tbody>
                           <c:if test="${null ne artistList }">
                              <c:set var="j" value="0"></c:set>
                              <c:forEach var="list" items="${artistList}">
                                 <c:set var="j" value="${j+1}"></c:set>
                              <tr>   
                                 <td width="8%">${j}<input type="hidden"
                                    id="artistNumber" name="artistNumber"
                                    value="${list.artistNumber}" /></td>
                                 <td width="25%"><input type="hidden" id="artistName"
                                    value="${list.artistName}" />${list.artistName}</td>
                                 <td width="13%"><input type="hidden" id="artistType"
                                    name="artistType" value="${list.artistType}" />${list.artistType}</td>
                                 <td width="13%"><input type="hidden" id="artistGenre"
                                    name="artistGenre" value="${list.artistGenre}" />${list.artistGenre}</td>
                                 <td width="8%"><a
                                    href="artistRegist?artistNumber=${list.artistNumber}"
                                    class="btn btn-xs"> <span
                                       class="glyphicon glyphicon-save" id="artistRegist"></span>
                                 </a></td>
                                 <td width="8%"><a
                                    href="artistUpdate?artistNumber=${list.artistNumber}"
                                    class="btn btn-xs"> <span
                                       class="glyphicon glyphicon-pencil" id="artistUpdate"></span>
                                 </a></td>
                                 <td width="8%"><a
                                    href="artistDel?artistNumber=${list.artistNumber}"
                                    class="btn btn-xs"><span
                                       class="glyphicon glyphicon-trash" id="artistDelete"></span>
                                 </a></td>
                              </tr>   
                              </c:forEach>
                           </c:if>
                     </tbody>
                  </table>
                  <table>
                     <tr>
                        <td><c:if test="${ empty artistList }">
                              <h5 id="null">
                                 <br /> <strong>현재 등록된 아티스트가 없습니다.</strong> <br />
                              </h5>
                           </c:if></td>
                     </tr>
                  </table>
               </form>
            </div>
            <hr />
            <br />
            <div class="jumbotron" id="pom2">
               <div id="upload_main">
                  <form id="artist" action="upload" method="post"
                     accept-charset="UTF-8" enctype="multipart/form-data">
                     <div class="col-md-2 col-md-offset-1">
                        <input type="hidden" name="userNumber" id="userNumber"
                           value="${userNumber}" /> <input type="hidden"
                           name="artistNumber" id="artistNumber" value="${artistNumber}" />
                        <br /> <img src="/Bridge/resources/image/upload/album/album_image.PNG"
                           width="120%" id="UploadedImg" /><br /> <br /> <input
                           type="file" name="artistImg" id="artistImg" accept="image/*"
                           />
                     </div>
                     <div class="col-md-5 col-md-offset-1">
                        <br /> <label for="artistName" class="col-xs-4 control-label">아티스트</label>
                        <div class="col-xs-8">
                           <input type="text" class="form-control" id="artistName"
                              name="artistName"><br />
                        </div>
                        <!-- 아티스트 타입 등록 -->
                        <label for="artistType" class="col-xs-4 control-label">타입</label>
                        <div class="col-xs-8">
                           <select class="form-control" id="artistType" name="artistType">
                              <option>선택</option>
                              <option>솔로</option>
                              <option>그룹</option>
                              <option>밴드</option>
                           </select><br />
                        </div>
                        <label for="artistGenre" class="col-xs-4 control-label">장르</label>
                        <div class="col-xs-8">
                           <!-- 아티스트 장르 등록 -->
                           <select class="form-control" id="artistGenre"
                              name="artistGenre">
                              <option>선택</option>
                              <option>발라드/댄스/팝</option>
                              <option>일렉트로닉</option>
                              <option>알앤비</option>
                              <option>락/메탈</option>
                              <option>재즈</option>
                              <option>힙합</option>
                              <option>인디</option>
                           </select><br />
                        </div>
                     </div>
                  </form>
                  <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />
                  <br />
               </div>
            </div>
         </div>
      </div>
   </div>
   <!-- 버튼 start -->
   <div align="center" style="margin-top: 40px">
      <div class="form-group">
         <button type="submit" class="btn btn-primary" id="regist">등록</button>
         <button type="reset" class="btn btn-primary" id="cencle">취소</button>
      </div>
   </div>

   <!-- end -->
   <br />
   <br />
   <!--  footer start -->
   <%@include file="/WEB-INF/views/include/footer.jsp"%>
   <!--  end -->
</body>
</html>