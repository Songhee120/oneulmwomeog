<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE HTML>
<!--
   Astral by Pixelarity
   pixelarity.com | hello@pixelarity.com
   License: pixelarity.com/license
-->
<html>

<head>

<title>글 수정</title>
<meta charset="utf-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/astral.css?ver=5" />
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">

<noscript>
   <link rel="stylesheet" href="${pageContext.request.contextPath}assets/css/noscript.css" />
</noscript>
</head>
<style>
*{
   font-family: 'Do Hyeon', sans-serif;
}
th, td{
	padding:0px;
}
button{
	border-radius:10px;
}
form select{
	-webkit-appearance:auto;
}
</style>

<c:if test="${mem_id eq null}">
	<script>
		alert("로그인 후 이용해주세요.");
		location.herf(contextPath + "/member/index.jsp");
	</script>
</c:if>
<body class="is-preload">

   <!-- Wrapper-->
   <div id="wrapper">

      <!-- Nav -->
      <nav id="nav">
         <a href="#notices" onclick="notice_rollback()"class="icon solid fa-user"><span>글 수정</span></a>
      </nav>

	  <c:set var="notice" value="${requestScope.notice}"/>
      <!-- Main -->
      <div id="main">

         <article id="notices" class="panel">
            <header style="text-align: center;margin:0">
               <a href="${pageContext.request.contextPath}/member/login_index.jsp" id="notices_a">오늘뭐먹</a>
            </header>
           	<section style="height:450px;">
           	<form action="${pageContext.request.contextPath}/notice/NoticeModifyOk.no?seq=${notice.getNotice_no()}" method="post" name="notice_form">
           		<table border="1" style="margin-bottom:0px;">
           			<tr height="30px">
           				<td align="center">제목</td>
           				<td>
           					<input name="notice_title" type="text" style="padding:0px" value="${notice.getNotice_title()}">
 						</td>
           			</tr>
           			<tr height="30px">
           				<td align="center">분류</td>
           				<td>
           					<select name="notice_type" style="padding:0px;width:10%;">
           						<option value="0">선택</option>
           						<option>서비스</option>
           						<option>이벤트</option>
           						<option>에러</option>
           					</select>
           				</td>
           			</tr>
           			<tr>
           				<td align="center">내용</td>
           				<td colspan="2" height="300px">
           					<textarea name="notice_content" style="height:300px;resize:none;">${notice.getNotice_content()}</textarea>
           				</td>
           			</tr>
           		</table>

				<div style="text-align:right;position:relative;top:10px">
						<button type="button" onclick="notice_submit()">수정완료</button>
						<a href="${pageContext.request.contextPath}/notice/NoticeList.no"><button type="button">목록</button></a>
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
   <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
   <script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
   <script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
   <script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
   <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
   <script src="${pageContext.request.contextPath}/assets/js/astral.js?ver=1"></script>

</body>
<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	var contextPath = "${pageContext.request.contextPath}"
	
	function notice_submit(){
		var frm = document.notice_form;
		
		if(frm.notice_type.value == 0){
			alert("주제를 선택해주세요");
			return false;
		}	
		if(frm.notice_title.value == ""){
			alert("제목을 입력해주세요.");
			return false;
		}
		
		if(frm.notice_content.value == ""){
			alert("내용을 입력해주세요.");
			return false;
		}
		frm.submit();
	}
	
</script>

</html>
</body>
</html>