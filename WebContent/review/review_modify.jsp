<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE HTML>
<!--
   Astral by Pixelarity
   pixelarity.com | hello@pixelarity.com
   License: pixelarity.com/license
-->
<html>

<head>

<title>리뷰수정</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="../assets/css/main.css" />
<link rel="stylesheet" href="../assets/css/astral.css?ver=12" />
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap"
	rel="stylesheet">


<noscript>
	<link rel="stylesheet" href="../assets/css/noscript.css" />
</noscript>
</head>

<style>
/* 버튼 css */
.review_btn {
	width: 150px;
	height: 70px;
	border-radius: 10px;
	font-size: 20px;
	font-weight: bold;
	text-align: center;
	color: black !important;
	border: 1px solid #eeeeee !important;
}

input[type="button"] {
	background: white;
}

input[type="button"]:hover {
	background: #fbe9e7;
}
/* 이미지 업로드 */
.photoFrame {
	width: 80px;
	height: 80px;
	float: left;
}

.photoFrame:hover {
	cursor: pointer;
}

.input_wrap input[type="file"] {
	/* 파일 필드 숨기기 */
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

#my_review_div1-1 {
	height: 100%;
	width: 70%;
	display: inline-block;
}

#my_review_div1-2 {
	height: 100%;
	width: 30%;
	float: right;
	text-align: right;
	line-height: 100px;
}
</style>
<body class="is-preload">

	<c:if test="${mem_id eq null}">
		<script>
			alert("로그인 후 이용해주세요.");
			location.replace("${pageContext.request.contextPath}/member/MemberLogin.me");
		</script>
	</c:if>
	
	<c:set var="reviewBean" value="${requestScope.reviewBean}" />
	<c:set var="history_list" value="${requestScope.history_list}" />
	<!-- Wrapper-->
	<div id="wrapper">

		<!-- Nav -->
		<nav id="nav">
			<a href="#writereview" class="icon solid fa-user"><span>리뷰수정</span></a>
		</nav>

		<!-- Main -->
		<div id="main">

			<article id="writereview" class="panel">
				<header style="text-align: center;">
					<h2>리뷰 수정</h2>
				</header>
				<section id="my_review">
					<div id="my_review_div1">
						<div id="my_review_div1-1">
							<span id="my_review_res">
								<span id="my_res">${reviewBean.getRes_name()}</span>
								<span id="res_text">에 대해 솔직한 리뷰를 남겨주세요.</span>
							</span>
						</div>
						<div id="my_review_div1-2">
							<select name="res_select">
								<option>음식점 선택</option>
								<c:if test="${history_list != null and fn:length(history_list) > 0}">
									<c:forEach var="history" items="${history_list}">
										<option value="${history.getHistory_no()}">${history.getRes_name()}</option>
									</c:forEach>
								</c:if>
							</select>
						</div>
					</div>
					<form method="post" enctype="multipart/form-data" name="modifyform">
						<!-- 리뷰 번호 -->
						<input type="hidden" name="review_no" value="${reviewBean.getReview_no()}">
						<!-- 음식점 번호 -->
						<input type="hidden" name="history_no" value="">
						<!-- 별점 -->
						<input type="hidden" name="star_grade" value="0">
						
						<div id="my_review_div2">
							<div id="my_review_div2-1">
								<p id="star_grade">
									<span style="margin-right: 20px;"> 
										<a href="#">★</a> 
										<a href="#">★</a> 
										<a href="#">★</a> 
										<a href="#">★</a> 
										<a href="#">★</a>
									</span>
								</p>
							</div>
							<div id="my_review_div2-2">
								<textarea id="my_review_text" name="review_content">${reviewBean.getReview_content()}</textarea>
							</div>
						</div>
						<div id="my_review_div3">
							<span style="color: black;" id="text_limit">(0 / 1000)</span>
						</div>
						<div id="my_review_div4">
							<div class="input_wrap" style="height: 40px;">
								<a href="javascript:" onclick="fileUploadAction();"class="my_button"></a> 
									<label for="input_imgs">사진 업로드
										<input type="file" id="input_imgs" name="input_imgs[]" multiple="multiple" />
									</label>
							</div>
							<div class="imgs_wrap">
								<img id="review_img">
							</div>
						</div>
						<div id="my_review_div5">
							<div id="review_stock_div">
								<input type="button" class="review_btn" value="리뷰저장" onclick="review_save()">
							</div>
							<div id="review_work_div">
								<input type="button" class="review_btn" value="취소" onclick="review_cancel()"> 
								<input type="button" class="review_btn" value="완성" onclick="review_submit()">
							</div>
						</div>
					</form>
				</section>

			</article>
		</div>

		<!-- Footer -->
		<div id="footer">
			<ul class="copyright">
				<li>&copy; Untitled.</li>
			</ul>
		</div>

	</div>

	<!-- Scripts -->
	<script src="../assets/js/jquery.min.js"></script>
	<script src="../assets/js/browser.min.js"></script>
	<script src="../assets/js/breakpoints.min.js"></script>
	<script src="../assets/js/util.js"></script>
	<script src="../assets/js/main.js"></script>
	<script src="../assets/js/astral.js?ver=6"></script>
