<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>

	<h3>재활용품 검색</h3>
	<form id="fileForm" method="post" enctype="multipart/form-data">
	<label for="imgSearch" style="padding: 5px; border: solid 1px black;">업로드</label>
		<input type="file" id="imgSearch" name="imgFile"
    		style="position:absolute; clip:rect(0, 0, 0, 0);">
	</form>
	<br>
	<div id="imgContainer"></div>
	<br>
	<div id="clabel-container1"></div>
	<br>
	<script type="text/javascript">
		let img;
		$(document).ready(function() {
			$("#imgSearch").on("change", function(e) {
				img = new Image(300, 300);
                img.src = window.URL.createObjectURL(e.target.files[0]);
                document.getElementById("imgContainer").appendChild(img);
                
 				var formData = new FormData($("#fileForm")[0]);

				$.ajax({
					type : "POST",
					enctype : 'multipart/form-data', // 필수
					url : '/multipartUpload.do',
					data : formData, // 필수
					processData : false, // 필수
					contentType : false, // 필수
					success : function(result) {
						//alert(result);
						document.getElementById("clabel-container1").innerText = result;
					},
					error : function() {
						alert("recycle fail");
					}
				});
			});
		});
	</script>
</body>
</html>