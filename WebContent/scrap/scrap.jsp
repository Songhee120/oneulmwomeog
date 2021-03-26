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
<link
   href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
   rel="stylesheet">

<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
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
   color: #E91E63;
   display: none;
}

.message.good {
   font-size: 13px;
   color: #2196F3;
   display: none;
}

.messageEmailBox.good .good {
   display: inline;
}

.messageEmailBox.bad .bad {
   display: inline;
}

* {
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

input[type=submit] {
   background-color: #ffccbc;
   border: none;
   border-radius: 10px;
   color: #616161;
   padding: 16px 32px;
   text-decoration: none;
   margin: 4px 2px;
   cursor: pointer;
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
}

span.holy {
   font-family: 궁서;
   font-size: 40px;
   color: pink;
}

.col-12 {
   margin: 0 auto;
   width: 50%;
   position: relative;
   top: -30px;
}

#jogin_label {
   margin-bottom: 0px;
   font-size: 20px;
   font-weight: bold;
}

div#list_center {
   position: absolute;
   top: 50%;
   left: 50%;
   border: dolid 1px gray;
}

@media ( min-width :756px) {
   .main_zzim {
      width: 100%;
      height: 900px;
   }
   .one {
      width: 50%;
      height: 400px;
      float: left;
   }
   .two {
      width: 50%;
      height: 400px;
      float: right;
   }
   .three {
      width: 50%;
      height: 400px;
      float: left;
   }
   .four {
      width: 50%;
      height: 400px;
      float: right;
   }
}

