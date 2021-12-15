<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>Home - Brand</title>
<meta name="description" content="분리정보 Q&amp;A">
<link rel="stylesheet"
	href="../../resource/term/qna/assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic">
<link rel="stylesheet"
	href="../../resource/term/qna/assets/fonts/font-awesome.min.css">
<link rel="stylesheet"
	href="../../resource/term/qna/assets/fonts/simple-line-icons.min.css">
<link rel="stylesheet"
	href="../../resource/term/qna/assets/css/Navigation-with-Button.css">
</head>

<body id="page-top">
	<header class="" style="background: rgb(92, 198, 186); height: 60px;">
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
								<a class="dropdown-item" href="/board_main/1">정보 게시판</a>
								<a class="dropdown-item" href="/board_main/2">나눔 게시판</a>
							</div></li>
					</ul>
					<form class="d-flex me-auto navbar-form" target="_self">
						<div class="d-flex align-items-center"></div>
					</form>
					<c:catch>
						<c:choose>
							<c:when test="${empty userID }">
								<span class="navbar-text"> <a class="login"
									style="margin-right: 20px;" href="/main/login">Log In</a>
								</span>
								<a class="btn btn-light action-button" role="button"
									style="background: rgba(255, 255, 255, 0); border-style: none; color: rgb(255, 255, 255);"
									href="/signup">Sign Up</a>

							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${userID eq '1' }">
										<li>
											<p>관리자 ${userID }님, 환영합니다.</p>
										</li>
										<a class="btn btn-light action-button" id="logout_btn"
											style="background: rgba(255, 255, 255, 0); border-style: none; color: rgb(255, 255, 255);"
											role="button" href="/logout.do">Log Out</a>
									</c:when>
									<c:otherwise>
										<span class="navbar-text"> <a href="/changepw">${userID}</a>님,반갑습니다!
										</span>
										<a class="btn btn-light action-button" id="logout_btn"
											style="background: rgba(255, 255, 255, 0); border-style: none; color: rgb(255, 255, 255);"
											role="button" href="/logout.do">Log Out</a>
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
					</c:catch>
				</div>
			</div>
		</nav>
	</header>
	<div class="d-flex masthead"
		style="background-image: url('../../resource/term/qna/assets/img/tree.jpg');">
		<div class="container my-auto text-center"
			style="background: rgba(255, 255, 255, 0.74);">
			<h1 class="mb-1">Q &amp; A</h1>
			<h3 class="mb-5">
				<em>좀 더 정확한 분리배출을 위하여!</em>
			</h3>
			<div class="overlay"></div>
		</div>
	</div>
	<section id="portfolio" class="content-section">
		<div class="container" style="width: 80%; max-width: 80%;">
			<div class="content-section-heading text-center">
				<h2 class="mb-5">가장 궁금해 할 질문 Best 4</h2>
			</div>
			<div class="row g-0">
				<div class="col-lg-6">
					<div class="portfolio-item">
						<div
							class="d-flex flex-row justify-content-center align-items-center align-items-lg-center caption">
							<div class="caption-content" style="width: 80%; margin: 0px;">
								<p class="mb-0"
									style="font-size: 28px; background: rgba(255, 255, 255, 0.56); color: rgb(0, 0, 0); font-weight: bold;">
									<em style="font-size: 35px;">Q : 페트병이 색상별로 구분되어 있는데 어떻게 배출하나요?</em><br>
									<br>A : 색상에 구분 없이 페트병에 배출합니다.<br>
								</p>
							</div>
						</div>
						<img class="img-fluid" src="../../resource/term/qna/assets/img/portfolio-1.jpg"
						style="width: 100%;">
					</div>
				</div>
				<div class="col-lg-6">
					<div class="portfolio-item">
						<div
							class="d-flex flex-row justify-content-center align-items-center align-items-lg-center caption">
							<div class="caption-content" style="width: 80%; margin: 0px;">
								<p class="mb-0"
									style="background: rgba(255, 255, 255, 0.56); color: rgb(0, 0, 0); font-weight: bold; font-size: 24px;">
									<em style="font-size: 35px;">Q : 향수, 샴푸 등 펌핑식 용기는 어떻게 배출하나요?</em><br>
									<br>A : 펌핑식 용기의 부속품(노즐, 스프링 등)은 별도 배출 후 본체만 깨끗이 씻어서 플라스틱류에
									배출합니다<br>
								</p>
							</div>
						</div>
						<img class="img-fluid" src="../../resource/term/qna/assets/img/QA_pic5.png"
						style="width: 100%;">
					</div>
				</div>
				<div class="col-lg-6">
					<div class="portfolio-item">
						<div class="d-flex flex-row justify-content-center align-items-center align-items-lg-center caption">
							<div class="caption-content" style="width: 80%; margin: 0px;">
								<p class="mb-0"
									style="background: rgba(255, 255, 255, 0.56); color: rgb(0, 0, 0); font-weight: bold; font-size: 28px;">
									<em style="font-size: 35px;">Q : 제품을 포장한 뽁뽁이(버블랩)는 어떻게 배출하나요?</em><br>
									<br>A : 뽁뽁이(버블랩)는 비닐류로 배출합니다<br>
								</p>
							</div>
						</div>
						<img class="img-fluid" src="../../resource/term/qna/assets/img/QA_pic1.jpg"
						style="width: 100%;">
					</div>
				</div>
				<div class="col-lg-6">
					<div class="portfolio-item">
						<div class="d-flex flex-row justify-content-center align-items-center caption">
							<div class="caption-content" style="width: 80%; margin: 0px;">
								<p class="mb-0"
									style="background: rgba(255, 255, 255, 0.56); color: rgb(0, 0, 0); font-weight: bold; font-size: 24px;">
									<em style="font-size: 35px;">Q : 일반 유리제품(유리잔 또는 맥주컵 등)은 어떻게 배출하나요?</em><br>
									<br>A : 일반 유리잔이나 맥주컵은 유리병류로 배출합니다.<br> 단, 내열유리는 일반유리와
									혼합되면 재활용 처리 시 불량을 유발하므로 특수마대(불연물질)를 구매하여 배출합니다.
								</p>
							</div>
						</div>
						<img class="img-fluid" src="../../resource/term/qna/assets/img/portfolio-4.jpg"
						style="width: 100%;">
					</div>
				</div>
			</div>
		</div>
	</section>
	<footer class="footer text-center">
		<section id="services"
			class="content-section bg-primary text-white text-center"
			style="width: 1000; height: 500;">
			<div class="container">
				<div class="content-section-heading">
					<h3 class="text-secondary mb-0">Services</h3>
					<h2 class="mb-5">Q &amp; A</h2>
				</div>
				<div class="row">
					<div class="col-md-6 col-lg-3 mb-5 mb-lg-0">
						<span class="mx-auto service-icon rounded-circle mb-3"><i
							class="icon-screen-smartphone"></i></span>
						<h4>
							<strong>현명한 분리배출</strong>
						</h4>
						<p class="mb-0 text-faded"></p>
					</div>
					<div class="col-md-6 col-lg-3 mb-5 mb-lg-0">
						<span class="mx-auto service-icon rounded-circle mb-3"><i
							class="icon-pencil"></i></span>
						<h4>궁금증 해결</h4>
					</div>
					<div class="col-md-6 col-lg-3 mb-5 mb-lg-0">
						<span class="mx-auto service-icon rounded-circle mb-3"><i
							class="icon-like"></i></span>
						<h4>
							<strong>높은 만족도</strong>
						</h4>
						<p class="mb-0 text-faded"></p>
					</div>
					<div class="col-md-6 col-lg-3 mb-5 mb-lg-0">
						<span class="mx-auto service-icon rounded-circle mb-3"><i
							class="icon-mustache"></i></span>
						<h4>
							<strong>Question</strong>
						</h4>
					</div>
				</div>
			</div>
		</section>
			<div class="container">
				<ul class="list-inline mb-5">
					<li class="list-inline-item">&nbsp;</li>
				</ul>
				<p class="text-muted mb-0 small">Copyright &nbsp;© BunriDdokDdok
					2021</p>
			</div>
			<a class="js-scroll-trigger scroll-to-top rounded" href="#page-top"><i
				class="fa fa-angle-up"></i></a>
		</footer>
		<script
			src="../../resource/term/qna/assets/bootstrap/js/bootstrap.min.js"></script>
		<script src="../../resource/term/qna/assets/js/stylish-portfolio.js"></script>
</body>

</html>