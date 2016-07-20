<%--
작성자 - 이주연
내용 - 업로드하기 페이지
시작날짜 - 2016/07/17
수정날짜 - 
변경내용 - 
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<link href="/resources/bootstrap/css/bootstrap.css" rel="stylesheet"
	type="text/css" />
<script src="/resources/bootstrap/js/jquery-2.2.3.min.js"></script>
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
<script src="/resources/bootstrap/css/bootstrap.css" type="text/css"></script>
</head>
<script>
	$(document)
			.ready(
					function() {
						var cnt = $("#counter").val();
						$('input:checkbox[name=title' + i + ']')
								.click(
										function() {
											var cnt = $('input:checkbox[name=title'
													+ i + ']').length;
											alert(cnt);
											for (var i = 0; i < cnt; i++) {
												if ($(this).prop('checked')
														&& $(
																'input[type="checkbox"][name="title"]:checked')
																.size() > 1) {
													$(this).prop('checked',
															false);
													alert('두개 이상 선택할 수 없습니다.');
												}
											}
										});

						//업로드시 빠지는 항목을 체크하는 jquery 
						$("#upload").click(function() {
							var cnt = $("#counter").val();
							for (var i = 0; i < cnt; i++) {
								if (!$("#upFile" + i).val()) {
									alert(i + "번째 음원 파일을 업로드해주세요.");
									return false;
								} else if (!$("#song" + i).val()) {
									alert(i + "번째 곡 명을 입력해주세요.");
									return false;
								} else if ($("#title" + i).length() == 0) {
									alert("타이틀을 체크해주세요.");
									return false;
								}
							}
						});
					});

</script>
<style>
#pom {
	border-radius: 17px;
	background-color: #EDE6E6;
	box-shadow: 2px 2px 2px 2px #E0E0E0;
}
#before{
	border: none;
	background-color: orange;
}
#cencle{
	border: none;
	background-color: gray;
}
</style>
<body>
	<!-- header, sideber start -->
	<%@include file="/WEB-INF/views/include/header.jsp"%>
	<%@include file="/WEB-INF/views/include/sidebar.jsp"%>
	<!-- end -->
	<div class="container">
		<br /> <br />
		<!-- 상단 tab start -->
		<div class="col-md-12">
			<ul class="nav nav-tabs">
				<li class="active"><a href="upload">업로드하기</a></li>
				<li><a href="mytrack">내 트랙</a></li>
			</ul>
			<!-- end -->
			<br />
			<div class="jumbotron" id="pom">
				<!-- 업로드 정보 입력  -->
				<!-- 입력 후 음원 수  파일 업로드 -->
				<%
					int cnt = 0;
					if (request.getParameter("counter") != null) {
						cnt = Integer.parseInt(request.getParameter("counter"));
					}
				%>
				<form class="form-horizontal" id="f" method="get" action="mytrack">
					<div class="container">
						<div class="col-md-12">
							<br /> <br /> <input type="hidden" id="cnt" name="cnt" value="" />
							<table class="table">
								<tr>
									<th width="20%">음원파일</th>
									<th width="8%"><div style="color: blue">타이틀</div></th>
									<th width="30%">곡</th>
									<th width="20%">뮤비</th>
									<th width="10%"><div style="color: red">&nbsp;&nbsp;&nbsp;&nbsp;19세</div></th>
								</tr>
								<%
									if (cnt == 0) {
								%>
								<tr>
									<td colspan="9" style="text-align: center"><h5>
											<strong> <br />현재 등록된 곡이 없습니다.
											</strong>
										</h5></td>
								</tr>
								<%
									}
									for (int i = 0; i < cnt; i++) {
								%>
								<tbody>
									<tr>
										<td><input type="file" name="upFile<%=i%>"
											id="upFile<%=i%>" /></td>
										<td><button class="btn btn-xs">
												<span class="glyphicon glyphicon-star"
												style="color:blue"
													id="title<%=i%>"></span>
											</button></td>
										<td><input type="text" name="song" id="song<%=i%>"
											class="form-control" /></td>
										<td><input type="text" name="musicvideo<%=i%>"
											id="musicvideo<%=i%>" class="form-control" /></td>
										<td>&nbsp;&nbsp;&nbsp;
											<button class="btn btn-xs">
												<span class="glyphicon glyphicon-star-empty"
													id="limit<%=i%>"></span>
											</button>
										</td>
									</tr>
									<%
										}
									%>
								</tbody>
							</table>

							<!-- end -->

							<!-- 버튼 start -->
							<div align="center" style="margin-top: 90px">
								<div class="form-group">
									<button type="submit" class="btn btn-primary" id="before">뒤로</button>
									<button type="submit" class="btn btn-primary" id="upload">업로드</button>
									<button type="reset" class="btn btn-primary" id="cencle">취소</button>
								</div>
							</div>
						</div>
						<!-- end -->
					</div>
				</form>
			</div>
		</div>
	</div>
	<br />
	<br />
	<!--  footer start -->
	<%@include file="/WEB-INF/views/include/footer.jsp"%>
	<!--  end -->
</body>
</html>