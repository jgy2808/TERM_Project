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
<link rel="stylesheet" href="../../resource/term/eco/assets/fonts/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
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
			<label for="camera" style="margin: 20px; padding: 5px; border: solid 1px black;">사물 검색</label>
			<input type="file" id="camera" name="camera" capture="camera"
				accept="image/*" style="position: absolute; clip: rect(0, 0, 0, 0);"/>
		</form>
		<div id="imgContainer"></div>
			<div id="clabel-container1" 
			style="width: 60%; max-width: 400px; margin: 10px; padding: 20px;
					border: 3px solid; visibility: hidden;">
				
			</div>
	</div>
	<script src="../../resource/term/search/assets/bootstrap/js/bootstrap.min.js"></script>
	
	<script src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@1.3.1/dist/tf.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@teachablemachine/image@0.8/dist/teachablemachine-image.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
        crossorigin="anonymous"></script>
<script type="text/javascript">
    // More API functions here:
    // https://github.com/googlecreativelab/teachablemachine-community/tree/master/libraries/image

    // the link to your model provided by Teachable Machine export panel
    const URL = "https://teachablemachine.withgoogle.com/models/wd0nFAx-_/";
   

    let model, webcam, img, wlabelContainer, ilabelContainer, clabelContainer, maxPredictions;
    // Load the image model and setup the webcam
    async function init() {
        const modelURL = URL + "model.json";
        const metadataURL = URL + "metadata.json";

        // load the model and metadata
        // Refer to tmImage.loadFromFiles() in the API to support files from a file picker
        // or files from your local hard drive
        // Note: the pose library adds "tmImage" object to your window (window.tmImage)
        model = await tmImage.load(modelURL, metadataURL);
        maxPredictions = model.getTotalClasses();

        // Convenience function to setup a webcam
        const flip = true; // whether to flip the webcam
        webcam = new tmImage.Webcam(400, 400, flip); // width, height, flip
        
        await webcam.setup(); // request access to the webcam
        await webcam.play();
        window.requestAnimationFrame(loop);
        
        // append elements to the DOM
        document.getElementById("webcam-container").appendChild(webcam.canvas);
        labelContainer = document.getElementById("label-container");
        for (let i = 0; i < maxPredictions; i++) { // and class labels
            labelContainer.appendChild(document.createElement("div"));
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
        //let maxPrediction = prediction[0].probability.toFixed(2);
        let maxPrediction = 0;
        let maxID = "";
        let classPrediction = "";
        for (let i = 0; i < maxPredictions; i++) {
            if (maxPrediction < prediction[i].probability.toFixed(2)){
                maxPrediction = prediction[i].probability.toFixed(2);
                classPrediction = prediction[i].className;
            }
        }
        if (classPrediction === "") {
        	alert("죄송합니당 사진을 다시 입력해주세용");
        }
        var data = {
        		recycle_title : classPrediction
        };
        $.ajax({
    		url : "/search_image.do",
    		type : "POST",
    		data : data,
			success : function(val) {
				//alert(val);
				classPrediction += ("는 " + val);
				label.innerHTML = classPrediction;
	            label.style.visibility = "visible";
			},
			error : function() {
				alert("fail");
			}
    	});
        
        
    }
    // run the webcam image through the image model
    async function predict() {
        // predict can take in an image, video or canvas html element
        const prediction = await model.predict(webcam.canvas);
        for (let i = 0; i < maxPredictions; i++) {
            const classPrediction =
                prediction[i].className + ": " + prediction[i].probability.toFixed(2);
            labelContainer.childNodes[i].innerHTML = classPrediction;
        }
    }
    
    /* $("#write").on("click", function(){
    	var tmp = $("#select_category button.dropdown-toggle").text().substr(0,2);
    	if(tmp == "정보")
    		var category = 1;
    	else if(tmp == "나눔")
    		var category = 2;
    	else
    		var category = 0; // 0은 미선택
    	var test = $("#select_category button.dropdown-toggle").text();
    	var title = $("textarea[name=title]").val();
    	var contents = $("textarea[name=contents]").val();
    	var data ={
    		"category" : category,
    		"title" : title,
    		"contents" : contents
    	}
    	
    }); */
</script>
</body>

</html>