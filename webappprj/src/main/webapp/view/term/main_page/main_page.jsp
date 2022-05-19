<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>분리똑똑</title>
<link rel="stylesheet"
	href="../../resource/term/main_page/assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic">
<link rel="stylesheet"
	href="../../resource/term/main_page/assets/fonts/font-awesome.min.css">
<link rel="stylesheet"
	href="../../resource/term/main_page/assets/fonts/simple-line-icons.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
<link rel="stylesheet"
	href="../../resource/term/main_page/assets/css/untitled.css">
</head>

<body>
	<header class="header-blue"
		style="background: rgb(92, 198, 186); height: 60px;">
		<nav
			class="navbar navbar-dark navbar-expand-md navigation-clean-search"
			style="z-index: 1;">
			<div class="container-fluid">
				<a class="navbar-brand" href="#">분리똑똑</a>
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
									style="background: rgba(255, 255, 255, 0); border-style: none; color: rgb(255, 255, 255);" href="/signup">Sign Up</a>
									
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
										<span class="navbar-text"> <a href="/changepw">${userID}</a>님,반갑습니다! </span>
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
	<section
		class="text-center bg-light d-flex flex-column align-items-center features-icons">
		<div class="carousel slide" data-bs-ride="carousel" id="carousel-1"
			style="width: 80%; z-index: 0;">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img class="w-100 d-block"
						src="../../resource/term/main_page/assets/img/KakaoTalk_20211213_123802810.png"
						alt="Slide Image" style="margin-bottom: 30px;">
				</div>
				<div class="carousel-item">
					<img class="w-100 d-block"
						src="../../resource/term/main_page/assets/img/KakaoTalk_20211212_013226490.jpg"
						alt="Slide Image" style="margin-bottom: 30px;">
				</div>
				<div class="carousel-item">
					<img class="w-100 d-block"
						src="../../resource/term/main_page/assets/img/KakaoTalk_20211212_013222385.png"
						alt="Slide Image" style="margin-bottom: 30px;">
				</div>
				<div class="carousel-item">
					<img class="w-100 d-block"
						src="../../resource/term/main_page/assets/img/sigmund-aI4RJ--Mw4I-unsplash.jpg"
						alt="Slide Image" style="margin-bottom: 30px;">
				</div>
				<div class="carousel-item">
					<img class="w-100 d-block"
						src="../../resource/term/main_page/assets/img/lukasz-rawa-_4NF4Jppx-c-unsplash.jpg"
						alt="Slide Image" style="margin-bottom: 30px;">
				</div>
			</div>
			<div>
				<a class="carousel-control-prev" href="#carousel-1" role="button"
					data-bs-slide="prev"><span class="carousel-control-prev-icon"></span><span
					class="visually-hidden">Previous</span></a><a
					class="carousel-control-next" href="#carousel-1" role="button"
					data-bs-slide="next"><span class="carousel-control-next-icon"></span><span
					class="visually-hidden">Next</span></a>
			</div>
			<ol class="carousel-indicators">
				<li data-bs-target="#carousel-1" data-bs-slide-to="0" class="active"></li>
				<li data-bs-target="#carousel-1" data-bs-slide-to="1"></li>
				<li data-bs-target="#carousel-1" data-bs-slide-to="2"></li>
				<li data-bs-target="#carousel-1" data-bs-slide-to="3"></li>
				<li data-bs-target="#carousel-1" data-bs-slide-to="4"></li>
			</ol>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-4">
					<div class="mx-auto features-icons-item mb-5 mb-lg-0 mb-lg-3"
					onclick="location.href = '/search_image'" style="cursor: pointer;">
						<div class="d-flex features-icons-icon">
							<i class="icon-bulb m-auto text-primary"
								data-bss-hover-animate="pulse"></i>
						</div>
						<h3>분리수거 방법</h3>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="mx-auto features-icons-item mb-5 mb-lg-0 mb-lg-3"
					onclick="location.href = '/map'" style="cursor: pointer;">
						<div class="d-flex features-icons-icon">
							<i class="icon-map m-auto text-primary"
								data-bss-hover-animate="pulse"></i>
						</div>
						<h3>친환경 지도</h3>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="mx-auto features-icons-item mb-5 mb-lg-0 mb-lg-3"
					onclick="location.href = '/'" style="cursor: pointer;">
						<div class="d-flex features-icons-icon">
							<i class="icon-bell m-auto text-primary"
								data-bss-hover-animate="pulse"></i>
						</div>
						<h3>친환경 알림</h3>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="mx-auto features-icons-item mb-5 mb-lg-0 mb-lg-3"
					onclick="location.href = '/eco_calc'" style="cursor: pointer;">
						<div class="d-flex features-icons-icon">
							<i class="icon-calculator m-auto text-primary"
								data-bss-hover-animate="pulse"></i>
						</div>
						<h3>친환경 지수</h3>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="mx-auto features-icons-item mb-5 mb-lg-0 mb-lg-3"
					onclick="location.href = '/board_main'" style="cursor: pointer;">
						<div class="d-flex features-icons-icon">
							<i class="icon-screen-tablet m-auto text-primary"
								data-bss-hover-animate="pulse"></i>
						</div>
						<h3>친환경 게시판</h3>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="mx-auto features-icons-item mb-5 mb-lg-0 mb-lg-3"
						onclick="location.href = '/eco_promote'" style="cursor: pointer;">
						<div class="d-flex features-icons-icon">
							<i class="icon-compass m-auto text-primary"
								data-bss-hover-animate="pulse"></i>
						</div>
						<h3>친환경 홍보</h3>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="showcase">
		<div class="container-fluid p-0">
			<div class="row g-0">
				<div class="col-lg-6 text-white order-lg-2 showcase-img"
					style="background-image: url(../../resource/term/main_page/assets/img/bg-showcase-1.jpg);">
					<span></span>
				</div>
				<div class="col-lg-6 my-auto order-lg-1 showcase-text">
					<h2>손쉬운 사용</h2>
					<p class="lead mb-0">핸드폰 카메라를 이용한 손쉬운 검색</p>
				</div>
			</div>
			<div class="row g-0">
				<div class="col-lg-6 text-white showcase-img"
					style="background-image: url(../../resource/term/main_page/assets/img/bg-showcase-2.jpg);">
					<span></span>
				</div>
				<div class="col-lg-6 my-auto order-lg-1 showcase-text">
					<h2>유지보수</h2>
					<p class="lead mb-0">탄소 제로 목표를 위한 끊임 없는 유지보수</p>
				</div>
			</div>
		</div>
	</section>
	<section class="text-center bg-light testimonials">
		<div class="container">
			<h2 class="mb-5">팀원 소개</h2>
			<div class="row">
				<div class="col-lg-4">
					<div class="mx-auto testimonial-item mb-5 mb-lg-0"></div>
				</div>
				<div class="col-lg-4">
					<div class="mx-auto testimonial-item mb-5 mb-lg-0">
						<img class="rounded-circle img-fluid mb-3"
							src="../../resource/term/main_page/assets/img/ykm.png">
						<h5>KwonMo Y.</h5>
						<p class="font-weight-light mb-0">Heart Monkey</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4">
					<div class="mx-auto testimonial-item mb-5 mb-lg-0">
						<img class="rounded-circle img-fluid mb-3"
							src="../../resource/term/main_page/assets/img/ysb.png">
						<h5>SungBin Y.</h5>
						<p class="font-weight-light mb-0">Pig</p>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="mx-auto testimonial-item mb-5 mb-lg-0">
						<img class="rounded-circle img-fluid mb-3"
							src="../../resource/term/main_page/assets/img/les.png">
						<h5>EunSung L.</h5>
						<p class="font-weight-light mb-0">Mouse</p>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="mx-auto testimonial-item mb-5 mb-lg-0">
						<img class="rounded-circle img-fluid mb-3"
							src="../../resource/term/main_page/assets/img/jgy.png">
						<h5>GuYeon J,</h5>
						<p class="font-weight-light mb-0">Ghaori</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<footer class="bg-light footer">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 text-center text-lg-start my-auto h-100">
					<p class="text-muted small mb-4 mb-lg-0">©&nbsp;
						BunriDdokDdok&nbsp;&nbsp;2021. All Rights Reserved.</p>
				</div>
				<div class="col-lg-6 text-center text-lg-end my-auto h-100">
					<ul class="list-inline mb-0">
						<li class="list-inline-item"><a href="https://www.facebook.com/profile.php?id=100008159497146"><i
								class="fa fa-facebook fa-2x fa-fw"></i></a></li>
						<li class="list-inline-item"><a href="https://www.instagram.com/kwon._.moya/?hl=ko"><i
								class="fa fa-instagram fa-2x fa-fw"></i></a></li>
					</ul>
				</div>
				
				<div class="col-lg-6 text-center text-lg-start my-auto h-100">
					<p class="text-muted small mb-4 mb-lg-0">
						&nbsp;</p>
				</div>
				
				<div class="col-lg-6 text-center text-lg-start my-auto h-100">
					<p class="text-muted small mb-4 mb-lg-0" style="text-align: right;">
						Send Direct Message to manager.</p>
				</div>
			</div>
		</div>
	</footer>
	<script
		src="../../resource/term/main_page/assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="../../resource/term/main_page/assets/js/bs-init.js"></script>
</body>

</html>