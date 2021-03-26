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
<title>리뷰보기</title>
<meta charset="utf-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="../assets/css/main.css" />
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
   href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
   rel="stylesheet">

<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
<noscript>
   <link rel="stylesheet" href="../assets/css/noscript.css" />
</noscript>
</head>
<style>
	* {
	   font-family: 'Do Hyeon', sans-serif;
	}
	
	/* 여기서부터 리뷰페이지 css */
	/* 프로필 원 */
	.profile {
	   width: 60px;
	   height: 60px;
	   border-radius: 70%;
	   overflow: hidden;
	   background-color: pink;
	   display: block;
	   float: left;
	}
	
	/* 평점 별 */
	.star_rating {
	   font-size: 0;
	   letter-spacing: -4px;
	}
	
	/* 평점 별 */
	.star_rating a {
	   font-size: 40px;
	   letter-spacing: 0;
	   display: inline-block;
	   margin-left: 5px;
	   text-decoration: none;
	   float: right;
	   color: tomato;
	   cursor: default;
	}
	
	.star_rating a:first-child {
	   margin-left: 0;
	}
	
	/* 즐겨찾기 */
	.scrap {
	   font-size: 0;
	   letter-spacing: -4px;
	}
	
	/* 즐겨찾기 */
	.scrap a {
	   font-size: 30px;
	   letter-spacing: 0;
	   display: inline-block;
	   margin-left: 5px;
	   text-decoration: none;
	   float: right;
	   color: #f2f2f2;
	}
	
	.scrap a:first-child {
	   margin-left: 0;
	}
	
	/* 즐겨찾기 클릭 시 노란색 테두리 */
	.scrap a.on {
	   color: #ffd480;
	}
	
	/* 좋아요(하트) */
	.heart {
	   font-size: 0;
	   letter-spacing: -4px;
	}
	
	/* 좋아요(하트) */
	.heart a {
	   font-size: 30px;
	   letter-spacing: 0;
	   display: inline-block;
	   margin-left: 5px;
	   text-decoration: none;
	   float: right;
	   color: #f2f2f2;
	   margin-top: 3px;
	}
	
	.heart a:first-child {
	   margin-left: 0;
	} 
	
	.userImg {
	   width: 100%;
	   height: 270px;
	   overflow-x: scroll;
	   white-space: nowrap;
	   overflow-y: hidden; 
	}
	
	.userImg img {
	   width: 33%;
	   height: 250px;
	}
	
	button {
	   border-radius: 10px;
	   background-color: pink;
	   width: 20%;
	   height: 50px;
	   font-size: 18px;   
	}
	
	button:hover {
	   color: gray;
	}
	
	.modifyDelete {
	   float: right;
	}
	
	.modifyDelete .modify {
	    background-color: antiquewhite;
	    border-radius: 5px;
	    color: hotpink;
	}
	
	.modifyDelete .delete {
	    background-color: antiquewhite;
	    border-radius: 5px;
	    color: hotpink;
	}
	
	.modifyDelete a{
	   text-decoration:none;
	}
	
	.modifyDelete a:hover{
	   text-decoration:underline;
	}
	
	.review_textarea {
	   width: 100%;
	   overflow: auto;
	   height: 350px;
	   font-size: 20px;
	   resize: none;
	   background: white;
	   color: black;
	   border: 1px solid black;
	   border-radius: 10px;
	   outline: none;
	}
