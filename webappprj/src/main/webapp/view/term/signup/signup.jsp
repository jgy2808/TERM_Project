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
    <script src="../resource/term/signup/assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>

<body>
    <div class="d-flex justify-content-between align-items-center" id="header" style="height: 50px;text-align: center;background: rgb(92, 198, 186);"><i class="fa fa-chevron-left" style="width: 30px;height: 30px;font-size: 24px;color: rgb(255,255,255);"></i><label class="form-label" style="color: rgb(255,255,255);font-size: 24px;">회원가입</label><i class="fa fa-ellipsis-v" style="width: 30px;height: 30px;font-size: 24px;color: rgb(255,255,255);"></i></div>
    <div class="d-flex flex-column align-items-center">
    
        <div style="width: 80%;max-width: 400px;">
        	<label class="form-label">사용자 이름</label>
        </div>
        <input type="text" placeholder="이름" name="name" style="width: 80%;max-width: 400px;border-top-style: none;border-right-style: none;border-bottom-style: solid;border-bottom-color: rgb(0,0,0);border-left-style: none;">
        <div style="width: 80%;max-width: 400px;">
        	<label class="form-label" style="margin: 0px;margin-top: 15px;">아이디</label>
        	<div class="d-flex justify-content-between align-items-center" style="max-width: 400px;">
            	<input type="text" placeholder="아이디" id="id_id" name="id" style="max-width: 400px;width: 60%;border-top-style: none;border-right-style: none;border-bottom-style: solid;border-bottom-color: rgb(0,0,0);border-left-style: none;">
            	<button class="btn btn-primary" id="idcheck" type="button" style="background: rgb(92, 198, 186);">중복 확인</button>
            </div><!-- onclick="location.href='#'"  -->
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
        
        <button class="btn btn-primary" id="submit" type="button" style="margin-top: 20px;width: 80%;max-width: 400px;background: rgb(92, 198, 186);">완료</button>
    <form action="/signup.do" method="post"></form>
    </div>
    
	<script type="text/javascript">
		$("#idcheck").on("click", function() {
			var data = {
					id : $("#id_id").val()
			}
			$.ajax({
				url: "/signup/IdChecking.do",
				type: "POST",
				data: data,
				success: function(val) {
					alert(val);
				},
				error: function(){
					alert("fail");
				}
			});
		});
	</script>

	<script type="text/javascript">
		$("#submit").on("click", function() {
			
			var name = $("input[name=name]").val();
			var id = $("#id_id").val();
			var pw = $("input[name=pw]").val();
			var pw_check = $("input[name=pw_check]").val();
			var email = $("input[name=email]").val();
			var nickname = $("input[name=nickname]").val();
			var area = $("input[name=area]").val();
			
			var form = {
					"name" : name,
					"id" : id,
					"pw" : pw,
					"pw_check" : pw_check,
					"email" : email,
					"nickname" : nickname,
					"area" : area
			}
			$.ajax({
				url : "/signup/signup.do",
				type : "POST",
				data : JSON.stringify(form),
				contentType : "application/json; charset=UTF-8",
				dataType : "text",
				success : function(val) {
					 if (val === "id")
						alert("아이디를 다시 확인해주세요");
					else if (val === "pw")
						alert("비밀번호를 다시 설정해주세요");
					else if (val === "pw_check")
						alert("비밀번호가 일치하지 않습니다.");
					else if (val === "email")
						alert("이메일 형식을 갖춰주세요.");
					else if (val === "register error") 
						alert(val);
					else {
						alert(val); 
						location.href = "/main/login";
					}
				},
				error : function() {
					alert("signup ajax fail");
				}
			});
		});
	</script>
</body>

</html>