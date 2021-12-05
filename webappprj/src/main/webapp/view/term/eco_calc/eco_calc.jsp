<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>eco_calc</title>

<link rel="stylesheet"
	href="../../resource/term/eco_calc/assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="../../resource/term/eco_calc/assets/fonts/font-awesome.min.css">
<link rel="stylesheet"
	href="../../resource/term/eco_calc/assets/css/styles.css">
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
<link rel="stylesheet"
	href="../../resource/term/main/assets/css/styles.css">
<script
	src="../../resource/term/main/assets/bootstrap/js/bootstrap.min.js"></script>
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
									</c:when>
									<c:otherwise>
										<span class="navbar-text"> ${userID}님,반갑습니다! </span>
										<a class="btn btn-light action-button" id="logout_btn"
											role="button" href="/logout.do">Log Out</a>
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
	<!-- <div class="d-flex justify-content-between align-items-center"
		id="header"
		style="height: 50px; text-align: center; background: rgb(92, 198, 186);">
		<i class="fa fa-chevron-left"
			style="width: 30px; height: 30px; font-size: 24px; color: rgb(255, 255, 255);"></i><label
			class="form-label"
			style="color: rgb(255, 255, 255); font-size: 24px;">친환경 지수 계산</label><i
			class="fa fa-ellipsis-v"
			style="width: 30px; height: 30px; font-size: 24px; color: rgb(255, 255, 255);"></i>
	</div> -->
	<div class="d-flex flex-column align-items-center">
		<div class="d-flex justify-content-between"
			style="height: 200px; margin: 20px; width: 80%; max-width: 600px;">
			<div style="width: 45%; height: 100%;">
				<p class="d-flex justify-content-center"
					style="margin-bottom: 0px; height: 70%; background: #ceffe2;">
					<img src="../../resource/term/eco_calc/assets/img/1.png" style="width: 70%; height: 100%;">
				</p>
				<p class="d-flex justify-content-between align-items-center"
					style="margin-bottom: 0px; height: 30%; background: #fefaee;">
					<button class="btn btn-primary" type="button" id="minus1"
						onclick="minus(this.id)"
						style="width: 40px; height: 40px; margin: 10px; background: rgb(92, 198, 186);">-</button>
					<span id="plastic_num1">0</span>
					<button class="btn btn-primary" type="button" id="plus1"
						onclick="plus(this.id)"
						style="width: 40px; height: 40px; margin: 10px; background: rgb(92, 198, 186);">+</button>
				</p>
			</div>
			<div style="width: 45%; height: 100%;">
				<p class="d-flex justify-content-center"
					style="margin-bottom: 0px; height: 70%; background: #ceffe2;">
					<img src="../../resource/term/eco_calc/assets/img/2.png" style="width: 70%; height: 100%;">
				</p>
				<p class="d-flex justify-content-between align-items-center"
					style="margin-bottom: 0px; height: 30%; background: #fefaee;">
					<button class="btn btn-primary" type="button" id="minus2"
						onclick="minus(this.id)"
						style="width: 40px; height: 40px; margin: 10px; background: rgb(92, 198, 186);">-</button>
					<span id="plastic_num2">0</span>
					<button class="btn btn-primary" type="button" id="plus2"
						onclick="plus(this.id)"
						style="width: 40px; height: 40px; margin: 10px; background: rgb(92, 198, 186);">+</button>
				</p>
			</div>
		</div>
		<div class="d-flex justify-content-between"
			style="height: 200px; margin: 20px; width: 80%; max-width: 600px;">
			<div style="width: 45%; height: 100%;">
				<p class="d-flex justify-content-center"
					style="margin-bottom: 0px; height: 70%; background: #ceffe2;">
					<img src="../../resource/term/eco_calc/assets/img/3.png" style="width: 70%; height: 100%;">
				</p>
				<p class="d-flex justify-content-between align-items-center"
					style="margin-bottom: 0px; height: 30%; background: #fefaee;">
					<button class="btn btn-primary" type="button" id="minus3"
						onclick="minus(this.id)"
						style="width: 40px; height: 40px; margin: 10px; background: rgb(92, 198, 186);">-</button>
					<span id="plastic_num3">0</span>
					<button class="btn btn-primary" type="button" id="plus3"
						onclick="plus(this.id)"
						style="width: 40px; height: 40px; margin: 10px; background: rgb(92, 198, 186);">+</button>
				</p>
			</div>
			<div style="width: 45%; height: 100%;">
				<p class="d-flex justify-content-center"
					style="margin-bottom: 0px; height: 70%; background: #ceffe2;">
					<img src="../../resource/term/eco_calc/assets/img/4.png" style="width: 70%; height: 100%;">
				</p>
				<p class="d-flex justify-content-between align-items-center"
					style="margin-bottom: 0px; height: 30%; background: #fefaee;">
					<button class="btn btn-primary" type="button" id="minus4"
						onclick="minus(this.id)"
						style="width: 40px; height: 40px; margin: 10px; background: rgb(92, 198, 186);">-</button>
					<span id="plastic_num4">0</span>
					<button class="btn btn-primary" type="button" id="plus4"
						onclick="plus(this.id)"
						style="width: 40px; height: 40px; margin: 10px; background: rgb(92, 198, 186);">+</button>
				</p>
			</div>
		</div>
		<button class="btn btn-primary" id="eco_calculation" type="button"
			style="background: rgb(92, 198, 186); width: 60%; max-width: 400px; margin-bottom: 15px; margin-top: 20px;">계산하기</button>
		<p id="eco_result"
			style="width: 80%; max-width: 600px; background: #b6efe9; padding: 5px; margin-bottom: 100px; visibility: hidden;">
			<span id="eco_result_span" style="width: 100%; max-width: 600px;">

			</span>
			<span style="width: 100%; max-width: 600px; font-size: 5px; word-wrap: break-word;">
				<br>참고 레퍼런스 :<br>
				https://www.khan.co.kr/kh_storytelling/2021/carbonprint/index.html<br>
				http://www.bosa.co.kr/news/articleView.html?idxno=2160508<br>
				https://www.hani.co.kr/arti/society/environment/984344.html<br>
				https://www.kcen.kr/USR_main2016.jsp??=life/life03
			</span>
		</p>

	</div>
	<script
		src="../../resource/term/eco_calc/assets/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$("#eco_calculation").on("click",function() {
			console.log("hi");
			var plastic1, plastic2, plastic3, plastic4;
			var sum_co2, airportByco2, trainByco2, busByco2;
			var result;				
			plastic1 = parseInt(document.getElementById("plastic_num1").innerText) * 52;
			plastic2 = parseInt(document.getElementById("plastic_num2").innerText) * 12;
			plastic3 = parseInt(document.getElementById("plastic_num3").innerText) * 5;
			plastic4 = parseInt(document.getElementById("plastic_num4").innerText) * 16;
			sum_co2 = ((plastic1 + plastic2 + plastic3 + plastic4) * 2.07).toFixed(1);
			airportByco2 = (sum_co2 * 3.5).toFixed(1);
			trainByco2 = (sum_co2 * 71.4).toFixed(1);
			busByco2 = (sum_co2 * 6.3).toFixed(1);
			result = "이산화탄소 발생량은 약 " + sum_co2
					+ "g CO2입니다.\n 대략 비행기로 " + airportByco2
					+ "m 만큼, \n기차로 " + trainByco2 + "m 만큼,"
					+ "\n버스로 " + busByco2
					+ "m 만큼의 거리를 걸어서 이동한 것과 같습니다!"
					+ "\n\n";
			document.getElementById("eco_result_span").innerText = result;
			
			document.getElementById("eco_result").style.visibility = "visible";
		});
	</script>

	<script type="text/javascript">
		function minus(clicked_id) {
			var num, str;
			str = clicked_id.slice(-1);
			num = parseInt(document.getElementById("plastic_num" + str).innerText);
			if (num == 0)
				return;
			document.getElementById("plastic_num" + str).innerText = num - 1;
		}
		function plus(clicked_id) {
			var num, str;
			str = clicked_id.slice(-1);
			num = parseInt(document.getElementById("plastic_num" + str).innerText);
			document.getElementById("plastic_num" + str).innerText = num + 1;
		}
	</script>
</body>

</html>