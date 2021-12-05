<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>new_board_write</title>
    
    <link rel="stylesheet" href="../../resource/term/write/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700">
    <link rel="stylesheet" href="../../resource/term/write/assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="../../resource/term/write/assets/css/Header-Blue.css">
    <link rel="stylesheet" href="../../resource/term/write/assets/css/styles.css">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>

<body>
    <header class="header-blue" style="background: rgb(92,198,186);height: 72.594px;">
        <nav class="navbar navbar-dark navbar-expand-md navigation-clean-search">
            <div class="container-fluid"><i class="fa fa-chevron-left" style="width: 30px;height: 30px;font-size: 24px;color: rgb(255,255,255);"></i> <a class="navbar-brand" href="#">분리똑똑</a><button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-1"><span class="visually-hidden">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
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
    </header>
    <div></div>
    
    <div id="select_category" class="dropdown" style="margin-left:20%;margin-top:3%;">
    <button class="btn btn-primary dropdown-toggle" aria-expanded="false" data-bs-toggle="dropdown" type="button" >게시판 선택 </button>
    <div class="dropdown-menu">
        <a class="dropdown-item" href="#">정보 게시판</a>
        <a class="dropdown-item" href="#">나눔 게시판</a></div>
	</div>

<div>
<textarea name="title" style="width: 60%;height: 30px;text-align: left;margin-left:20%;margin-top:1%;margin-bottom:1%;resize:none;"></textarea>
<textarea name="contents" style="width: 60%;height: 320px;text-align: left;margin-left:20%;margin-top:1%;resize:none;"></textarea>
    
 
</div> 
    <button class="btn btn-success" id="write" style="width:9%;margin-left:60%" type="submit">등록</button>
    <button class="btn btn-secondary" style="width:9%;margin-left:1%" type="submit">취소</button>
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="../../resource/term/write/assets/bootstrap/js/bootstrap.min.js"></script>
    
    <script type="text/javascript">
    $('#select_category .dropdown-menu > a').bind('click',function (e) {
        var html = $(this).html();
        $('#select_category button.dropdown-toggle').html(html +' <span></span>');
    });
    
    $("#write").on("click", function(){
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
    	$.ajax({
    		url : "/board_write.do",
    		type : "POST",
    		data : JSON.stringify(data),
    		contentType : "application/json; charset=UTF-8",
    		dataType : "text",
			success : function(val) {
				alert(val);
				location.href = "/board_main";
			},
			error : function() {
				alert("fail");
			}
    	});
    });

    </script>
</body>

</html>