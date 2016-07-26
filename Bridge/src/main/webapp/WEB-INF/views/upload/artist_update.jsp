<%--
�ۼ��� - ���ֿ�
���� - ��Ƽ��Ʈ ����Ȯ�� �� ���� ������
���۳�¥ - 2016/07/26
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
	$(document).ready(function() {
		// ��Ƽ��Ʈ ������ ���� �׸� �Է��� Ȯ���ϴ� jquery 
		$("#save").on("click", function() {
			if (!$("#artist").val()) {
				alert("��Ƽ��Ʈ���� �Է����ּ���.");
				return false;
			} else if (!$("#upFile").val()) {
				alert("�̹����� ���ε����ּ���.");
				return false;
			} else {
				alert("��ϵǾ����ϴ�.");
				$("#f").submit();
				window.close();
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
}
</style>
<body>
	<br />
	<div class="container">
		<div class="panel-heading col-xs-5" id="tab">
			<h3 class="panel-title">��Ƽ��Ʈ ���� �Է�</h3>
		</div>
		<br /><br /><br />
		
		<div class="col-md-12">
			<div class="col-xs-4">
				<!-- ��Ƽ��Ʈ �̹��� ��� -->
				<br />
				<img src="resources/image/upload/album/artist.jpg" width="120%"><br />
				<br /> <input type="file" name="upFile" id="upFile" />
			</div>
			<form class="form-horizontal">
				<fieldset>
					<div class="col-xs-10 col-xs-offset-1">
						<br />
						<div class="form-group">
							<!-- ��Ƽ��Ʈ�� �Է� -->
							<label for="artist" class="col-xs-4 control-label">��Ƽ��Ʈ</label>
							<div class="col-xs-8">
								<input type="text" class="form-control" id="artist">
							</div>
						</div>
						<div class="form-group">
							<!-- ��Ƽ��Ʈ Ÿ�� ��� -->
							<label for="type" class="col-xs-4 control-label">Ÿ��</label>
							<div class="col-xs-8">
								<select class="form-control" id="type">
									<option>�ַ�</option>
									<option>�׷�</option>
									<option>���</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="genre" class="col-xs-4 control-label">�帣</label>
							<div class="col-xs-8">
								<!-- ��Ƽ��Ʈ �帣 ��� -->
								<select class="form-control" id="genre">
									<option>�߶��/��/��</option>
									<option>�Ϸ�Ʈ�δ�</option>
									<option>�˾غ�</option>
									<option>��/��Ż</option>
									<option>����</option>
									<option>����</option>
									<option>�ε�</option>
								</select>
							</div>
						</div>
					</div>
				</fieldset>
			</form>
		</div>
	</div>
	<!-- end -->
	<!-- ��ư start -->
	<div align="center" style="margin-top: 50px">
		<div class="form-group">
			<button type="submit" class="btn btn-primary" id="save">����</button>
			<button type="reset" class="btn btn-default"
				onclick="window.close();">�ݱ�</button>
		</div>
	</div>
	<!-- end -->
</body>
</html>