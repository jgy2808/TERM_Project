<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>foundpw</title>
<link rel="stylesheet" href="../../resource/term/foundpw/assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="../../resource/term/foundpw/assets/fonts/font-awesome.min.css">
<link rel="stylesheet" href="../../resource/term/foundpw/assets/css/styles.css">
</head>

<body class="text-center">
	<div class="d-flex justify-content-between align-items-center"
		id="header"
		style="height: 50px; text-align: center; background: rgb(92, 198, 186);">
		<i class="fa fa-chevron-left"
			style="width: 30px; height: 30px; font-size: 24px; color: rgb(255, 255, 255);"></i><label
			class="form-label"
			style="color: rgb(255, 255, 255); font-size: 24px;">비밀번호 찾기</label><i
			class="fa fa-ellipsis-v"
			style="width: 30px; height: 30px; font-size: 24px; color: rgb(255, 255, 255);"></i>
	</div>
	<div class="text-center">
		<label class="form-label text-center">이메일 주소로 임시 비밀번호를 전송했습니다.<br>임시
			비밀번호로 로그인 후 비밀번호 변경을 해주세요.<br></label>
	</div>
	<button class="btn btn-primary" type="button" onclick="location.href='/main/login/'"
		style="background: rgb(92, 198, 186);">로그인 하러 가기</button>
	<script src="../../resource/term/foundpw/assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>