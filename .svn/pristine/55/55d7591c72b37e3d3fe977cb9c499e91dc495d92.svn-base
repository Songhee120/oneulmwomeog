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
<title>길 찾기</title>
<meta charset="utf-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="../assets/css/main.css?ver=1" />
<link rel="stylesheet" href="../assets/css/astral.css?ver=7" />
<link rel="stylesheet" href="../assets/css/practice.css?ver=8" />
<link rel="stylesheet" href="../assets/css/prac.css?ver=8" />
<link rel="stylesheet" href="../assets/css/map.css?ver=3" />
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">

<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
<noscript>
   <link rel="stylesheet" href="../assets/css/noscript.css" />
</noscript>
</head>
<style>
*{
   font-family: 'Do Hyeon', sans-serif;
}

span.holy {
   font-family: 궁서;
   font-size: 40px;
   color: pink;
}
.bar{
   margin:0 3px;
   width:1px;
   height:7px;
   vertical-align:center;
   font-size:12px;
   margin-left:6px;
   padding-top:1px;
}
</style>
<style>
   #a_write.hover{
      color:#fbe9e7;
   }
   #placesList .item:hover{
   	  color:black;
   }

   #find_div,
   #find_header{
   		text-align:center;
   		height:100px;
   }
   #find_div{
   		line-height:100px;
   }
   #find_header{
   		line-height:94px;
   		border:6px solid antiquewhite;
   }

   #find_div{
   		font-size:35px;
   		letter-spacing:1px;
   		color:black;
   		/* 모바일 line-height:30px */
   }
   #map_section{
   		height:500px;
   		margin:0px;
   		border:1px solid black
   }
   #road_btn,
   #home_btn{
   		border-radius:10px;
   		font-size:15px;
   		letter-spacing:1px;
   }
   #res_name{
	   	font-size:45px;
	   	color:orangered;
	   	font-weight:bold;
   }
</style>

<body class="is-preload">
   <!-- Wrapper-->
   <c:set var="res_x" value="${requestScope.res_x}"/>
   <c:set var="res_y" value="${requestScope.res_y}"/>
   <c:set var="res_name" value="${requestScope.res_name}"/>
   <c:set var="loc_x" value="${requestScope.loc_x}"/>
   <c:set var="loc_y" value="${requestScope.loc_y}"/>
   <c:set var="loc_name" value="${requestScope.loc_name}"/>
   <div id="wrapper">

      <!-- Nav -->
      <nav id="nav" style="">
         <a href="#findLoad" class="icon solid fa-home"><span>가는길 찾기</span></a>
      </nav>

      <!-- Main -->
      <div id="main">

         <!-- Me -->
         <article id="findRoad" class="panel" style="height:300px;padding:0 2.5em 0 2.5em">       
			<div id="find_div">
				<span>오늘의 음식점</span>
			</div>
			<header id="find_header" style="margin:0px; line-height:94px;">
				 <span id="res_name">${res_name}</span>
			</header>
			<div style="height:100px;text-align:center;line-height:100px;">
				<button id="home_btn">홈으로</button>
				<a href="https://map.kakao.com/link/to/${res_name},${res_y},${res_x}/from/${loc_name},${loc_y},${loc_x}" target="_blank">
					<button id="road_btn">길찾기</button>
				</a>
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
   <script src="../assets/js/jquery.min.js"></script>
   <script src="../assets/js/browser.min.js"></script>
   <script src="../assets/js/breakpoints.min.js"></script>
   <script src="../assets/js/util.js"></script>
   <script src="../assets/js/main.js"></script>
</body>
<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="../assets/js/astral.js"></script>
<script>var contextPath = "${pageContext.request.contextPath}"</script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d47e968b0491a571e52229a4ae4c59c8&libraries=services"></script>
<script>
 	$("#home_btn").click(function(){
 		var path = null;
 		if(sessionStorage.getItem("mem_id") != null){
 			path = "/member/login_index.jsp";
 		}else{
 			path = "/member/index.jsp";
 		}
 		location.href = contextPath + path;
 	})
</script>

</html>