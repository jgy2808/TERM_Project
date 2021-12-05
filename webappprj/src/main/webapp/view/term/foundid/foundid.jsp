<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>foundid</title>
    <link rel="stylesheet" href="../../resource/term/foundid/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../resource/term/foundid/assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="../../resource/term/foundid/assets/css/styles.css">
    <script src="../../resource/term/foundid/assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>

<body>
    <div class="d-flex justify-content-between align-items-center" id="header" style="height: 50px;text-align: center;background: rgb(92, 198, 186);">
    	<i class="fa fa-chevron-left" style="width: 30px;height: 30px;font-size: 24px;color: rgb(255,255,255);"></i>
    	<label class="form-label" style="color: rgb(255,255,255);font-size: 24px;">아이디 찾기</label
    	><i class="fa fa-ellipsis-v" style="width: 30px;height: 30px;font-size: 24px;color: rgb(255,255,255);"></i>
    </div>
    <div class="d-flex flex-column align-items-center">
        <div style="margin: 5px;width: 80%;padding-left: 10px;max-width: 400px;">
        	<label class="form-label">사용자 이름</label>
        	<div></div>
        	<input type="text" id="foundid_name" style="height: 40px;width: 100%;border-top-style: none;border-right-style: none;border-bottom: 2px solid rgb(0,0,0) ;border-left-style: none;" placeholder="이름">
        </div>
        <div style="width: 80%;max-width: 400px;margin: 5px;padding-left: 10px;">
        	<label class="form-label" style="margin-top: 15px;">이메일</label>
        	<div></div>
        	<input type="email" id="foundid_email" placeholder="이메일" style="width: 100%;max-width: 400px;border-top-style: none;border-right-style: none;border-bottom-style: solid;border-bottom-color: rgb(0,0,0);border-left-style: none;">
        </div>
        	<button class="btn btn-primary" id="foundid_submit" type="button" style="width: 80%;background: rgb(92, 198, 186);margin-top: 15px;max-width: 400px;">완료</button>
    </div>
    
    <script type="text/javascript">
    	$("#foundid_submit").on("click", function(){
    		var name = $("#foundid_name").val();
    		var email = $("#foundid_email").val();
    		
    		var form = {
    				"name" : name,
    				"email" : email
    		}
    		$.ajax({
    			url : "/main/login/foundid/foundid.do",
    			type : "POST",
    			data : JSON.stringify(form),
    			dataType : "text", 
    			contentType : "application/json; charset=UTF-8",
    			success : function(result){
    				if (result === "email fail")
    					alert("이메일 형식이 맞지 않습니다.");
    				else if (result === "found userid fail")
    					alert("찾으시는 아이디가 존재하지 않습니다.");
    				else {
    					alert("foundid success");
    					location.href = "/main/login/foundid_success";
    				}
    			},
    			error : function(){
    				alert("foundid err");
    			}
    		});
    	});
    </script>
</body>

</html>