</style>
<body class="is-preload">

   <c:if test="${mem_id eq null}">
      <script>
         alert("로그인 후 이용해주세요.");
         location.replace("${pageContext.request.contextPath}/member/MemberLogin.me");
      </script>
   </c:if>
   <!--수정 가능여부 판단 flag  -->
   <c:set var="flag" value="${requestScope.flag}"/>
   
   <c:set var="reviewBean" value="${requestScope.reviewBean}" />
   <c:set var="mem_nickName" value="${requestScope.mem_nickName}" />
   <c:set var="res_address" value="${requestScope.res_address}" />
   <c:set var="memberNo" value="${requestScope.memberNo}" />
   <c:set var="check" value="${requestScope.check}" />
   <c:set var="scrapCheck" value="${requestScope.scrapCheck}" />
   <c:set var="profileName" value="${requestScope.profileName}" />
   <c:set var="filesBeanList" value="${requestScope.filesBeanList}" />
   <!-- Wrapper-->
   <div id="wrapper">

      <!-- Nav -->
      <nav id="nav">
         <a href="#review" class="icon solid fa-folder"><span>리뷰</span></a>
      </nav>

      <!-- Main -->
      <div id="main">

         <!-- 리뷰 페이지 -->
         <!-- 리뷰 페이지 작업한 곳 -->
         <article id="review" class="panel" style="padding-top: 36px; overflow: hidden;">
            <header style="margin-bottom: 5px;">
               <h2 style="color: pink">리뷰</h2>
               <input type="hidden" value="${reviewBean.getReview_no()}" name="review_no"> 
               <input type="hidden" value="${reviewBean.getMem_no()}" name="mem_no"> 
                  <span style="float: left; margin-top: 0px;"> 
                  
                  <!-- 음식점 이름 및 주소 -->
                  <a href="${reviewBean.getRes_url()}" class="restaurant_name" style="text-decoration: none; color: pink; font-size: 20px; margin-right: 5px;">
                     #${reviewBean.getRes_name()}
                  </a> 
                  <span class="res_address" style="text-decoration: none; color: pink; font-size: 20px; margin-right: 5px;">
                     - ${res_address}
                  </span>
               </span>
               <hr style="padding: 0px; border-top: solid 3px #ddd; margin-top: 15px;">
            </header>

            <div id="review_user" style="width: 100%; overflow: hidden; margin-top: 10px; margin-bottom: 10px;">
               <div id="user_info" style="width: 50%; overflow: hidden; float: left;">
                  <div class="profile" style="margin-top: 5px;">
                     <img src="${pageContext.request.contextPath}/profile/${profileName}" style="width: 60px; height: 60px;" />
                  </div>
                  <!-- 사용자 닉네임 -->
                  <span style="margin-left: 10px; font-size: 18px;">${mem_nickName}</span><br>
                  <!-- 조회수 -->
                  <span style="margin-left: 10px; font-size: 15px;"> 
                     <img src="${pageContext.request.contextPath}/images/view.png" style="width: 12px; height: 12px;" />
                     <span>${reviewBean.getReview_views()}</span>                     
                  </span>

                  <!-- 받은 하트 개수 -->
                  <span class="heart_result" style="margin-left: 10px; font-size: 15px;"> 
                     <img src="${pageContext.request.contextPath}/images/heart.png" style="width: 12px; height: 12px;" /> 
                     <span id="heart_cnt">${reviewBean.getReview_heart()}</span>
                  </span>

               </div>

               <!-- 숫자로 개수를 표시했으니, 반복문 돌리면서 그 숫자만큼 별을 뿌려줘라  -->
               <div id="review_star" style="width: 50%; height: 50px; float: right;">
                  <p class="star_rating">
                     <a href="javascript:void(0)"> <c:choose>
                           <c:when test="${reviewBean.getReview_star() ne 5}">
                              <c:forEach var="rating" begin="1" end="${reviewBean.getReview_star()}">
                                 <c:out value="★" />
                              </c:forEach>
                              <c:forEach var="rating" begin="${reviewBean.getReview_star() + 1}" end='5'>
                                 <c:out value="☆" />
                              </c:forEach>
                           </c:when>
                           <c:otherwise>
                              <c:forEach var="rating" begin="1" end="${reviewBean.getReview_star()}">
                                 <c:out value="★" />
                              </c:forEach>
                           </c:otherwise>
                        </c:choose>
                     </a>
                  </p>

                  <br>
                  
                  <!-- 좋아요 -->
                  <p class="heart">
                 	 <c:choose>
                 	 	<c:when test="${check eq 1}">
                 	 		<a href="javascript:heart_func();" class="fa fa-heart" style="color:red"></a>
                 	 	</c:when>
                 	 	<c:otherwise>
                 	 		<a href="javascript:heart_func();" class="fa fa-heart" style="color:#f2f2f2"></a>
                 	 	</c:otherwise>
                     </c:choose>
                  </p>
                  <p style="float: right; font-size: 15px; margin-top: 3px; margin-right: 5px;">좋아요</p>
                 	   <!-- 좋아요 -->



                  <!-- 찜목록 -->
                  <span class="scrap" style="float: right; margin-top: 3px; margin-right: 12px;">
                     <c:choose>
                        <c:when test="${scrapCheck eq 1}">
                           <a href="javascript:scrap();" class="fa fa-star" style="color:#ffd480"></a>
                        </c:when>
                        <c:otherwise>
                           <a href="javascript:scrap();" class="fa fa-star" style="color:#f2f2f2"></a>
                        </c:otherwise>
                    </c:choose>
                  </span>
                  <p style="float: right; font-size: 15px; margin-top: 3px; margin-right: 5px;">찜</p>
                  <!-- 찜목록 -->

                  
               </div>
            </div>
            <form action="" method="post" style="margin-bottom: 0;" enctype="multipart/form-data">
               <div class="col-12" style="width: 100%; hegiht: 300px;">
                  <textarea class="review_textarea" style="width: 100%; overflow: auto; height: 350px; font-size: 15px; resize: none;"
                     readonly>${reviewBean.getReview_content()}
                  </textarea>
               </div>
               <!-- 사진영역 -->
               <c:if test="${filesBeanList != null}">
                  <div class="userImg">
                     <c:forEach var="file" items="${filesBeanList}">
                        <img src="${pageContext.request.contextPath}/upload/${file}" />
                     </c:forEach>
                  </div>
               </c:if>
            </form>

            <div style="text-align: center; padding: 10px 0px;">
               <button type="button" style="border-radius: 10px; background-color: pink;" onclick="returnHome()">뒤로가기</button>
            </div>
            
            <div class="modifyDelete">
               <c:if test="${reviewBean.getMem_no() eq memberNo}">
                  <input type="hidden" name="flag" value="${flag}">
                  <a href='javascript:modify(${reviewBean.getReview_no()})' style="color: black;">[수정]</a>
                  <a href="${pageContext.request.contextPath}/review/ReviewDeleteOk.re?review_no=${reviewBean.getReview_no()}" style="color: black;">[삭제]</a>
                </c:if>               
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
<script> var contextPath = "${pageContext.request.contextPath}"</script>
<script>
   	   function modify(review_no){
   		   //수정 가능
   		   if($("input[name='flag']").val() != ""){
   			   location.href = contextPath + "/review/ReviewModify.re?review_no="+review_no;
   		   //수정 불가능
   		   }else{
   			   alert("일주일이 지난 리뷰는 수정하실 수 없습니다.");
   		   }
   	   }
	   
	   function heart_func() {
		   var review_no = $("input[name='review_no']").val();
		   var mem_no = $("input[name='mem_no']").val();				   
		      $.ajax({
		         url : contextPath + "/review/ReviewHeartOk.re?review_no="+ review_no+"&mem_no="+mem_no,
		         type : "POST",
		         success : function(result) {
		        	 if(result.trim() == "ok"){
		        		 $(".fa-heart").css("color", "red");
		        	 }else{
		        		 $(".fa-heart").css("color", "#f2f2f2");
		        	 }	        	 
		        	 heartCount();
		         },
		         error : function() {
		            alert("실패1");
		         }
		      });   
	   }
	   
	   function heartCount(){
	   var review_no = $("input[name='review_no']").val();
		   $.ajax({
			  url : contextPath + "/review/ReviewHeartCnt.re?review_no=" + review_no,
			  type:"POST",
			  success: function(count){
				  
	            $("#heart_cnt").text(count);
			  },
			  error: function(count){
				  alert("실패2");
			  }
		   });
	   }
   
	   function scrap(){
	         
	         var review_no = $("input[name='review_no']").val();
	         var mem_no = $("input[name='mem_no']").val();
	         console.log("review_no, mem_no: " + review_no + "," + mem_no);
	         
	         $.ajax({
	            url: contextPath + "/scrap/ScrapOk.sc?review_no="+review_no+"&mem_no="+mem_no,
	            type: "POST",     
	            success: function(data){
	              //별(찜) 색상 바뀜
	               if(data.trim() == "ok"){
	                  $(".fa-star").css("color", "#ffd480"); 
	                  console.log("찜 완료");
	               }else{
	                  $(".fa-star").css("color", "#f2f2f2"); 
	                  console.log("찜 삭제");
	               }
	              
	            }
	         });
	      }

   

	   /* 뒤로 돌아가기 */
	   function returnHome() {
	      location.href = contextPath + "/review/ReviewReturnHome.re";
	   }
</script>
</html>