@media ( max-width :376px) {
   .main_zzim {
      width: 100%;
      height: 1600px;
   }
   .one {
      width: 100%;
      height: 400px;
      text-align: center;
   }
   .two {
      width: 100%;
      height: 400px;
      text-align: center;
   }
   .three {
      width: 100%;
      height: 400px;
      text-align: center;
   }
   .four {
      width: 100%;
      height: 400px;
      text-align: center;
   }
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
</style>
<body class="is-preload">
   <c:if test="${mem_id eq null}">
      <script>
         alert("로그인 후 이용해주세요.");
         location.replace("${pageContext.request.contextPath}/member/MemberLogin.me");
      </script>
   </c:if>

   <c:set var="list" value="${requestScope.list}" />
   <!-- Wrapper-->
   <div id="wrapper">

      <!-- Nav -->
      <nav id="nav">
         <a href="#selectedlist" class="icon solid fa-user"><span>SelectedList</span></a>
      </nav>

      <!-- Main -->
      <div id="main">

         <!--찜 목록 -->
         <article id="post" class="panel" style="text-align: center;">
            <header>
               <h2>찜목록</h2>
            </header>

            <section id="scrap" style="display: block; text-align: center;">
               <div style="width: 100%; text-align: right;">
                  <div style="width: 100%; height: 15px;"></div>
               </div>
               <br>
               <div class="row" id="myScrap">
                  <c:forEach var="list" items="${list}">
                     <div class="col-4 col-6-medium col-12-small">
                        <figure class="snip1384">
                           <img src="${pageContext.request.contextPath}/upload/${list.filename}" alt='sample83' />
                           <figcaption>
                              <h3>
                                 <c:out value="${list.res_name}" />
                                 <br> <span><c:forEach var='j' begin='1' end="${list.review_star}">
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
                        <form action="${pageContext.request.contextPath}/scrap/ScrapDeleteOk.sc?review_no=${list.review_no}" method="post" name="scrapForm">
                           <input type='submit' onclick='deleteScrap()' value='찜 삭제'>
                        </form>
                     </div>
                  </c:forEach>
               </div>
               <div id='viewOption'>
                  <div id="viewMore">
                     <i id="viewMoreIcon" class="fas fa-chevron-circle-down"
                        onclick="javascript:getScrap()"></i>
                     <div id='goTop' onclick='window.scrollTo(0,0)'>TOP</div>
                  </div>
               </div>
               <br>
            </section>

         </article>


         <!-- Footer -->
         <div id="footer">
            <ul class="copyright">
               <li>&copy; Untitled.</li>
            </ul>
         </div>

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
<script>
   function deleteScrap(){
      scrapForm.submit();
   }
   
   var page = 0;
   var pageContext = "${pageContext.request.contextPath}";
   
   function getScrap() {
      page++;
      $.ajax({
               url : contextPath + "/scrap/ScrapViewOk.sc?page=" + page,
               type : "get",
               dataType : "json",
               async : false,
               success : function(result) {
                  $("#viewOption").remove();
                  console.log(page);
                  console.log("들어옴!");

                  //Object.keys(obj) : 키가 담긴 배열을 반환
                  for (var i = 0; i < Object.keys(result).length; i++) {
                     var append = "";
                     console.log(result[i].scrap_no);
                     var append_div = "";
                     append_div += "<div class='col-4 col-6-medium col-12-small'>";
                     append_div += "<figure class='snip1384'>";
                     append_div += "<img src='../upload/" + result[i].filename+"' alt='sample83' />";
                     append_div += "<figcaption>";
                     append_div += "<h3>";
                     append_div += result[i].res_name + "<br>";
                     append_div += "<span>";
                     for (var j = 0; j < result[i].review_star; j++) {
                        append_div += "<c:out value='★'/>";
                     }
                     append_div += "</span>";
                     append_div += "</h3>";
                     append_div += "<p>" + result[i].res_address
                           + "</p>";
                     append_div += "<i class='ion-ios-arrow-right'></i>";
                     append_div += "</figcaption>";
                     append_div += "<a href='"+contextPath+"/review/ReviewShowOk.re?review_no="+result[i].review_no+"'></a>";
                     append_div += "</figure>";
                     append_div += "<form action='"+contextPath+"/scrap/ScrapDeleteOk.sc?review_no="+ result[i].review_no +"' method='post' name='scrapForm'>";
                         append_div += "<input type='submit' onclick='deleteScrap()' value='찜 삭제'>";
                         append_div += "</form>";
                     append_div += "</div>";
                     append += append_div;

                     $("#myScrap").append(append);
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

                  $("#myScrap").append(append_div);
               },
               error : function(result) {
                  alert("더보기 실패");
               }
            })
   }

   var review_no

   function deleteScrapOk(review_no) {
      $.ajax({
               url : contextPath + "/scrap/ScrapViewOk.sc?deleteScrap="+ true + "&deleteReview_no=" + review_no,
               type : "get",
               dataType : "json",
               async : false,
               success : function(result) {
                  var append = "";
                  for (var i = 0; i < Object.keys(result).length; i++) {
                     var append_div = "";
                     append_div += "<div class='col-4 col-6-medium col-12-small'>";
                     append_div += "<figure class='snip1384'>";
                     append_div += "<img src='../upload/" + result[i].filename+"' alt='sample83' />";
                     append_div += "<figcaption>";
                     append_div += "<h3>";
                     append_div += result[i].res_name + "<br>";
                     append_div += "<span>";
                     for (var j = 0; j < result[i].review_star; j++) {
                        append_div += "<c:out value='★'/>";
                     }
                     append_div += "</span>";
                     append_div += "</h3>";
                     append_div += "<p>" + result[i].res_address
                           + "</p>";
                     append_div += "<i class='ion-ios-arrow-right'></i>";
                     append_div += "</figcaption>";
                     append_div += "<a href='" + contextPath
                           + "/review/ReviewShowOk.re?review_no="
                           + result[i].review_no + "'></a>";
                     append_div += "</figure>";
                     append_div += "<form>";
                     append_div += "<input type='button' onclick='deleteScrap("
                           + result[i].review_no + ")' value='찜 삭제'>";
                     append_div += "</form>";
                     append_div += "</div>";
                     append += append_div;
                  }
                  $("#myScrap").html(append);
                  alert("삭제 성공!");
               },
               error : function(result) {
                  alert("실패");
               }
            });
   } 
</script>
<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
   var contextPath = "${pageContext.request.contextPath}"
</script>
</html>