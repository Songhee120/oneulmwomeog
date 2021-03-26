<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<title>공지사항</title>
<meta charset="utf-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/astral.css?ver=7" />
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">

<noscript>
   <link rel="stylesheet" href="${pageContext.request.contextPath}assets/css/noscript.css" />
</noscript>
</head>
<style>
{
   font-family: 'Do Hyeon', sans-serif;
}
tr:hover{
	background:#eeeeee;
}
</style>

<c:set var="totalCnt" value="${requestScope.totalCnt}"/>
<c:set var="realEndPage" value="${requestScope.realEndPage}"/>
<c:set var="nowPage" value="${requestScope.nowPage}"/>
<c:set var="startPage" value="${requestScope.startPage}"/>
<c:set var="endPage" value="${requestScope.endPage}"/>
<c:set var="noticeList" value="${requestScope.noticeList}"/>
<c:set var="notice_search" value="${requestScope.notice_search}"/>
<c:set var="select_type" value="${requestScope.select_type}"/>

<c:if test="${mem_id eq null}">
	<script>
		alert("로그인 후 이용해주세요.");
		//이전 페이지는 로그인 된 회원만 이용이 가능하므로 히스토리에 저장이 되지 않는 replace를 사용한다.
		location.replace("${pageContext.request.contextPath}/member/MemberLogin.me");
	</script>
</c:if>
<body class="is-preload">

   <!-- Wrapper-->
   <div id="wrapper">

      <!-- Nav -->
      <nav id="nav">
         <a href="#notices" onclick="notice_rollback()"class="icon solid fa-user"><span>공지사항</span></a>
      </nav>

      <!-- Main -->
      <div id="main">

         <article id="notices" class="panel">
            <header style="text-align: center;margin:0">
               <a href="${pageContext.request.contextPath}/member/login_index.jsp" id="notices_a">오늘뭐먹</a>
            </header>
            <form style="margin:0px;" action="${pageContext.request.contextPath}/notice/NoticeList.no" method="post" name="search_form">
	            <div id="notice_select">
	            	<select class="select_type" name="select_type">
	            		<option value="0" style="color:#777777">분류 선택</option>
	            		<option value="1">이벤트</option>
	            		<option value="2">서비스</option>
	            		<option value="3">에러</option>
	            	</select>
	            	<input id="notices_search" maxlength="50" type="search" name="notice_search" value="${notice_search}" onkeypress="search_enter()">
	            	<!--12-08  -->
	            	<input id="search_btn" type="submit" value="검색">
	            </div>
	        </form>
            <div class="notice_div">
	            <table id="notice">
	            	<colgroup>
	            		<col style="width:5%">
	            		<col>
	            		<col style="width:15%">
	            		<col style="width:15%">
	            	</colgroup>
	            	<thead>
	            		<tr style="background:pink;">
	        				<th>No.</th>    		
	        				<th>제목</th>    		
	        				<th>분류</th>    		
	        				<th>작성일</th>    		
	            		</tr>	        
	            	</thead>
	            	<tbody>
	            	<c:choose>
	            		<c:when test="${noticeList != null && fn:length(noticeList) > 0}">
		            		<c:forEach var="notice" items="${noticeList}">
		            			<tr>
		            				<td>${notice.getNotice_no()}</td>
		            				<td id="notice_title" align="center"><a href="${pageContext.request.contextPath}/notice/NoticeDetail.no?seq=${notice.getNotice_no()}">${notice.getNotice_title()}</a></td>
		            				<td>${notice.getNotice_type()}</td>
		            				<td>${notice.getNotice_date()}</td>
		            			</tr>
		            		</c:forEach>
	            		</c:when>
	            		<c:otherwise>
	            			<td colspan="4" align="center">등록된 공지사항이 없습니다.</td>
	            		</c:otherwise>
	            	</c:choose>
	            	</tbody>
	            </table>
            </div>
				<div class="paging" style="text-align:center;">
					<a href="#" class="page_move" id="first">◀ </a> 
					<c:choose>
						<%--현재 페이지가 1보다 크면 앞 페이지로 갈 수 있으므로 사용--%>
						<c:when test="${nowPage > 1}">
							<a href="${pageContext.request.contextPath}/notice/NoticeList.no?page=${nowPage - 1}&notice_search=${notice_search}&select_type=${select_type}" class="page_move" id="prev">◁</a>
						</c:when>
					</c:choose>
					<%--시작 페이지부터 끝 페이지까지 반복을 돌린다--%>
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:choose>
							<%--현재페이지와 i값이 같다면 페이지 이동을 막는다.--%>
							<c:when test="${nowPage eq i}">
								${i}
							</c:when>
							<%--다르다면 이동 할 수 있도록 한다.--%>
							<c:otherwise>
								<a href="${pageContext.request.contextPath}/notice/NoticeList.no?page=${i}&notice_search=${notice_search}&select_type=${select_type}" class="page_move" id="num">${i}</a> 								
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:choose>
						<%-- 실제 끝 페이지와 현재 페이지가 다르다면 이동 할 수 있게 한다. --%>
						<c:when test="${nowPage ne realEndPage}">
							<a href="${pageContext.request.contextPath}/notice/NoticeList.no?page=${nowPage + 1}&notice_search=${notice_search}&select_type=${select_type}" class="page_move" id="next">▷</a>
						</c:when>		
					</c:choose> 
					<a href="#" class="page_move" id="last">▶</a>
 					<div style="width:10%;float:right">
 						<a href="${pageContext.request.contextPath}/notice/NoticeWrite.no" style="text-decoration:none;color:black;">글 쓰기</a>
 					</div>
				</div>
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
<script>var contextPath = "${pageContext.request.contextPath}"</script>
<script>
	function search_enter(){
		if(document.event.keyCode == 13){
			document.search_form.submit();
		}
	}
</script>
</html>