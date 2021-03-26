<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<!--
   Astral by Pixelarity
   pixelarity.com | hello@pixelarity.com
   License: pixelarity.com/license
-->
<html>
<head>
<title>Untitled</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="../assets/css/main.css?ver=1" />
<link rel="stylesheet" href="../assets/css/astral.css?ver=16" />
<link rel="stylesheet" href="../assets/css/prac.css?ver=7" />
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
	rel="stylesheet">

<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
<noscript>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/noscript.css" />
</noscript>
</head>

<style>
/* 글 스타일 */
a{
   text-decoration:none;
   color: inherit;
}


/* 게시판 페이징패딩 */
.paging{
   margin-top:30px;
   text-align:center;
   position:relative;
   top : 50px;
}
/* 게시판 페이지패딩 */
.paging a {
   display:inline-block;
   vertical-align:middle;
   margin-left:10px;
}



/* 게피판 페이지페이징 */
.paging a.num{
   margin-left: 10px;
}



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
   
   *{
   font-family: 'Do Hyeon', sans-serif;
}

.btn {
   background-color: #fff;
   color: #616161;
   border: 2px solid #bdbdbd;
   border-radius: 10px;
   width: 160px;
   height: 80px;
   margin: 10px;
   font-size: 18px;
}

input[type=button] {
   background-color: #ffccbc;
   border: none;
   border-radius: 10px;
   color: #616161;
   padding: 16px 32px;
   text-decoration: none;
   margin: 4px 2px;
   cursor: pointer;
   width: 120px;
   height: 60px;
}

span.holy {
   font-family: 궁서;
   font-size: 40px;
   color: pink;
}

.col-12 {
   margin: 0 auto;
   width: 50%;
   position:relative;
   top : -30px;
}
#jogin_label{
   margin-bottom:0px;
   font-size:20px;
   font-weight:bold;
}

div#list_center{
   position: absolute;
   top: 50%;
   left: 50%;
   border: dolid 1px gray;
}



@media (max-width:376px){

.injeung{
font-size:5px;
}

}
   
</style>
<body class="is-preload">

<c:set var="list" value="${requestScope.list}"/>
<c:set var="reviewBean" value="${requestScope.reviewBean}"/>
<c:set var="totalCnt" value="${requestScope.totalCnt}"/>
<c:set var="realEndPage" value="${requestScope.realEndPage}"/>
<c:set var="nowPage" value="${requestScope.nowPage}"/>
<c:set var="startPage" value="${requestScope.startPage}"/>
<c:set var="endPage" value="${requestScope.endPage}"/>
<c:set var="confirmList" value="${requestScope.confirmList}"/>
	<%-- <c:if test="${mem_id ne null}">
		<script>
			location.href = "login_index.jsp";
		</script>
	</c:if> --%>
	<c:if test="${mem_id eq null}">
		<script>
			alert("로그인 후 이용해주세요.");
			//이전 페이지는 로그인 된 회원만 이용이 가능하므로 히스토리에 저장이 되지 않는 replace를 사용한다.
			location.replace("${pageContext.request.contextPath}/member/MemberLogin.me");
		</script>
	</c:if>
	<!-- Wrapper-->
	<div id="wrapper">

      <!-- Nav -->
      <nav id="nav">
         <a href="#confirmlist" class="icon solid fa-user"><span>ConfirmList</span></a>
      </nav>

		<!-- Main -->
      <div id="main">
      <!--리뷰 목록-->
         <article id="confirmlist" class="panel">
            <header style="text-align: center;">
               <h2>리뷰 목록</h2>
            </header>
        
          
            <div class="store_div">
               <table class="store" style="text-align: center;">
                  <colgroup>
                     <col style="width:5%">
                     <col style="width:20%">
                     <col>
                     <col style="width:10%">
                     <col style="width:25%">
                  </colgroup>
                  <thead>
                     <tr style="border-top : 3px solid green;">
                       <th>No.</th>          
                       <th>음식점</th>          
                       <th>주소</th>
                       <th>조회수</th>          
                       <th>작성일</th>          
                     </tr>           
                  </thead>
                  <tbody>
                  <c:choose>
	            		<c:when test="${list != null}">
		            		<c:forEach var="confirm" items="${list}">
                     <tr onclick="detail('${confirm.review_no}')">
                        <td>${confirm.review_no}</td>
                        <td>${confirm.res_name}</td>
                       	<td>${confirm.res_address}</td>
                        <td>${confirm.review_views}</td>
                        <td>${confirm.review_date}</td>
                     </tr>
                     	</c:forEach>
	            		</c:when>
	            		<c:otherwise>
	            			<td colspan="5" align="center">등록된 리뷰가 없습니다.</td>
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
							<a href="${pageContext.request.contextPath}/confirm/ReviewConfirmList.co?page=${nowPage - 1}" class="page_move" id="prev">◁</a>
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
								<a href="${pageContext.request.contextPath}/confirm/ReviewConfirmList.co?page=${i}" class="page_move" id="num">${i}</a> 								
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:choose>
						<%-- 실제 끝 페이지와 현재 페이지가 다르다면 이동 할 수 있게 한다. --%>
						<c:when test="${nowPage ne realEndPage}">
							<a href="${pageContext.request.contextPath}/confirm/ReviewConfirmList.co?page=${nowPage + 1}" class="page_move" id="next">▷</a>
						</c:when>
					</c:choose>
					<a href="#" class="page_move" id="last">▶</a>
 			
				</div>
         </article>
         

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
	
	function detail(review_no) {
		location.href = "${pageContext.request.contextPath}/review/ReviewShowOk.re?review_no=" + review_no;
	}
</script>



</html>