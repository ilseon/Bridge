<%--
�ۼ��� - ���ֿ�
���� - ��Ƽ��Ʈ ���� ��� ������
���۳�¥ - 2016/07/17
������¥ - 
���泻�� - 
 --%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@page import="java.util.Vector"%>
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
	//Ż�� ���� jquery 
	$(document).ready(function() {
		$(".btn-danger").on("click", function() {
			alert("Ż��Ǿ����ϴ�.");
			window.close();
		});
	});
</script>
<body>
	<br />
	<br />
	<br />
	<div class="container">
		<div class="col-md-4">
			<div class="panel panel-danger">
				<div class="panel-heading">
					<h4 class="text-center">ȸ�� Ż��</h4>
				</div>
				<div class="panel-body text-center">
					<p class="leave">
					<br />
						<strong>������ Ż���Ͻðڽ��ϱ�?</strong>
					</p>
				</div>
			</div>
			<div class="form-group" align="center" style="margin-top: 40px">
				<button type="submit" class="btn btn-danger">Ȯ��</button>
				<button type="reset" class="btn btn-default"
					onclick="window.close();">���</button>
			</div>
		</div>
	</div>

	<!-- end -->
</body>
</html>
