<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>search</title>
<link rel="stylesheet" href="../../resource/term/search/assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="../../resource/term/search/assets/css/styles.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="../../resource/term/eco/assets/fonts/font-awesome.min.css">
</head>

<body>
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
	<div class="d-flex flex-column align-items-center">
		<form id="fileForm" method="post" enctype="multipart/form-data">
	<label for="imgSearch" style="margin: 20px; padding: 5px; border: solid 1px black;">라벨 검색</label>
		<input type="file" id="imgSearch" name="imgFile"
    		style="position:absolute; clip:rect(0, 0, 0, 0);">
	</form>
		<div id="imgContainer"></div>
		<div id="result_div" 
			style="width: 60%; max-width: 400px; margin: 10px; padding: 20px;
					border: 3px solid; visibility: hidden;">
				<p id="text_result">
					
				</p>
				<p id="clabel-container1">
					
				</p>
		</div>
	</div>
	<script src="../../resource/term/search/assets/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		let img;
		$(document).ready(function() {
			$("#imgSearch").on("change", function(e) {
				document.getElementById("imgContainer").innerText = "";
				document.getElementById("result_div").style.visibility = "hidden";
				document.getElementById("text_result").innerText = "";
				document.getElementById("clabel-container1").innerText = "";
				img = new Image(300, 300);
	            img.src = window.URL.createObjectURL(e.target.files[0]);
	            document.getElementById("imgContainer").appendChild(img);
	            
				var formData = new FormData($("#fileForm")[0]);
	
				$.ajax({
					type : "POST",
					enctype : 'multipart/form-data', // 필수
					url : '/multipartUpload.do',
					data : formData, // 필수
					processData : false, // 필수
					contentType : false, // 필수
					success : function(result) {
						//alert(result);
						var real_result = result.split('$');
						document.getElementById("text_result").innerText += ("< 텍스트 추출 결과 >\n" + real_result[0]);
						document.getElementById("clabel-container1").innerText += ("< 분리수거 검색 결과 >\n" + real_result[1]);
						document.getElementById("result_div").style.visibility = "visible";
					},
					error : function() {
						alert("recycle fail");
					}
				});
			});
		});
	</script>
</body>

</html>