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
<title>최신 리뷰</title>
<meta charset="utf-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="../assets/css/main.css?ver=1" />
<link rel="stylesheet" href="../assets/css/astral.css?ver=7" />
<link rel="stylesheet" href="../assets/css/prac.css?ver=8" />
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

a {
   text-decoration: none;
   color: #777777;
}

a:visited {
   text-decoration: none;
}

a:hover {
   text-decoration: none;
}

a:focus {
   text-decoration: none;
}

a:hover, a:active {
   text-decoration: none;
}

.btns {
   width: 100%;
}

/* ★  */
#search_form {
   line-height: 80px;
}

/* 더보기, 위로 올리기 style */
#viewOption {
   width: 100%;
}

#viewMore {
   width: 100%;
   height: 30px;
}

#viewMoreIcon {
   width: 100%;
   font-size: 30px;
}

#goTop {
   float: right;
}

#viewMoreIcon:hover {
   font-size: 35px;
}

#review_search {
   width: 160px;
   height: 30px;
   font-size: 20px;
   border: 1px solid;
}

#noReviewNotice {
   width: 100%;
   height: 100px;
   background-color: #eeeeee;
   margin-top: 50px;
   color: black;
}

@media ( max-width :1024px) {
   #noReviewNotice {
      height: 80px;
   }
}

@media ( max-width :576px) {
   /* 검색창 반응형  */
   #search_form {
      
   }
   #review_search {
      width: 120px;
   }
}
</style>

<body class="is-preload">

   <c:set var="list" value="${requestScope.list}" />
   <c:set var="search_val" value="${requestScope.search_val}" />
   <c:set var="select_type" value="${requestScope.select_type}" />
   
   <script>
      location.href = "#post";
   </script>
   
   <!-- Wrapper-->
   <div id="wrapper">
      

      <!-- Nav -->
      <nav id="nav" style="">
         <a href="javascript:login_index();" class="icon solid fa-home"><span>Home</span></a>
         <a href= "#post" class="icon solid fa-folder"><span>Post</span></a> 
         <a href="javascript:myPageAction();" class="far fa-id-card"><span>MyPage</span></a>
      </nav>

      <!-- Main -->
      <div id="main">
         <!-- Post -->
         <article id="post" class="panel" style="text-align: center;">
            <header>
               <h2>POST</h2>
            </header>
            <!-- ★  -->
            <div style="text-align: center;">
               <span id="best" style="margin: 20px; color: #777777">
               	<a href="../member/login_index.jsp#post">BEST</a>
               </span> 
               <span id="new" style="margin: 20px; color: #ef9a9a; font-weight: bold;" onclick="newImageClicked()">NEW</span>
               <c:if test="${mem_id != null}">
               	<span id="write" style="margin: 20px;">
               		<a href="${pageContext.request.contextPath}/review/ReviewWrite.re" style="color: rgb(119, 119, 119);">WRITE</a>
               	</span>
               </c:if>
            </div>
            <!-- ★ -->
            <!-- new 인증 -->
            <section id="new_image_area"
               style="display: block; text-align: center;">

               <div style="width: 100%; height: 30px; text-align: right;">
                  <form name="search_form" id="search_form" action="${pageContext.request.contextPath}/review/ReviewNewViewFirst.re">
                     <c:choose>
                        <c:when test="${search_val eq null}">
                           <select class="select_type" name="select_type">
                              <option value="res_name">상호명</option>
                              <option value="res_address">지역</option>
                           </select>
                           <input id="review_search" name="review_search" maxlength="30">
                        </c:when>
                        <c:otherwise>
                           <c:choose>
                              <c:when test="${select_type eq 'res_name'}">
                              <select class="select_type" name="select_type" id="select_type">
                                 <option value="res_name" selected="selected">상호명</option>
                                 <option value="res_address">지역</option>
                              </select>
                              </c:when>
                              <c:otherwise>
                              <select class="select_type" name="select_type" id="select_type">
                                 <option value="res_name">상호명</option>
                                 <option value="res_address" selected="selected">지역</option>
                              </select>
                              </c:otherwise>
                           </c:choose>
                           <input id="review_search" name="review_search"
                              value="${search_val}" maxlength="30" type="text">
                        </c:otherwise>
                     </c:choose>
                     <%-- value="${select_type}" --%>

                     <input id="search_btn" type="button" value="검색">
                  </form>
               </div>

               <br>
               <!-- jstl문 작성 -->
               <div class="row" id="new_view">
                  <c:if test="${fn:length(list) == 0}">
                     <div id="noReviewNotice">검색 결과가 없습니다.</div>
                  </c:if>
                  <c:forEach var="list" items="${list}">
                     <div class="col-4 col-6-medium col-12-small">
                        <figure class="snip1384">
                           <img
                              src="${pageContext.request.contextPath}/upload/${list.filename}"
                              alt='sample83' />
                           <figcaption>
                              <h3>
                                 <c:out value="${list.res_name}" />
                                 <br> <span><c:forEach var='j' begin='1'
                                       end="${list.review_star}">
                                       <c:out value='★' />
                                    </c:forEach></span>
                              </h3>
                              <p>
                                 <c:out value="${list.res_address}" />
                              </p>
                              <i class="ion-ios-arrow-right"></i>
                           </figcaption>
                           <a href="${pageContext.request.contextPath}/review/ReviewShowOk.re?review_no=${list.review_no}"></a>
                        </figure>
                     </div>
                  </c:forEach>
                  <c:if test="${fn:length(list) != 0}">
                     <div id='viewOption'>
                     <div id="viewMore">
                        <i id="viewMoreIcon" class="fas fa-chevron-circle-down"
                           onclick="javascript:getNewReview()"></i>
                        <div id='goTop' onclick='window.scrollTo(0,0)'>TOP</div>
                     </div>
                  </div>
                  </c:if>
               </div>
               <br>
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
</body>
<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="../assets/js/astral.js"></script>
<script>
   var contextPath = "${pageContext.request.contextPath}"
