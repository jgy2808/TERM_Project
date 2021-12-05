<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>new_board</title>
<link rel="stylesheet"
	href="../../resource/term/main/assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700">
<link rel="stylesheet"
	href="../../resource/term/main/assets/fonts/fontawesome-all.min.css">
<link rel="stylesheet"
	href="../../resource/term/main/assets/fonts/font-awesome.min.css">
<link rel="stylesheet"
	href="../../resource/term/main/assets/fonts/fontawesome5-overrides.min.css">
<link rel="stylesheet"
	href="../../resource/term/main/assets/css/Header-Blue.css">
<link rel="stylesheet" href="../../resource/term/main/assets/css/styles.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>

<body>
	<header class="header-blue"
		style="background: rgb(92, 198, 186); height: 72.594px;">
		<nav
			class="navbar navbar-dark navbar-expand-md navigation-clean-search">
			<div class="container-fluid">
				<i class="fa fa-chevron-left"
					style="width: 30px; height: 30px; font-size: 24px; color: rgb(255, 255, 255);"></i>
				<a class="navbar-brand" href="#">분리똑똑</a>
				<button data-bs-toggle="collapse" class="navbar-toggler"
					data-bs-target="#navcol-1">
					<span class="visually-hidden">Toggle navigation</span><span
						class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navcol-1"
					style="background: rgb(92, 198, 186);">
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link" href="#">검색</a></li>
						<li class="nav-item"><a class="nav-link" href="#"
							style="color: rgba(255, 255, 255, 0.55);">지도</a></li>
						<li class="nav-item"><a class="nav-link" href="#"
							style="color: rgba(255, 255, 255, 0.55);">친환경 홍보</a></li>
						<li class="nav-item"><a class="nav-link" href="#"
							style="color: rgba(255, 255, 255, 0.55);">알림 설정</a></li>
						<li class="nav-item dropdown"><a
							class="dropdown-toggle nav-link" aria-expanded="false"
							data-bs-toggle="dropdown" href="#">게시판</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="/board_main/1">정보 게시판</a><a
									class="dropdown-item" href="/board_main/2">나눔 게시판</a>
							</div></li>
					</ul>
					<form class="d-flex me-auto navbar-form" target="_self">
						<div class="d-flex align-items-center">
							<label class="form-label d-flex mb-0" for="search-field"><i
								class="fa fa-search"></i></label><input
								class="form-control search-field" type="search"
								id="search-field" name="search">
						</div>
					</form>
					<!-- <span class="navbar-text"> <a class="login" href="#">Log
							In</a></span><a class="btn btn-light action-button" role="button" href="#">Sign
						Up</a> -->
						<c:catch>
						<c:choose>
							<c:when test="${empty userID }">
								<span class="navbar-text"> <a class="login"
									href="/main/login">Log In</a>
								</span>
								<a class="btn btn-light action-button" role="button"
									href="/signup">Sign Up</a>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${userID eq '1' }">
										<li>
											<p>관리자 ${userID }님, 환영합니다.</p>
										</li>
										<a class="btn btn-light action-button" id="logout_btn"
											role="button" href="/logout.do">Log Out</a>
										<a class="btn btn-light action-button" id="Board_Write"
											role="button" href="/board_write">글쓰기</a>
									</c:when>
									<c:otherwise>
										<span class="navbar-text"> ${userID}님,반갑습니다! </span>
										<a class="btn btn-light action-button" id="logout_btn"
											role="button" href="/logout.do">Log Out</a>
										<a class="btn btn-light action-button" id="Board_Write"
											role="button" href="/board_write">글쓰기</a>
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
					</c:catch>
						
				</div>
			</div>
		</nav>
		<div class="container hero">
			<div class="row">
				<div
					class="col-md-5 col-lg-5 offset-lg-1 offset-xl-0 d-none d-lg-block phone-holder">
					<div class="phone-mockup"></div>
				</div>
			</div>
		</div>
	</header>
	<div>
		<!-- <script type="text/javascript" src="scrollTop.js"></script> -->

		<!-- 아래 부터 실질적인 리스트 -->
		<div id="boardListDiv">
			<div>
				<ul id="boardList" class="list">

					<c:forEach var="list" items="${list}" varStatus="i">

						<li class='articleColor${i.count % 2}' style="list-style: none;">
							<a style="width: 80%" class="subject"
							href="/detail/${list.board_num}"> <span class="title">
									<strong> [ <c:if
											test='${list.board_category.toString() == "1"}'>정보</c:if> <c:if
											test='${list.board_category.toString() eq "2"}'>나눔</c:if> ]
								</strong> ${list.board_title} <a style="float: right;"
									href="http://localhost:8080/detail/${list.board_num}#disqus_thread">댓글쓰~</a>

							</span>
						</a><br> <span style="width: 80%;"> <span class="writer">${list.userid}</span>
								| <span class="hit">게시글번호 : ${list.board_num}</span> | <span
								class="postdate">${list.upload_date}</span>
						</span>
						</li>

					</c:forEach>
				</ul>

			</div>
			<a id="back-to-top" href="#"
				class="btn btn-primary btn-lg back-to-top" role="button"
				title="Click to return on the top page" data-toggle="tooltip"
				data-placement="left"><span
				class="glyphicon glyphicon-chevron-up"></span></a>

		</div>
	</div>
	<script src="../../resource/term/main/assets/bootstrap/js/bootstrap.min.js"></script>
	<script id="dsq-count-scr" src="//bdd-2.disqus.com/count.js" async></script>
	<!--<script src="../resource/main/assets/js/scrollTop.js"></script>  -->
</body>

</html>