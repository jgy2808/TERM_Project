<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>eco_calc</title>
<link rel="stylesheet" href="../../resource/term/eco_calc/assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="../../resource/term/eco_calc/assets/fonts/font-awesome.min.css">
<link rel="stylesheet" href="../../resource/term/eco_calc/assets/css/styles.css">

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>

<body>
	<div class="d-flex justify-content-between align-items-center"
		id="header"
		style="height: 50px; text-align: center; background: rgb(92, 198, 186);">
		<i class="fa fa-chevron-left"
			style="width: 30px; height: 30px; font-size: 24px; color: rgb(255, 255, 255);"></i><label
			class="form-label"
			style="color: rgb(255, 255, 255); font-size: 24px;">친환경 지수 계산</label><i
			class="fa fa-ellipsis-v"
			style="width: 30px; height: 30px; font-size: 24px; color: rgb(255, 255, 255);"></i>
	</div>
	<div class="d-flex flex-column align-items-center">
		<div class="d-flex justify-content-between"
			style="height: 200px; margin: 20px; width: 80%; max-width: 600px;">
			<div style="width: 45%; height: 100%;">
				<p style="margin-bottom: 0px; height: 70%; background: #ceffe2;">배달용기
					img</p>
				<p class="d-flex justify-content-between align-items-center"
					style="margin-bottom: 0px; height: 30%; background: #fefaee;">
					<button class="btn btn-primary" type="button" id="minus1" onclick="minus(this.id)"
						style="width: 40px; height: 40px; margin: 10px; background: rgb(92, 198, 186);">-</button>
					<span id="plastic_num1">0</span>
					<button class="btn btn-primary" type="button" id="plus1" onclick="plus(this.id)"
						style="width: 40px; height: 40px; margin: 10px; background: rgb(92, 198, 186);">+</button>
				</p>
			</div>
			<div style="width: 45%; height: 100%;">
				<p style="margin-bottom: 0px; height: 70%; background: #ceffe2;">음료 컵
					img</p>
				<p class="d-flex justify-content-between align-items-center"
					style="margin-bottom: 0px; height: 30%; background: #fefaee;">
					<button class="btn btn-primary" type="button" id="minus2" onclick="minus(this.id)"
						style="width: 40px; height: 40px; margin: 10px; background: rgb(92, 198, 186);">-</button>
					<span id="plastic_num2">0</span>
					<button class="btn btn-primary" type="button" id="plus2" onclick="plus(this.id)"
						style="width: 40px; height: 40px; margin: 10px; background: rgb(92, 198, 186);">+</button>
				</p>
			</div>
		</div>
		<div class="d-flex justify-content-between"
			style="height: 200px; margin: 20px; width: 80%; max-width: 600px;">
			<div style="width: 45%; height: 100%;">
				<p style="margin-bottom: 0px; height: 70%; background: #ceffe2;">일회용 비닐
					img</p>
				<p class="d-flex justify-content-between align-items-center"
					style="margin-bottom: 0px; height: 30%; background: #fefaee;">
					<button class="btn btn-primary" type="button" id="minus3" onclick="minus(this.id)"
						style="width: 40px; height: 40px; margin: 10px; background: rgb(92, 198, 186);">-</button>
					<span id="plastic_num3">0</span>
					<button class="btn btn-primary" type="button" id="plus3" onclick="plus(this.id)"
						style="width: 40px; height: 40px; margin: 10px; background: rgb(92, 198, 186);">+</button>
				</p>
			</div>
			<div style="width: 45%; height: 100%;">
				<p style="margin-bottom: 0px; height: 70%; background: #ceffe2;">일반 플라스틱
					img</p>
				<p class="d-flex justify-content-between align-items-center"
					style="margin-bottom: 0px; height: 30%; background: #fefaee;">
					<button class="btn btn-primary" type="button" id="minus4" onclick="minus(this.id)"
						style="width: 40px; height: 40px; margin: 10px; background: rgb(92, 198, 186);">-</button>
					<span id="plastic_num4">0</span>
					<button class="btn btn-primary" type="button" id="plus4" onclick="plus(this.id)"
						style="width: 40px; height: 40px; margin: 10px; background: rgb(92, 198, 186);">+</button>
				</p>
			</div>
		</div>
		<button class="btn btn-primary" id="eco_calculation" type="button"
			style="background: rgb(92, 198, 186); width: 60%; max-width: 400px; margin-bottom: 15px; margin-top: 20px;">계산하기</button>
		<p id="eco_result"
			style="width: 80%; max-width: 600px; background: #b6efe9; padding: 5px; margin-bottom: 0px; visibility: hidden;">
			<br>
			<br>친환경 지수 계산 결과 영역<br>
			<br>
			<br>
			<br>
		</p>
	</div>
	<script src="../../resource/term/eco_calc/assets/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$("#eco_calculation").on("click", function(){
			console.log("hi");
			
			
		});
	</script>
	
	<script type="text/javascript">
		function minus(clicked_id){
			var num, str;
			str = clicked_id.slice(-1);
			num = parseInt(document.getElementById("plastic_num" + str).innerText);
			if (num == 0) return; 
			document.getElementById("plastic_num" + str).innerText = num - 1;
		}
		function plus(clicked_id){
			var num, str;
			str = clicked_id.slice(-1);
			num = parseInt(document.getElementById("plastic_num" + str).innerText);
			document.getElementById("plastic_num" + str).innerText = num + 1;
		}
	</script>
</body>

</html>