</script>
<script>
   $(".hover").mouseleave(function() {
      $(this).removeClass("hover");
   });

   /* nav */
   function login_index() {
      location.href = "../member/login_index.jsp";
   }

   function best_review() {
      location.href = "../member/login_index.jsp#post";
   }

   function myPageAction() {
      location.href = "../member/login_index.jsp#myPage";
   }

   
   /* 검색 */
   var search_val = "";
   $("#search_btn").click(function() {
      var search_val = document.getElementById('review_search').value;
      // 검색 값 확인 및 분기처리

      if (search_val != "") {
         document.getElementById('search_form').submit();
      } else {
         location.href = "../review/ReviewNewViewFirst.re";
      }
   })

   /* 스크롤 시 
   /*    $(window).scroll(function() {
    // 최하단일 경우를 체크하기 위해 최하단 위치값을 지정 
    // 화면 문서전체의 길이에서, 현재 창 높이를 뺀 것이 최하단 값 
    let scrollTop = $(window).scrollTop();
    let windowHeight = $(window).height();
    let documentHeight = $(document).height();
    if (scrollTop + windowHeight + 2 >= documentHeight) {
    getNewReview();
    }
    }) */

   var page = 0;
   var route = null;

   /* 더보기 경로 설정 */

   function checkRoute() {

      page++;
      route = contextPath + "/review/ReviewNewViewMore.re?page=" + page;

      if (document.getElementById('review_search').value != "") {
         //검색값이 있을 때 경로 
         console.log('잘못들어옴');

         var search_val = document.getElementById('review_search').value;
         var s = document.getElementById('select_type');
         var select_type = s.options[s.selectedIndex].value;

         /* 테스트 */
         console.log(search_val);
         console.log(select_type);

         route += "&review_search=" + search_val + "&select_type="
               + select_type;
      }
   }

   /* 더보기 ajax */
   function getNewReview() {
      checkRoute();
      $
            .ajax({
               url : route,
               type : "get",
               dataType : "json",
               success : function(result) {
                  $("#viewOption").remove();
                  console.log(page);

                  if (Object.keys(result).length == 0) {
                     alert("데이터가 없습니다.");
                  }

                  for (var i = 0; i < Object.keys(result).length; i++) {
                     console.log('for문 들어옴');
                     var append_div = "";
                     append_div += "<div class='col-4 col-6-medium col-12-small'>";
                     append_div += "<figure class='snip1384'>";
                     append_div += "<img src='../upload/"+result[i].filename+"' alt='sample83' />";
                     append_div += "<figcaption>";
                     append_div += "<h3>";
                     append_div += result[i].res_name + "<br>";
                     append_div += "<span>";
                     for (var j = 0; j < result[i].review_star; j++) {
                        append_div += "★";
                     }
                     append_div += "</span>";
                     append_div += "</h3>";
                     append_div += "<p>" + result[i].res_address + "</p>";
                     append_div += "<i class='ion-ios-arrow-right'></i>";
                     append_div += "</figcaption>";
                     append_div += "<a href='"+contextPath+"/review/ReviewShowOk.re?review_no=" + result[i].review_no + "'></a>";
                     append_div += "</figure>";
                     append_div += "</div>";

                     $("#new_view").append(append_div);
                  }

                  append_div = "";
                  append_div += "<div id='viewOption'>";
                  append_div += "<div id='viewMore'>";
                  append_div += "<i id='viewMoreIcon' class='fas fa-chevron-circle-down' onclick='javascript:getNewReview()'></i>";
                  append_div += "</div>"
                  append_div += "<div id='goTop'onclick='window.scrollTo(0,0)'>"
                  append_div += "TOP" 
                  append_div += "</div>"
                  append_div += "</div>"

                  $("#new_view").append(append_div);
               },

               error : function(result) {
                  alert("New 리뷰 로딩 실패");
               }
            })
   }
</script>

</html>