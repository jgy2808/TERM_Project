<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<header class=""
		style="background: rgb(92, 198, 186); height: 60px;">
		<nav
			class="navbar navbar-dark navbar-expand-md navigation-clean-search">
			<div class="container-fluid">
			<i class="fa fa-chevron-left" onclick="history.back()"
					style="width: 30px; height: 30px; font-size: 24px; color: rgb(255, 255, 255);"></i>
				<a class="navbar-brand" href="/">분리똑똑</a>
				<button data-bs-toggle="collapse" class="navbar-toggler"
					data-bs-target="#navcol-2">
					<span class="visually-hidden">Toggle navigation</span><span
						class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navcol-2"
					style="background: rgb(92, 198, 186);">
					<ul class="navbar-nav">
						<li class="nav-item dropdown"><a
							class="dropdown-toggle nav-link" aria-expanded="false"
							data-bs-toggle="dropdown" href="#">친환경 검색</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="/search_image">사물 검색</a><a
									class="dropdown-item" href="/search_text">라벨 검색</a>
							</div></li>
						<li class="nav-item"><a class="nav-link" href="/map"
							style="color: rgba(255, 255, 255, 0.55);">지도</a></li>
						<li class="nav-item dropdown"><a
							class="dropdown-toggle nav-link" aria-expanded="false"
							data-bs-toggle="dropdown" href="/board_main">친환경 서비스</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="/eco_promote">친환경 홍보</a>
								<a class="dropdown-item" href="/NewFile">알림 설정</a>
								<a class="dropdown-item" href="/eco_calc">친환경 지수</a>
								<a class="dropdown-item" href="/qna">친환경 Q&A</a>
							</div>
						</li>
						<li class="nav-item dropdown"><a
							class="dropdown-toggle nav-link" aria-expanded="false"
							data-bs-toggle="dropdown" href="/board_main">게시판</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="/board_main">전체 게시판</a>
								<a class="dropdown-item" href="/board_main/1">정보 게시판</a><a
									class="dropdown-item" href="/board_main/2">나눔 게시판</a>
							</div></li>
					</ul>					
				</div>
			</div>
		</nav>
	</header>
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
			<!-- <div class="text-start d-flex align-items-center"
				style="width: 80%; background: rgb(255, 255, 255); border-style: none; margin-top: 5px; max-width: 400px;">
				<input type="checkbox" id="maintain_login" name="remember_me" style="width: 25px; height: 25px;"> 
				<label class="form-label" style="margin-left: 5px;">자동 로그인</label>
			</div> -->
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