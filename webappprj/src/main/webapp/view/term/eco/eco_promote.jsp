<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>new_eco</title>
    <link rel="stylesheet" href="../../resource/term/eco/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="h../../resource/term/ttps://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700">
    <link rel="stylesheet" href="../../resource/term/eco/assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="../../resource/term/eco/assets/css/Features-Boxed.css">
    <link rel="stylesheet" href="../../resource/term/eco/assets/css/Header-Blue.css">
    <link rel="stylesheet" href="../../resource/term/eco/assets/css/styles.css">
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>

<body>
    <header class="header-blue" style="background: rgb(92,198,186);height: 72.594px;">
        <nav class="navbar navbar-dark navbar-expand-md navigation-clean-search">
            <div class="container-fluid"><i class="fa fa-chevron-left" style="width: 30px;height: 30px;font-size: 24px;color: rgb(255,255,255);"></i> <a class="navbar-brand" href="#">친환경 홍보</a><button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-1"><span class="visually-hidden">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navcol-1" style="background: rgb(92,198,186);">
                    <ul class="navbar-nav">
                        <li class="nav-item"><a class="nav-link" href="#">검색</a></li>
                        <li class="nav-item"><a class="nav-link" href="#" style="color: rgba(255,255,255,0.55);">지도</a></li>
                        <li class="nav-item"><a class="nav-link" href="#" style="color: rgba(255,255,255,0.55);">친환경 홍보</a></li>
                        <li class="nav-item"><a class="nav-link" href="#" style="color: rgba(255,255,255,0.55);">알림 설정</a></li>
                        <li class="nav-item dropdown"><a class="dropdown-toggle nav-link" aria-expanded="false" data-bs-toggle="dropdown" href="#">게시판</a>
                            <div class="dropdown-menu"><a class="dropdown-item" href="#">정보 게시판</a><a class="dropdown-item" href="#">나눔 게시판</a></div>
                        </li>
                    </ul>
                    <form class="d-flex me-auto navbar-form" target="_self">
                        <div class="d-flex align-items-center"><label class="form-label d-flex mb-0" for="search-field"><i class="fa fa-search"></i></label><input class="form-control search-field" type="search" id="search-field" name="search"></div>
                    </form><span class="navbar-text"> <a class="login" href="#">Log In</a></span><a class="btn btn-light action-button" role="button" href="#">Sign Up</a>
                </div>
            </div>
        </nav>
        <div class="container hero">
            <div class="row">
                <div class="col-md-5 col-lg-5 offset-lg-1 offset-xl-0 d-none d-lg-block phone-holder">
                    <div class="phone-mockup"></div>
                </div>
            </div>
        </div>
    </header>
    <section class="features-boxed">
        <div class="container">
            <div class="row justify-content-center features">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item" role="presentation"><a class="nav-link active" href="/eco_promote/1" style="background: rgb(92,198,186);">친환경 단체</a></li>
                            <li class="nav-item" role="presentation"><a class="nav-link"  href="/eco_promote/2" style="background: rgb(92,198,186);">친환경 제품</a></li>
                        </ul>
                        <c:forEach var="list" items="${list}" varStatus = "i">
                          <c:choose>
                          	<c:when test='${ecoCate.toString() == "2"}'>
                          		<c:if test='${list.eco_category.toString() == "2"}'>
	                          		<div class="col-sm-6 col-md-5 col-lg-4 item">
										<div class="box">
		                                    <h3 class="name">${list.eco_name}</h3>
		                                    <p class="description">${list.eco_contents }</p>
		                                    <a class="learn-more" href="${list.eco_url }">사이트 이동 »</a>
		                                </div>
	                          		</div>
                          		</c:if>
                          	</c:when>
                          	
                          	<c:otherwise>
                          		<c:if test='${list.eco_category.toString() == "1"}'>
	                          		<div class="col-sm-6 col-md-5 col-lg-4 item">
										<div class="box">
		                                    <h3 class="name">${list.eco_name}</h3>
		                                    <p class="description">${list.eco_contents }</p>
		                                    <a class="learn-more" href="${list.eco_url }">사이트 이동 »</a>
		                                </div>
	                          		</div>
                          		</c:if>
                          	</c:otherwise>
                          </c:choose>
						</c:forEach>
						<c:forEach var="list" items="${list}" varStatus = "i">
                          <c:choose>
                          	<c:when test='${ecoCate.toString() == "2"}'>
                          		<c:if test='${list.eco_category.toString() == "2"}'>
	                          		<div class="col-sm-6 col-md-5 col-lg-4 item">
										<div class="box">
		                                    <h3 class="name">${list.eco_name}</h3>
		                                    <p class="description">${list.eco_contents }</p>
		                                    <a class="learn-more" href="${list.eco_url }">사이트 이동 »</a>
		                                </div>
	                          		</div>
                          		</c:if>
                          	</c:when>
                          	
                          	<c:otherwise>
                          		<c:if test='${list.eco_category.toString() == "1"}'>
	                          		<div class="col-sm-6 col-md-5 col-lg-4 item">
										<div class="box">
		                                    <h3 class="name">${list.eco_name}</h3>
		                                    <p class="description">${list.eco_contents }</p>
		                                    <a class="learn-more" href="${list.eco_url }">사이트 이동 »</a>
		                                </div>
	                          		</div>
                          		</c:if>
                          	</c:otherwise>
                          </c:choose>
						</c:forEach>
						<c:forEach var="list" items="${list}" varStatus = "i">
                          <c:choose>
                          	<c:when test='${ecoCate.toString() == "2"}'>
                          		<c:if test='${list.eco_category.toString() == "2"}'>
	                          		<div class="col-sm-6 col-md-5 col-lg-4 item">
										<div class="box">
		                                    <h3 class="name">${list.eco_name}</h3>
		                                    <p class="description">${list.eco_contents }</p>
		                                    <a class="learn-more" href="${list.eco_url }">사이트 이동 »</a>
		                                </div>
	                          		</div>
                          		</c:if>
                          	</c:when>
                          	
                          	<c:otherwise>
                          		<c:if test='${list.eco_category.toString() == "1"}'>
	                          		<div class="col-sm-6 col-md-5 col-lg-4 item">
										<div class="box">
		                                    <h3 class="name">${list.eco_name}</h3>
		                                    <p class="description">${list.eco_contents }</p>
		                                    <a class="learn-more" href="${list.eco_url }">사이트 이동 »</a>
		                                </div>
	                          		</div>
                          		</c:if>
                          	</c:otherwise>
                          </c:choose>
						</c:forEach>
						<c:forEach var="list" items="${list}" varStatus = "i">
                          <c:choose>
                          	<c:when test='${ecoCate.toString() == "2"}'>
                          		<c:if test='${list.eco_category.toString() == "2"}'>
	                          		<div class="col-sm-6 col-md-5 col-lg-4 item">
										<div class="box">
		                                    <h3 class="name">${list.eco_name}</h3>
		                                    <p class="description">${list.eco_contents }</p>
		                                    <a class="learn-more" href="${list.eco_url }">사이트 이동 »</a>
		                                </div>
	                          		</div>
                          		</c:if>
                          	</c:when>
                          	
                          	<c:otherwise>
                          		<c:if test='${list.eco_category.toString() == "1"}'>
	                          		<div class="col-sm-6 col-md-5 col-lg-4 item">
										<div class="box">
		                                    <h3 class="name">${list.eco_name}</h3>
		                                    <p class="description">${list.eco_contents }</p>
		                                    <a class="learn-more" href="${list.eco_url }">사이트 이동 »</a>
		                                </div>
	                          		</div>
                          		</c:if>
                          	</c:otherwise>
                          </c:choose>
						</c:forEach>
						<c:forEach var="list" items="${list}" varStatus = "i">
                          <c:choose>
                          	<c:when test='${ecoCate.toString() == "2"}'>
                          		<c:if test='${list.eco_category.toString() == "2"}'>
	                          		<div class="col-sm-6 col-md-5 col-lg-4 item">
										<div class="box">
		                                    <h3 class="name">${list.eco_name}</h3>
		                                    <p class="description">${list.eco_contents }</p>
		                                    <a class="learn-more" href="${list.eco_url }">사이트 이동 »</a>
		                                </div>
	                          		</div>
                          		</c:if>
                          	</c:when>
                          	
                          	<c:otherwise>
                          		<c:if test='${list.eco_category.toString() == "1"}'>
	                          		<div class="col-sm-6 col-md-5 col-lg-4 item">
										<div class="box">
		                                    <h3 class="name">${list.eco_name}</h3>
		                                    <p class="description">${list.eco_contents }</p>
		                                    <a class="learn-more" href="${list.eco_url }">사이트 이동 »</a>
		                                </div>
	                          		</div>
                          		</c:if>
                          	</c:otherwise>
                          </c:choose>
						</c:forEach>
            </div>
        </div>
    </section>
    <script src="../../resource/term/eco/assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>