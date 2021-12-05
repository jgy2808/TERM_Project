<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>login</title>
<link rel="stylesheet"
	href="../../resource/term/login/assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="../../resource/term/login/assets/fonts/font-awesome.min.css">
<link rel="stylesheet"
	href="../../resource/term/login/assets/css/styles.css">
</head>

<body style="text-align: center;">
	<div class="d-flex justify-content-between align-items-center"
		id="header"
		style="height: 50px; text-align: center; background: rgb(92, 198, 186);">
		<i class="fa fa-chevron-left"
			style="width: 30px; height: 30px; font-size: 24px; color: rgb(255, 255, 255);"></i><label
			class="form-label"
			style="color: rgb(255, 255, 255); font-size: 24px;">로그인</label><i
			class="fa fa-ellipsis-v"
			style="width: 30px; height: 30px; font-size: 24px; color: rgb(255, 255, 255);"></i>
	</div>
	<div class="d-flex flex-column align-items-center"
		style="background: rgb(255, 255, 255); text-align: center;">
		<img style="margin-top: 20px; width: 200px; height: 200px;"
			src="assets/img/ykm.png">
		<form action="/main/login" method="post">
			<fieldset class="d-flex flex-column"
				style="margin-top: 30px; text-align: center; width: 80%; max-width: 400px;">
				<input class="border rounded" type="text" name="id"
					placeholder="아이디"> <input class="border rounded"
					type="password" name="pw" style="margin-top: 10px;"
					placeholder="비밀번호">
			</fieldset>
			<div class="text-start d-flex align-items-center"
				style="width: 80%; background: rgb(255, 255, 255); border-style: none; margin-top: 5px; max-width: 400px;">
				<input type="checkbox" id="maintain_login" name="remember_me" style="width: 25px; height: 25px;"> 
				<label class="form-label" style="margin-left: 5px;">자동 로그인</label>
			</div>
			<button class="btn btn-primary" type="submit"
				style="width: 80%; background: rgb(92, 198, 186); margin-top: 10px; max-width: 400px;">로그인</button>
		</form>

		<div style="background: rgb(255, 255, 255); margin-top: 30px;">
			<button class="btn btn-primary" type="button"
				onclick="location.href='/main/login/foundid'"
				style="background: rgb(255, 255, 255); color: rgb(0, 0, 0); border-style: none;">아이디
				찾기</button>
			<label class="form-label"
				style="margin-left: 8px; margin-right: 8px;">|</label>
			<button class="btn btn-primary" type="button"
				onclick="location.href='/main/login/foundpw'"
				style="background: rgb(255, 255, 255); color: rgb(0, 0, 0); border-style: none;">비밀번호
				찾기</button>
			<label class="form-label"
				style="margin-left: 8px; margin-right: 8px;">|</label>
			<button class="btn btn-primary" type="button"
				onclick="location.href='/signup'"
				style="color: rgb(0, 0, 0); background: rgb(255, 255, 255); border-style: none;">회원가입</button>
		</div>
	</div>
	<script
		src="../../resource/term/login/assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>