</body>
<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script>
	var contextPath = "${pageContext.request.contextPath}";
</script>
<script>
	//리뷰 완성
	function review_submit(){
		var frm = document.modifyform;
		//내용이 비었다면
		if(frm.review_content.value == ""){
			alert("내용을 작성해주세요.");
			return false;
		}
		//별점이 없다면
		if($("input[name='star_grade']").val() == 0){
			alert("평점을 정해주세요.");
			return false;
		}
		//음식점을 선택하지 않았다면
		if($("input[name='history_no']").val() == ""){
			alert("음식점을 선택해주세요.");
			return false;
		}
		//완성(0)
		frm.action = contextPath + "/review/ReviewModifyOk.re?success=0";
		frm.method = "post";
		frm.submit();
	}
	//리뷰 저장
	function review_save(){
		var frm = document.reviewform;
		//음식점을 선택하지 않았다면
		if($("input[name='history_no']").val() == ""){
			alert("음식점을 선택해주세요.");
			return false;
		}
		
		frm.action = contextPath + "/review/ReviewModifyOk.re?success=1";
		frm.submit();
	}
	
	function review_cancel(){
		location.href = contextPath + "/member/login_index.jsp#post";
	}

	//파일이 저장되는 곳
	var sel_files = [];
	
	$(document).ready(function(){
		//이미지 태그 구역에 이미지 파일 첨부시 바로 보여줌
		$("#input_imgs").on("change", handleImgFileSelect);
	});
	
	function fileUploadAction(){
		console.log("fileUploadAction");
		//강제 이벤트 실행
		$("#input_imgs").trigger('click');
	}
	
	function handleImgFileSelect(event){
		
		//이미지 정보들을 초기화
		sel_files = [];
		//선택한 요소의 내용 삭제
		$(".imgs_wrap").empty();
		
		var files = event.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		var index = 0;
		filesArr.forEach(function(f){
			if(!f.type.match("image.*")){
				alert("이미지 파일만 첨부해주세요.");
				return false;
			}
			sel_files.push(f);
			
			var reader = new FileReader();
			
			reader.onload = function(event){
				if(index < 4){
					var html = "<a href=\"javascript:void(0);\" onclick=\"deleteImageAction("+index+")\" id=\"img_id_"+index+"\"><img src=\"" + event.target.result + "\" data-file='" + f.name +"' class='selProductFile' id='review_img'title='누르면 삭제됩니다.'></a>";
					$(".imgs_wrap").append(html);
					index++;		
					console.log(f.name);
					console.log($("#imput_imgs").val())
				}else{
					alert("사진은 4장까지만 가능합니다.");
				}
			}
			reader.readAsDataURL(f);
		})
	}
	function deleteImageAction(index){
		console.log("index : " + index);
		sel_files.splice(index, 1);
		
		var img_id = "#img_id_" + index;
		$(img_id).remove();
		
		console.log(sel_files);
	}
	
	// 별점
	$("#star_grade a").click(function() {
		$(this).parent().children("a").removeClass("on");
		$(this).addClass("on").prevAll("a").addClass("on");
		var n = $(this).addClass("on").prevAll("a").length + 1;
		$("input[name='star_grade']").val(n);
		console.log(n);
		return false;
	})
	
	
	$("select[name=res_select]").change(function() {
		//선택한 음식점의 번호를 받는다.
		var history_no = $("select[name=res_select] option:selected").val();
		//선택할 때마다 이전 값을 초기화 해준다.
		$("input[name='history_no']").val("");
		
		var res_name = "음식점";
		//선택한 음식점번호가 숫자라면
		if(!isNaN(history_no)){
			//해당 음식점 이름으로 바꾼다.
			res_name = $("select[name=res_select] option:selected").text();
			//선택된 음식점 번호를 hidden(input)에 넣는다.
			$("input[name='history_no']").val(history_no);
		}
		$("#my_res").text(res_name);
	});
</script>
</html>