<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>foundpw</title>
<link rel="stylesheet" href="../../resource/term/foundpw/assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="../../resource/term/foundpw/assets/fonts/font-awesome.min.css">
<link rel="stylesheet" href="../../resource/term/foundpw/assets/css/styles.css">
<script src="../../resource/term/foundpw/assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>

<body>
	<div class="d-flex justify-content-between align-items-center"
		id="header"
		style="height: 50px; text-align: center; background: rgb(92, 198, 186);">
		<i class="fa fa-chevron-left"
			style="width: 30px; height: 30px; font-size: 24px; color: rgb(255, 255, 255);"></i><label
			class="form-label"
			style="color: rgb(255, 255, 255); font-size: 24px;">비밀번호 찾기</label><i
			class="fa fa-ellipsis-v"
			style="width: 30px; height: 30px; font-size: 24px; color: rgb(255, 255, 255);"></i>
	</div>
	<div class="d-flex flex-column align-items-center">
		<div
			style="margin: 5px; width: 80%; padding-left: 10px; max-width: 400px;">
			<label class="form-label">사용자 이름</label>
			<div></div>
			<input type="text" id="foundpw_username"
				style="height: 40px; width: 100%; border-top-style: none; border-right-style: none; border-bottom: 2px solid rgb(0, 0, 0); border-left-style: none;"
				placeholder="이름">
		</div>
		<div
			style="margin: 5px; width: 80%; padding-left: 10px; max-width: 400px;">
			<label class="form-label">아이디</label>
			<div></div>
			<input type="text" id="foundpw_userid"
				style="height: 40px; width: 100%; border-top-style: none; border-right-style: none; border-bottom: 2px solid rgb(0, 0, 0); border-left-style: none;"
				placeholder="아이디">
		</div>
		<div
			style="width: 80%; max-width: 400px; margin: 5px; padding-left: 10px;">
			<label class="form-label" style="margin-top: 15px;">이메일</label>
			<div></div>
			<input type="email" id="foundpw_email" placeholder="이메일"
				style="width: 100%; max-width: 400px; border-top-style: none; border-right-style: none; border-bottom-style: solid; border-bottom-color: rgb(0, 0, 0); border-left-style: none;">
		</div>
		<button class="btn btn-primary" id="foundpw_submit" type="button"
			style="width: 80%; background: rgb(92, 198, 186); margin-top: 15px; max-width: 400px;">완료</button>
	</div>
	<script type="text/javascript">
		$("#foundpw_submit").on("click", function(){
			var username = $("#foundpw_username").val();
			var userid = $("#foundpw_userid").val();
			var email = $("#foundpw_email").val();
			var form = {
					"username" : username,
					"userid" : userid,
					"email" : email
			};
			alert(username + ", " + userid + ", " + email);
			$.ajax({
				url : "/main/login/foundpw/foundpw.do",
				type : "POST",
				data : JSON.stringify(form),
				dataType : "text",
				contentType : "application/json; charset=UTF-8",
				success : function(result){
					if (result === "email fail")
						alert("이메일 형식이 맞지 않습니다.");
					else if (result === "found userpw fail")
						alert("찾으시는 계정이 존재하지 않습니다.");
					else if (result === "success")
						location.href = "/main/login/foundpw_success";
					
				},
				error : function(){
					alert("foundpw err");
				}
			});
		});
	</script>
</body>

</html>