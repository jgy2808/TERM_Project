<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>주소로 장소 표시하기</title>
   <link rel="stylesheet" href="../../resource/term/search/assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="../../resource/term/search/assets/css/styles.css">
<link rel="stylesheet" href="../../resource/term/eco/assets/fonts/font-awesome.min.css">
<script src="../../resource/term/search/assets/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<header class=""
		style="background: rgb(92, 198, 186); height: 60px;">
		<nav
			class="navbar navbar-dark navbar-expand-md navigation-clean-search"
			style="z-index: 1;">
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
	<div id="map" style="width:100%;height:750px; z-index: 0;">
	</div>
	<button type="button" class="btn btn-lg btn-primary" onclick="getCurrentPosBtn()" id="getMyPositionBtn">내 위치 가져오기</button>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7d5990a2997b6fcf630b1e05017f7a5c&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(37.650701, 127.570667), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };  

// 지도를 생성합니다
var map = new daum.maps.Map(mapContainer, mapOption);

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();

function locationLoadSuccess(pos){
    // 현재 위치 받아오기
    var currentPos = new kakao.maps.LatLng(pos.coords.latitude,pos.coords.longitude);

    // 지도 이동(기존 위치와 가깝다면 부드럽게 이동)
    map.panTo(currentPos);
    
    var imageSrc = 'https://cdn2.iconfinder.com/data/icons/color-svg-vector-icons-2/512/map_marker_base-128.png', // 마커이미지의 주소입니다    
    imageSize = new kakao.maps.Size(35, 35);// 마커이미지의 크기입니다
    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize)
    
    var marker = new kakao.maps.Marker({
        position: currentPos,
        image: markerImage
    });

    // 기존에 마커가 있다면 제거
    marker.setMap(null);
    marker.setMap(map);
};

function locationLoadError(pos){
    alert('위치 정보를 가져오는데 실패했습니다.');
};

// 위치 가져오기 버튼 클릭시
function getCurrentPosBtn(){
    navigator.geolocation.getCurrentPosition(locationLoadSuccess,locationLoadError);
};

var listData = [
    {
        groupAddress: '서울특별시 중랑구 신내동 신내로 156', 
    },
    {
        groupAddress: '서울특별시 중랑구 신내동 618', 
    },
    {
        groupAddress: '서울 중랑구 신내로 지하 232', 
    },
    {
        groupAddress: '서울 중랑구 묵동 30', 
    },
    {
        groupAddress: '서울 중랑구 상봉동 493', 
    },
    {
        groupAddress: '서울 중랑구 동일로 921-91', 
    },
    {
        groupAddress: '서울 중랑구 동일로 918', 
    },
    {
        groupAddress: '서울 중랑구 동일로 886', 
    },
    {
        groupAddress: '서울 중랑구 동일로 810', 
    }
];
    
for (var i=0; i < listData.length ; i++) {
// 주소로 좌표를 검색합니다
geocoder.addressSearch(listData[i].groupAddress, function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === daum.maps.services.Status.OK) {

        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
        
        var imageSrc = 'https://cdn4.iconfinder.com/data/icons/travello-basic-ui-1/64/Trash-128.png', // 마커이미지의 주소입니다    
           imageSize = new kakao.maps.Size(25, 25);// 마커이미지의 크기입니다
        
        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize)
                
        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new daum.maps.Marker({
            map: map,
            position: coords,
            image: markerImage
        });

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
})


};    
</script>

</body>
</html>