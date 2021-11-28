<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>foundid</title>
<link rel="stylesheet" href="../../resource/term/foundid/assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="../../resource/term/foundid/assets/fonts/font-awesome.min.css">
<link rel="stylesheet" href="../../resource/term/foundid/assets/css/styles.css">
<script src="../../resource/term/foundid/assets/bootstrap/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>

<body class="text-center">
	<div class="d-flex justify-content-between align-items-center"
		id="header"
		style="height: 50px; text-align: center; background: rgb(92, 198, 186);">
		<i class="fa fa-chevron-left"
			style="width: 30px; height: 30px; font-size: 24px; color: rgb(255, 255, 255);"></i><label
			class="form-label"
			style="color: rgb(255, 255, 255); font-size: 24px;">아이디 찾기</label><i
			class="fa fa-ellipsis-v"
			style="width: 30px; height: 30px; font-size: 24px; color: rgb(255, 255, 255);"></i>
	</div>
	<div
		class="d-flex flex-column justify-content-center align-items-center">
		<label class="form-label" style="margin-top: 15px;">
			<span id="username"></span>님의 아이디는 <span id="userid"></span> 입니다.
		</label>
		<div class="d-flex flex-row justify-content-between"
			style="width: 80%; max-width: 300px;">
			<button class="btn btn-primary" type="button" onclick="location.href='/main/login/foundpw'"
				style="background: rgb(92, 198, 186);">비밀번호 찾기</button>
			<button class="btn btn-primary" type="button" onclick="location.href='/main/login'"
				style="background: rgb(92, 198, 186);">로그인하러 가기</button>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function(){
			$.ajax({
				url : "/main/login/foundid/foundid_success.do",
				type : "GET",
				success : function(result) {
					$("#username").text(result.username);
					$("#userid").text(result.userid);
				},
				error : function() {
					alert("foundid_success err");
				}
			});
		});
	</script>
</body>

</html>

<!-- select * from term1;
desc term1;
select auth from term1 where id='id1';

create table term(
    userid varchar(20) primary key,
    username varchar(10) unique,
    password varchar(100),
    email varchar(40),
    nickname varchar(20),
    area varchar(100)
    );

select * from term; -->
    
    