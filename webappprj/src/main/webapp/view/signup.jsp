<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<form action="/view/signup.do" method="post">
	<input type="text" name="id" placeholder="ID">
	<input type="password" name="pw" placeholder="PASSWORD">
	<button type="submit" value="회원가입">회원가입</button>
</form>
</body>
</html>