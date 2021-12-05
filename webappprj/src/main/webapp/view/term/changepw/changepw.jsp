<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>changepw</title>
<link rel="stylesheet" href="../../resource/term/changepw/assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="../../resource/term/changepw/assets/fonts/font-awesome.min.css">
<link rel="stylesheet" href="../../resource/term/changepw/assets/css/styles.css">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>

<body>
	<div class="d-flex justify-content-between align-items-center"
		id="header"
		style="height: 50px; text-align: center; background: rgb(92, 198, 186);">
		<i class="fa fa-chevron-left"
			style="width: 30px; height: 30px; font-size: 24px; color: rgb(255, 255, 255);"></i><label
			class="form-label"
			style="color: rgb(255, 255, 255); font-size: 24px;">비밀번호 변경</label>
			<!-- fa fa-ellipsis-v-->
			<i class="" 
			style="width: 30px; height: 30px; font-size: 24px; color: rgb(255, 255, 255);"></i>
	</div>
	<div class="d-flex flex-column align-items-center">
		<div
			style="margin: 5px; width: 80%; padding-left: 10px; max-width: 400px;">
			<label class="form-label">현재 비밀번호</label>
			<div></div>
			<input type="password" id="current_pw"
				style="height: 40px; width: 100%; border-top-style: none; border-right-style: none; border-bottom: 2px solid rgb(0, 0, 0); border-left-style: none;"
				placeholder="현재 비밀번호">
		</div>
		<div
			style="margin: 5px; width: 80%; padding-left: 10px; max-width: 400px;">
			<label class="form-label">새 비밀번호</label>
			<div></div>
			<input type="password" id="new_pw"
				style="height: 40px; width: 100%; border-top-style: none; border-right-style: none; border-bottom: 2px solid rgb(0, 0, 0); border-left-style: none;"
				placeholder="새 비밀번호">
			<div style="width: 80%; max-width: 400px;">
				<label class="form-label"
					style="width: 100%; max-width: 400px; font-size: 10px; color: rgb(123, 123, 123);">비밀번호는
					영문+숫자+특수문자를 포함하여 8자 이상 입력해 주세요<br>
				</label>
			</div>
		</div>
		<div
			style="width: 80%; max-width: 400px; margin: 5px; padding-left: 10px;">
			<label class="form-label" style="margin-top: 15px;">새 비밀번호 확인</label>
			<div></div>
			<input type="password" placeholder="새 비밀번호 확인" id="new_pw_check"
				style="width: 100%; max-width: 400px; border-top-style: none; border-right-style: none; border-bottom-style: solid; border-bottom-color: rgb(0, 0, 0); border-left-style: none;">
		</div>
		<button class="btn btn-primary" id="change_pw_submit" type="button"
			style="width: 80%; background: rgb(92, 198, 186); margin-top: 15px; max-width: 400px;">완료</button>
	</div>
	<script src="../../resource/changepw/term/assets/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$("#change_pw_submit").on("click", function(){
			var current_pw = $("#current_pw").val();
			var new_pw = $("#new_pw").val();
			var new_pw_check = $("#new_pw_check").val();
			var form = {
					"current_pw" : current_pw,
					"new_pw" : new_pw,
					"new_pw_check" : new_pw_check
			};
			$.ajax({
				url: "/changepw.do",
				type: "POST",
				data: JSON.stringify(form),
				contentType : "application/json; charset=UTF-8",
				dataType : "text",
				success : function(result) {
					if (result === "success") {
						alert("비밀번호가 변경되었습니다.");
						location.href = "/board_main";
					}
					else
						alert(result);
				},
				error : function() {
					alert("changepw ajax fail");
				}
			})
		});
	</script>
</body>

</html>