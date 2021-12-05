<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
</head>
<body>
	<h3>사용자용 게시판</h3>
	<div class="search-form margin-top first align-right">
		<h3 class="hidden">공지사항 검색폼</h3>
		<form class="table-form">
			<fieldset>
				<legend class="hidden">공지사항 검색 필드</legend>
				<label class="hidden">검색분류</label> <select name="f">
					<option value="title">제목</option>
					<option value="writerId">작성자</option>
				</select> <label class="hidden">검색어</label> <input type="text" name="q"
					value="" /> <input class="btn btn-search" type="submit" value="검색" />
			</fieldset>
		</form>
	</div>

	<div class="notice margin-top">
		<h3 class="hidden" style="visibility: hidden;">공지사항 목록</h3>
		<table class="table">
			<thead>
				<tr>
					<th class="w60">번호</th>
					<th class="expand">제목</th>
					<th class="w100">작성자</th>
					<th class="w100">작성시간</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="n" items="${list}">
					<tr>
						<td>${n.id}</td>
						<td class="title indent text-align-left"><a href="detail">${n.title}</a></td>
						<td>${n.writerId }</td>
						<td>${n.regDate }</td>
						<td>${n.hit}</td>
					</tr>
				</c:forEach>
				<td>1</td>
					<td class="title indent text-align-left"><a href="#">title</a></td>
					<td>writer</td>
					<td>date</td>
			</tbody>
		</table>
	</div>
	<div class="text-align-right margin-top">
		<a class="btn-text btn-default" href="reg">글쓰기</a>				
	</div>
	<form action="/tm" method="post">
		<button type="submit">나가기</button>
	</form>

</body>
</html>