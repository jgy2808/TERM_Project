<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html lang="en">

<head>
<meta charset="UTF-8">
</head>

<body>
	<button type="button" onclick="init()">Start</button>
	<div id="webcam-container"></div>
	<div id="wlabel-container"></div>
	<div id="image-container"></div>
	<div id="ilabel-container"></div>
	<br>
	
	<div>
		<c:if test="${userID == null }">
			<div id="id">로그인</div>
			<form action="/view/login" method="post">
				<button type="submit">login</button>
			</form>
			<div id="id">회원가입</div>
			<form action="/view/signup" method="post">
				<button type="submit">signup</button>
			</form>
		</c:if>
		<c:if test="${userID != null }">
			<div id="id">${userID}</div>
			<form action="/view/logout.do" method="post">
				<button type="submit">logout</button>
			</form>
		</c:if>
	</div>
	
	<button type="button" onclick="board()">게시판 : user</button>
<%-- 	<security:authorize access="hasRole('ROLE_ADMIN')">
		<form action="/admin/board" method="post">
			<button type="submit">게시판 : admin</button>
		</form>
	</security:authorize> --%>
<%-- 	<security:authorize access="hasRole('ROLE_USER')">

	</security:authorize> --%>
	<br>
	
	<h3>재활용품 검색</h3>
	<input type="file" id="camera" name="camera" capture="camera"
		accept="image/*" />
	<br>
	<img id="pic" style="width: 300px;">
	<div id="imgContainer"></div>
	<br>
	<br>
	<form id="search" action="/view/index" method="post">
		<div id="clabel-container1"></div>
		<input id="searchinput" type="text" name="object" placeholder="사물 이미지를 업로드하거나 여기에 입력해주세요" style="width: 70%">
		<button id="searchbtn" type="submit" value="검색" >검색</button>
	</form>
	<br>
	
	<br>
	<br>
	<br>
	<div id="map" style="width: 500px; height: 400px;"></div>
	<br>
	<div style="font-size: 30px;">끝입니다.2</div>


	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e4bb2d32deed20324bb7a5808dc7a154"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=046cd194ee8d03c6a0533fc27ac4448a"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@1.3.1/dist/tf.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@teachablemachine/image@0.8/dist/teachablemachine-image.min.js"></script>

	
	<!-- 게시판 입장 관리 부분 -->
	<script type="text/javascript">
		function board(){
			var userID = "<%=(String)session.getAttribute("userID")%>"
			console.log("function board in");
			if ( userID === "null" ){
				console.log("board if -> true");
				alert("로그인 후 사용가능합니다.");
			} else {
				console.log("board if -> false");
				location.href = "/board";
			}
		}
	</script>
	
	
	<!-- 지도 js 부분 -->
	<script type="text/javascript">
		 let container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	     let options = { //지도를 생성할 때 필요한 기본 옵션
	     	center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
	     	level: 3 //지도의 레벨(확대, 축소 정도)
	     };
	
	     let map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	</script>
	
	<!-- 인공지능 이미지 인식 부분 -->
	<script type="text/javascript">
            // More API functions here:
            // https://github.com/googlecreativelab/teachablemachine-community/tree/master/libraries/image

            // the link to your model provided by Teachable Machine export panel
            const URL = "https://teachablemachine.withgoogle.com/models/UekBlagDC/";
			
            
            let model, webcam, img, wlabelContainer, ilabelContainer, clabelContainer, maxPredictions;

            // Load the image model and setup the webcam
            async function init() {
                // load the model and metadata
                // Refer to tmImage.loadFromFiles() in the API to support files from a file picker
                // or files from your local hard drive
                // Note: the pose library adds "tmImage" object to your window (window.tmImage)

                img = new Image(200, 200);
                img.src = "/resource/glass.jpg";
                document.getElementById("image-container").appendChild(img);
                
           		const modelURL = URL + "model.json";
           		const metadataURL = URL + "metadata.json";
                model = await tmImage.load(modelURL, metadataURL);
                maxPredictions = model.getTotalClasses();

                // Convenience function to setup a webcam
                const flip = true; // whether to flip the webcam
                webcam = new tmImage.Webcam(200, 200, flip); // width, height, flip
                await
                    webcam.setup(); // request access to the webcam
                await
                    webcam.play();
                window.requestAnimationFrame(loop);

                // append elements to the DOM
                document.getElementById("webcam-container").appendChild(
                    webcam.canvas);

                wlabelContainer = document.getElementById("wlabel-container");
                for (let i = 0; i < maxPredictions; i++) { // and class labels
                    wlabelContainer.appendChild(document.createElement("div"));
                }

                ilabelContainer = document.getElementById("ilabel-container");
                Imagepredict(ilabelContainer);
                
                for (let i = 0; i < maxPredictions; i++) { // and class labels
                    ilabelContainer.appendChild(document.createElement("div"));
                }

            }

            $(document).ready(function () {
                console.log("ready on");

                if (!('url' in window) && ('webkitURL' in window)) {
                	console.log("if on");
                    window.URL = window.webkitURL;
                }
                $('#camera').change(async function (e) {
                	console.log("change on");
                    
                    img = new Image(300, 300);
                    img.src = window.URL.createObjectURL(e.target.files[0]);
                    const imgctn = document.getElementById("imgContainer");
                    imgctn.innerHTML = "<div id=\"imgContainer\"></div>";
                    imgctn.appendChild(img);
                    

                	const modelURL = URL + "model.json";
           			const metadataURL = URL + "metadata.json";
           		
                	model = await tmImage.load(modelURL, metadataURL);
                    maxPredictions = model.getTotalClasses();
                    
                    clabelContainer = document.getElementById("clabel-container1");
                    Imagepredict(clabelContainer);
                    clabelContainer.appendChild(document.createElement("div"));
                    document.getElementById("searchbtn").disabled = false;
                    console.log("change off");
                });
                console.log("ready off");
            });

            async function loop() {
                webcam.update(); // update the webcam frame
                await predict();
                window.requestAnimationFrame(loop);
            }

            async function Imagepredict(label) {
                const prediction = await model.predict(img);
                let maxPrediction = prediction[0].probability.toFixed(2);
                let maxID = "";
                let classPrediction = "";
                for (let i = 1; i < maxPredictions; i++) {
                	if (maxPrediction < prediction[i].probability.toFixed(2)){
                		maxPrediction = prediction[i].probability.toFixed(2);
                        classPrediction = prediction[i].className;
                	}
                }
                label.innerHTML = classPrediction + ": " + maxPrediction;
                if (classPrediction === "플라스틱"){
                	maxID = "plastic";
                }
                const searchinput = document.getElementById("searchinput").value = maxID;
            }
            // run the webcam image through the image model
            async function predict() {
                // predict can take in an image, video or canvas html element
                const prediction = await
                    model.predict(webcam.canvas);
                for (let i = 0; i < maxPredictions; i++) {
                    const classPrediction = prediction[i].className + ": "
                        + prediction[i].probability.toFixed(2);
                    wlabelContainer.childNodes[i].innerHTML = classPrediction;
                }
            }
        </script>
</body>

</html>