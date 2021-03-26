<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
   Astral by Pixelarity
   pixelarity.com | hello@pixelarity.com
   License: pixelarity.com/license
-->
<html>

<head>

<title>아이디 찾기</title>
<meta charset="utf-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="../assets/css/main.css" />
<link rel="stylesheet" href="../assets/css/astral.css?ver=4" />
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">

<noscript>
   <link rel="stylesheet" href="../assets/css/noscript.css" />
</noscript>
</head>
<style>
   /* 유효성 검사 css 2020-11/27*/
   /* user_password.html */
   /* 비밀번호 찾기 부분 아이디 유효성 검사입니다. */
   .message.bad {
       font-size: 13px;
       color:#E91E63;
       display: none;
   }
   .message.good {
       font-size: 13px;
       color:#2196F3;
       display: none;
   }
   .messageEmailBox.good .good{
       display: inline;
   }
   .messageEmailBox.bad .bad{
       display: inline;
   }
</style>
<style>
* {
   font-family: 'Do Hyeon', sans-serif;
}
</style>
<body class="is-preload">

   <!-- Wrapper-->
   <div id="wrapper">

      <!-- Nav -->
      <nav id="nav">
         <a href="#findmyid" onclick="findmyid_rollback()" class="icon solid fa-id-badge"><span>아이디찾기</span></a>
      </nav>

      <!-- Main -->
      <div id="main">
         <!--아이디 찾기 2020/11-27-->
         <!--  -->
         <article id="findmyid" class="panel">
            <header style="text-align: center;">
               <a href="index.jsp" style="text-decoration:none; font-size:45px; color:#ffcccc; font-weight:900;">오늘뭐먹</a>
            </header>
            <form action="${pageContext.request.contextPath}/member/MemberFindId.me" method="post" name="id_form">
               <div class="col-12" style="margin: 0 auto; display: block;">
                  <label id="jogin_label">이름<input id="name" type="text" name="name"/>
                  <span id="jogin_span" class="find_id_input"></span>                  
                  </label>
               </div>
                <div class="col-12" style="margin: 0 auto; display: block;">                  
                  <div style="padding:0px;"><label id="jogin_label">이메일 인증</label></div>
                  <div style="padding:0px;">
                  	<input type='text' name='input_id_email' style="width:75%;margin-left:0px;display:inline-block;" />
                  	<input type="button" onclick="mean_id()" id="mean_btn" name="id_mean_btn" value="인증">
                  </div>
               </div>   
               <div class="col-12" style="margin: 0 auto; display: block;">
                  <div style="padding:0px;"><label id="jogin_label">인증번호 입력</label></div>
                  <div style="padding:0px;">
                  	<input type='text' name='id_mean' readonly style="width:75%;margin-left:0px;display:inline-block;" />
                  	<input type="button" id="resubmit_btn" name="resubmit_btn" value="재전송">
                  </div>
               </div>                 
               <div class="col-12" style="text-align: center;margin-top:25px; ">
                  <input type="button" onclick="find_id()" class="find_btn"id="find_btn" value="확인" style="color:black;border:1px solid #eeeeee;">
               </div>
            </form>
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
   <script src="../assets/js/astral.js?ver=1"></script>

</body>
<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
<script>var contextPath = "${pageContext.request.contextPath}"</script>
<script>
	var check;
	function find_id(){
		var frm = document.id_form;
		
		if(frm.name.value == ""){
			frm.name.focus();
			$(".find_id_input").text("이름을 입력해주세요.");
			return false;
		}else{
			$(".find_id_input").text("");
		}
		frm.submit();
	}
	
	$("input[name='id_mean_btn']").click(function(){
		var mail = $("input[name='input_id_email']").val();
		if(mail == ""){
			alert("이메일을 입력해주세요.");
		}else{
			$.ajax({
				url : contextPath + "/member/MemberSendMail.me?mail=" + mail,
				//id를 보내야하므로 get
				type : "get",
				//출력은 text로 받는다.
				dataType : "text",
				//성공
				success : function(result) {
					//결과의 공백을 제거하고 비교하여 ok이면 사용 가능
					var msg = null;
					if (result.trim() == "ok") {
						msg = "인증번호를 발송하였습니다.";
						check = true;
					} else {
						msg = "발송 실패";
					}
					alert(msg);
				},
				error : function() {
				}
			})
			
		}
	})
	
	$("input[name='resubmit_btn']").click(function(){
		var mail = $("input[name='input_id_email']").val();
		
		if($("input[name='id_mean']").attr("readOnly")){
			return false;
		}
		
		if(mail == ""){
			alert("이메일을 입력해주세요.");
		}else{
			$.ajax({
				url : contextPath + "/member/MemberSendMail.me?mail=" + mail,
				//id를 보내야하므로 get
				type : "get",
				//출력은 text로 받는다.
				dataType : "text",
				//성공
				success : function(result) {
					//결과의 공백을 제거하고 비교하여 ok이면 사용 가능
					var msg = null;
					if (result.trim() == "ok") {
						msg = "인증번호를 발송하였습니다.";
						check = true;
					} else {
						msg = "발송 실패";
					}
					alert(msg);
				},
				error : function() {
				}
			})
			
		}
	})
</script>
</html>