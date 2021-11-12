<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>signup</title>
    <link rel="stylesheet" href="../resource/term/signup/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../resource/term/signup/assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="../resource/term/signup/assets/css/styles.css">
</head>

<body>
    <div class="d-flex justify-content-between align-items-center" id="header" style="height: 50px;text-align: center;background: rgb(92, 198, 186);"><i class="fa fa-chevron-left" style="width: 30px;height: 30px;font-size: 24px;color: rgb(255,255,255);"></i><label class="form-label" style="color: rgb(255,255,255);font-size: 24px;">회원가입</label><i class="fa fa-ellipsis-v" style="width: 30px;height: 30px;font-size: 24px;color: rgb(255,255,255);"></i></div>
    <div class="d-flex flex-column align-items-center">
    <form action="/signup.do" method="post">
        <div style="width: 80%;max-width: 400px;">
        	<label class="form-label">사용자 이름</label>
        </div>
        <input type="text" placeholder="이름" name="name" style="width: 80%;max-width: 400px;border-top-style: none;border-right-style: none;border-bottom-style: solid;border-bottom-color: rgb(0,0,0);border-left-style: none;">
        <div style="width: 80%;max-width: 400px;">
        	<label class="form-label" style="margin: 0px;margin-top: 15px;">아이디</label>
        	<div class="d-flex justify-content-between align-items-center" style="max-width: 400px;">
            	<input type="text" placeholder="아이디" id="id" name="id" style="max-width: 400px;width: 60%;border-top-style: none;border-right-style: none;border-bottom-style: solid;border-bottom-color: rgb(0,0,0);border-left-style: none;">
            	<button class="btn btn-primary" id="idcheck" type="button" onclick="location.href='#'" style="background: rgb(92, 198, 186);">중복 확인</button>
            </div><!--  -->
        </div>
        
        <div style="width: 80%;max-width: 400px;">
        	<label class="form-label" style="margin-top: 15px;">비밀번호</label>
        </div>
        <input type="password" placeholder="비밀번호" name="pw" style="width: 80%;max-width: 400px;border-top-style: none;border-right-style: none;border-bottom-style: solid;border-bottom-color: rgb(0,0,0);border-left-style: none;">
        
        <div style="width: 80%;max-width: 400px;">
        <label class="form-label" style="width: 100%;max-width: 400px;font-size: 10px;color: rgb(123,123,123);">비밀번호는 영문+숫자+특수문자를 포함하여 8자 이상 입력해 주세요<br></label></div>
        <div style="width: 80%;max-width: 400px;">
        <label class="form-label">비밀번호 확인</label></div>
        <input type="password" placeholder="비밀번호 확인" name="pw_check" style="width: 80%;max-width: 400px;border-top-style: none;border-right-style: none;border-bottom-style: solid;border-bottom-color: rgb(0,0,0);border-left-style: none;">
        
        <div style="width: 80%;max-width: 400px;">
        <label class="form-label" style="margin-top: 15px;">휴대전화</label>
        </div>
        <div class="d-flex flex-row justify-content-between" style="width: 80%;max-width: 400px;">
        <input type="tel" placeholder="휴대폰 번호" name="phone" style="width: 60%;max-width: 400px;border-top-style: none;border-right-style: none;border-bottom-style: solid;border-bottom-color: rgb(0,0,0);border-left-style: none;">
        <button class="btn btn-primary" type="button" style="background: rgb(92, 198, 186);">인증번호 발송</button></div>
        
        <div style="width: 80%;max-width: 400px;">
        <label class="form-label" style="margin-top: 15px;">인증번호</label>
        </div>
        <div class="d-flex justify-content-between align-items-center" style="width: 80%;max-width: 400px;">
        <input type="text" placeholder="인증번호" name="phone_certification" style="width: 60%;max-width: 400px;border-top-style: none;border-right-style: none;border-bottom-style: solid;border-bottom-color: rgb(0,0,0);border-left-style: none;">
        <label class="form-label" id="timer" style="color: rgb(255,0,0);">4:55</label>
        <button class="btn btn-primary" type="button" style="background: rgb(92, 198, 186);">인증</button></div>
        
        <div style="width: 80%;max-width: 400px;">
        <label class="form-label" style="margin-top: 15px;">이메일</label>
        </div>
        <input type="email" placeholder="이메일" name="email" style="width: 80%;max-width: 400px;border-top-style: none;border-right-style: none;border-bottom-style: solid;border-bottom-color: rgb(0,0,0);border-left-style: none;">
        
        <div style="width: 80%;max-width: 400px;">
        <label class="form-label" style="margin-top: 15px;">닉네임</label>
        </div>
        <input type="text" placeholder="닉네임" name="nickname" style="width: 80%;max-width: 400px;border-top-style: none;border-right-style: none;border-bottom-style: solid;border-bottom-color: rgb(0,0,0);border-left-style: none;">
        
        <div style="width: 80%;max-width: 400px;">
        <label class="form-label" style="margin-top: 15px;">지역</label>
        </div>
        <input type="text" placeholder="지역" name="area" style="width: 80%;max-width: 400px;border-top-style: none;border-right-style: none;border-bottom-style: solid;border-bottom-color: rgb(0,0,0);border-left-style: none;">
        
        <button class="btn btn-primary" type="submit" style="margin-top: 20px;width: 80%;max-width: 400px;background: rgb(92, 198, 186);">완료</button>
    </form>
    </div>
    <script src="../resource/term/signup/assets/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript">
    	$("#idcheck").on('click', function() {
    		alert("click id check");
    		$ajax({
				url: "IdChecking",
				type: "POST",
				data: $("#id").serialize(),
				success: function(data) {
					alert("success");
				},
				error: function(){
					alert("fail");
				}
			});
    		alert("end id check");
    	});
    </script>
</body>

</html>