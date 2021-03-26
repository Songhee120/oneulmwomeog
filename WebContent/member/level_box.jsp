<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>랭킹 안내문</title>
<meta charset="utf-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="../assets/css/main.css" />
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<noscript>
   <link rel="stylesheet" href="../assets/css/noscript.css" />
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</noscript>>
</head>
<style>
{
   font-family: 'Do Hyeon', sans-serif;
}

#Level_Content{
   /* display: none; */ 
}

#Level_Content.on{
   display: block;
}

#My_InfoBox{  
    margin-bottom: 20px;
    padding: 14px 13px 11px;
    border: 1px solid #eaeaea;
}

#My_InfoBox p {
   color: black;
}

#My_InfoBox spen{
   margin-left: 30px;
}

#rule_Box{
   padding: 14px 14px 11px;
   font-size: 30px;   
}

#Level_tableBox{
   border: 1px solid #eaeaea;
   
}
#Level_tableBox th{
   line-height: 100px;
   font-size: 18px;
}

#Level_tableBox td{
   font-size: 15px;
}

#Notice_Box{
   text-align: center;
}

.rice_Level{
    width: 30px;
    height: 30px;
    /* float: right; */
    margin-top: 13px;
 }

</style>
<body>
<!-- Wrapper-->
   <div id="wrapper">

      <!-- Nav -->
      <nav id="nav">
         
         <a href="#findmyLv" class="icon solid fa-user"><span>Userlevel</span></a>
      </nav>

      <!-- Main -->
      <div id="main">
         
         <article id="home" class="panel intro">
         </article>
         <!--아이디 찾기 2020/11-27-->
         <!--  -->
        
         <article id="findmyLv" class="panel">
        </a>
         <div id="Level_Content" class="">
         <div>
            <header style="text-align: center;">
                     <h2><span style="font-weight:300; color:pink;">오늘 뭐먹</span> 등급 안내</h2>               
            </header>
         </div>         
<div id="My_InfoBox" style="overflow:hidden;">
<p style="text-align:center; margin-bottom:15px;"><span id="mem_id"></span>님은
<span id="mem_rank"></span>등급 입니다.</p>


<div style="width:30%; float:left; margin-top:25px;">
   <p>총 인증글 : <span id="mem_review_cnt"></span>회 </p>
   <p>좋아요 수 : <span id="mem_heart"></span>개 </p>   
</div>
<div style="width:70%; float:left;">
   <img id="rank_img" src=""/ style="width:30%; height:30%; margin-left:50px;">  
</div>
</div>
<div id="rule_Box">
<strong>등급 상승 규칙</strong>
</div>
<table border="1" id="Level_tableBox">
<tbody>
<tr>
      <th>
         <img class="rice_Level" alt="기본 래벨" src="..//images/rice1.svg"><strong>새내기 등급</strong>
      </th>
      <td>
         
         <p>기본등급 : 
         <span>인증 0회 </span>
         <span>좋아요 수 0회</span>         
         </p>
         
      </td>
   </tr>
   <tr>
      <th>
         <img class="rice_Level" alt="기본 래벨" src="..//images/rice2.svg"><strong>브론즈 등급</strong>
      </th>
      <td>
         <div class="tex_cont">
         <p> 등업조건 : 인증 10회 좋아요 20회</p>         
         <p><span>등급 상승 :</span>
            인증 수
            <span>10</span>
                 개, 좋아요 수
            <span>20</span>
            개, 만족시 자동 등급 상승</p>
         
         
         </div>
      </td>
   </tr>
   
   <tr>
   <th>
         <img class="rice_Level" alt="기본 래벨" src="..//images/rice3.svg"><strong>실버 등급</strong>
      </th>
      <td>
         
         <p> 등업조건 : 인증 20회  좋아요 50회</p>
         <p>      
            <span>등급 상승 :</span>
            인증 수
            <spen>20</spen>
            개, 좋아요 수
            <spen>50</spen>
            개, 만족시 자동 등급 상승
         </p>
      </td>
   </tr>
   
   <tr>
   <th>
         <img class="rice_Level" alt="기본 래벨" src="..//images/rice4.svg"><strong>골드 등급</strong>
      </th>
      <td>
         
         <p> 등업조건 : 인증 50회 좋아요 100회</p>
         <p>
            <span>등급 상승 :</span>
            인증 수
            <spen>50</spen>
            개, 좋아요 수
            <spen>100</spen>
            개, 만족시 자동 등급 상승
         </p>
         
      </td>
   </tr>   
</tbody>
</table>
<div id="Notice_Box">      
      <strong>자동등급 상승 : 운영자가 설정한 조건을 만족하면 자동으로 등급이 상승합니다.</strong>
      
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
   <script src="../assets/js/jquery.min.js"></script>
   <script src="../assets/js/browser.min.js"></script>
   <script src="../assets/js/breakpoints.min.js"></script>
   <script src="../assets/js/util.js"></script>
   <script src="../assets/js/main.js"></script>
<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
</body>
<script>
   var mem_id = opener.$("#mem_id").val();
   $("#mem_id").text(mem_id);
   
   var mem_rank = opener.$("#mem_rank").val();
   $("#mem_rank").text(mem_rank);
   
   var mem_review_cnt = opener.$("#mem_review_cnt").val();
   $("#mem_review_cnt").text(mem_review_cnt);
   
   var mem_heart = opener.$("#mem_heart").val();
   $("#mem_heart").text(mem_heart);
   
   var rank_img = opener.$("#rank_img").val();
   console.log(rank_img);
   $("#rank_img").attr("src", rank_img);
</script>
</html>