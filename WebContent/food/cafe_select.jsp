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
<title>음식 선택</title>
<meta charset="utf-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="../assets/css/main.css?ver=1" />
<link rel="stylesheet" href="../assets/css/astral.css?ver=7" />
<link rel="stylesheet" href="../assets/css/practice.css?ver=8" />
<link rel="stylesheet" href="../assets/css/prac.css?ver=8" />
<link rel="stylesheet" href="../assets/css/map.css?ver=9" />
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
   
   #cafe_header{
		height:100px;
		line-height:100px;
		text-align:center;
		margin:0px;
	}
	#cafe_div{
		height:270px;
	}
	#cafe_div1{
		height:70px;
		text-align:center;
		line-height:70px;
		font-size:40px;
		color:black;
		border-bottom:1px solid #eee;
	}
	#cafe_div2{
		height:200px;
		text-align:center;
	}
	#cafe_div2-1{
		height:65px;
		line-height:70px;
	}
	#cafe_div2-2{
		height:65px;
		word-spacing:1em;
	}
	#cafe_div2-3{
		height:70px;
	}
	#cafe_section{
		height:503px;
		border:1px solid black;
	}
	#location_text{
		width:50%;
		padding:6px 10px;
		border-radius:10px;
		color:black;
	}
	#now_btn, #start_btn, #location_btn{
		padding:4px 10px 4px 10px;
		line-height:1.35em;
		border-radius:10px;
		border:1px solid black;
		background:white;
		color:black;
	}
	#start_btn:hover{
		background:#fbe9e7;
	}
	#now_btn:hover{
		background:#fbe9e7;
	}
	.cafe_select{
		width:5.5em;
		padding:5px 10px;
		border-radius:10px;
		color:black;
	}
	.detail_btn{
		border-radius:10px;
		position:relative;
		left:5px;
	}
	#confirm_btn{
		width:20%;
		border-radius:10px;
		font-size:18px;
		height:50px;
		letter-spacing:5px;
	}
	#user_select{
		border:5px solid;
		border-radius:10px;
		padding:10px;
	}
	form input[type="text"], 
	form input[type="email"], 
	form input[type="password"], 
	form select, 
	form textarea{
		-webkit-appearance:auto;
		padding:0px;
		
	}
	.neon {
  		animation: neon 1s ease infinite;
  		-moz-animation: neon 1s ease infinite;
  		-webkit-animation: neon 1s ease infinite;
	}
	@keyframes neon {
  		0%,
  		100% {
    		text-shadow: 0 0 1vw #FA1C16, 0 0 3vw #FA1C16, 0 0 10vw #FA1C16, 0 0 10vw #FA1C16, 0 0 .4vw #FED128, .5vw .5vw .1vw #806914;
    		color: #FED128;
  		}
  		50% {
    		text-shadow: 0 0 .5vw #800E0B, 0 0 1.5vw #800E0B, 0 0 5vw #800E0B, 0 0 5vw #800E0B, 0 0 .2vw #800E0B, .5vw .5vw .1vw #40340A;
    		color: #806914;
  		}
	}
	.title {font-weight:bold;display:block;}
	.bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
</style>

<body class="is-preload" onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">
   <!-- Wrapper-->
   <div id="wrapper">

      <!-- Nav -->
      <nav id="nav" style="">
         <a href="#home" class="icon solid fa-home"><span>Home</span></a>
      </nav>

      <!-- Main -->
      <div id="main">

         <!-- Me -->
         <article id="home" class="panel" style="height:870px;padding:0 2.5em">                  
               <div id="cafe_div">
                  <div id="cafe_div1"><span id="now_cafe">후식 먹자!</span></div>
                  <div id="cafe_div2">
	                  <form style="margin:0px;height:100%;" name="select_form">
	                     <div id="cafe_div2-1">
	                     	<label style="margin:0px;display:inline-block" for="location_text">출발위치</label>
	                        <input type="text" placeholder="도로명주소,지번주소" id="location_text">
	                        <input type="button" value="확인" id="location_btn">
	                     </div>
	                     <div id="cafe_div2-2">
	                          <select name="distance" class="cafe_select">
	                              <option value="2">2km(기본)</option>
	                              <option value="5">5km</option>
	                              <option value="10">10km</option>
	                              <option value="15">15km</option>
	                              <option value="20">20km</option>
	                          </select>
	                     </div>
	                     <div id="cafe_div2-3">
	                     	<input type="button" value="출발 위치" id="start_btn" class="cafe_btn">	                     
	                     </div>
	                  </form>
                  </div>
                  <div id="hidden_div" style="height:130px;display:none;line-height:130px;text-align:center">
                  		<h3><span id="user_select">어디를 가시겠어요?</span></h3>
                  </div>
               </div>
               <section id="cafe_section" style="margin:0px;">
                  <div class="map_wrap">
                   <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
               
                   <div id="menu_wrap" class="bg_white" >
                       <div class="option">
                           <div>
                               <form onsubmit="searchPlaces(); return false;">
                                   <input type="hidden" value="역삼 초밥" id="keyword" size="15"> 
                               </form>
                           </div>
                       </div>
                       <ul id="placesList"></ul>
                       <div id="pagination"></div>
                   </div>
               	  </div>
               </section>
               <form action="${pageContext.request.contextPath}/cafe/CafeFindRoad.fo" method="post" name="cafe_form">
	               <div style="height:97px;text-align:center;line-height:97px">
	               		<!--음식점 이름 -->
	               		<input type="hidden" name="res_name">
	               		<!--음식점 url -->
			         	<input type="hidden" name="res_url">
			         	<!--음식점 주소 -->
			         	<input type="hidden" name="res_address">
			         	<!--음식점 경도 -->
			         	<input type="hidden" name="res_x">
			         	<!--음식점 위도 -->
			         	<input type="hidden" name="res_y">
			         	<!--출발지 경도  -->
			         	<input type="hidden" name="loc_x">
			         	<!--출발지 위도 -->
			         	<input type="hidden" name="loc_y">
			         	<!--출발지 주소명-->
			         	<input type="hidden" name="loc_name">			       
			         	<button type="button" id="confirm_btn" onclick="go_back()">뒤로가기</button>
	               		<button type="button" id="confirm_btn" onclick="last_confirm()">정했어요!</button>
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
</body>
<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="../assets/js/astral.js"></script>
<script>var contextPath = "${pageContext.request.contextPath}"</script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d47e968b0491a571e52229a4ae4c59c8&libraries=services"></script>
<script>
		window.history.forward();
		function noBack(){
			window.history.forward();
		}
		//새로고침 막기
		var flag = false;
		function noEvent(event){
			if(flag){
				if(event.keyCode == 116){
					alert("새로고침을 할 수 없습니다.");
					event.keyCode = 2;
					return false;
				}else if(event.ctrlKey && (event.keyCode == 78 || event.keyCode == 82)){
					return false;
				}			
			}
		}
		document.onkeydown = noEvent;
	
</script>
<script>
		function go_back(){
			if(sessionStorage.getItem("mem_id") != null){
				location.href = contextPath + "/member/login_index.jsp";								
			}else{
				location.href = contextPath + "/member/index.jsp";
			}
		}
		//지도를 생성합니다.
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
		    center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
		    level: 3 // 지도의 확대 레벨
		};
		var map = new kakao.maps.Map(mapContainer, mapOption);

		//출발 위치를 사용
		$("#start_btn").click(function(){		
			if($("#location_text").val() == "" && !use_mark){
				alert("출발위치를 정해주세요.");
				return false;
			}		
			var check = confirm("확인시 변경이 불가능합니다.");
			location_send(check);
		})

		function location_send(check){
			if(check){
				//랜덤으로 나온 음식을 보여주고 select는 건드릴 수 없도록 삭제한다.
				$("#cafe_div2").css("display", "none");
				$("#cafe_div").css("height", "200px");
				$("#home").css("height", "800px");
				$("#now_cafe").attr("class", "neon");			
				$("#now_cafe").css("color", "tomato");
				$("#hidden_div").css("display", "block");
				//음식을 통해 음식점을 검색
				map_view();					
			}
		}

	   var map_click = false;
	   var geocoder = new kakao.maps.services.Geocoder();
	  
	   //현재위치
	   var location_markers = [];	   
	   //출발지점 확인용
	   var loc_check = false;
	   var user_marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
	   user_infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다
	   var use_mark = false; 
	   
	   //검색용 주소
	   var search_address = "";
	   // 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
	   kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
	       searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
	    	   //!map_click : false일때만 맵 클릭으로 좌표 설정 가능
	    	   //음식으로 인한 리스트가 존재한다면 true로 바뀌어 좌표 설정 불가능
	           if (status === kakao.maps.services.Status.OK && !map_click) {

	               var detailAddr = !!result[0].road_address ? '<div id="road_add">도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
	               detailAddr += '<div id="loc_add">지번 주소 : ' + result[0].address.address_name + '</div>';
	               detailAddr +=  !!result[0].road_address ? 
	            		   (result[0].road_address.building_name == "" ?'' : '<div>빌딩명 : ' + result[0].road_address.building_name + '</div>') : '';
	               var content = '<div class="bAddr" style="color:black;">' +
	                               '<span class="title">법정동 주소정보</span>' + 
	                               detailAddr + 
	                           '</div>';
	               
	               //한번이라도 마커를 사용했다면 true
	               use_mark = true;
	               // 마커를 클릭한 위치에 표시합니다 
	               user_marker.setPosition(mouseEvent.latLng);
	               user_marker.setMap(map);
	               
	               //검색용 주소 초기화
	               search_address = "";
	               
	               search_address += result[0].address.region_1depth_name;
	               search_address += result[0].address.region_2depth_name;
	               search_address += result[0].address.region_3depth_name;
	               
	               $("input[name='loc_name']").val(result[0].address.address_name);
	               // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
	               user_infowindow.setContent(content);
	               user_infowindow.open(map, user_marker);
	            }   
	        });
	    });
	    //사용자가 클릭한 마커 마우스 이벤트
	    kakao.maps.event.addListener(user_marker, 'mouseover', function(){
	    	user_infowindow.open(map, user_marker);
	    })
	    kakao.maps.event.addListener(user_marker, 'mouseout', function(){
	    	user_infowindow.close();
	    })
	   
	    //클릭으로 생성된 마커의 위도, 경도를 input(hidden)에 담아준다.
	    function searchDetailAddrFromCoords(coords, callback) {
		     // 좌표로 법정동 상세 주소 정보를 요청합니다
		     $("input[name='loc_y']").val(coords.getLat());			        			       
             $("input[name='loc_x']").val(coords.getLng());
		     
             //클릭으로 선택한 좌표를 맵 center로 지정
             var locPosition = new kakao.maps.LatLng(coords.getLat(), coords.getLng());
		     map.setCenter(locPosition);
		     
		     //좌표로 검색한 결과 리턴
		     geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
	    }

	   //알맞는 주소를 입력했을 경우 해당 주소가 표시된다
	   var loc_lat;
	   var loc_lon;
	   var loc_name;
	   //출발위치 확인 버튼
	   $("#location_btn").click(function(){
		   if($("#location_text").val() == ""){
			   alert("출발 위치를 입력해주세요.");
			   return false;
		   }
		   // 주소로 좌표를 검색합니다
		   geocoder.addressSearch($("#location_text").val(), function(result, status) {
			   // 정상적으로 검색이 완료됐으면 
			   if (status === kakao.maps.services.Status.OK) {
				    loc_check = true;				 
			        var lat = result[0].y;
			        var lon = result[0].x;
			        			 
                    $("input[name='loc_y']").val(lat);			        			       
                    $("input[name='loc_x']").val(lon);             
                    $("input[name='loc_name']").val(result[0].address.address_name);
                    
                    //검색용 주소 초기화
                    search_address = "";
 	                search_address += result[0].address.region_1depth_name;
	                search_address += result[0].address.region_2depth_name;
	                search_address += result[0].address.region_3depth_name;
	                	              
			        var locPosition = new kakao.maps.LatLng(lat, lon);
			        message = '<div style="padding:5px;color:black">출발 위치</div>';
			        // 인포윈도우로 장소에 대한 설명을 표시합니다
			        displayMarker(locPosition, message);
			   // 정상적으로 검색이 안됐다면
			   }else{
				    alert("출발지점을 다시 입력해주세요.");
				    return false;
			   }
			});
	   })
	   //현재 위치정보(검색)에 대한 마커표시
	   function displayMarker(locPosition, message) {
		   
	       // 마커를 생성합니다
	       var marker = new kakao.maps.Marker({  
	           map: map, 
	           position: locPosition
	       }); 
	       
	       //출발지점, 자신의 위치를 나타내는 마커를 지운다.
	       //자신의 위치는 위치 파악을 위해 냅두고 출발위치를 갱신할 때마다 지워준다.
	       for(var i=1;i<location_markers.length;i++){
	    	   location_markers[i].setMap(null);
	       }
	       location_markers.push(marker);
	       
	       var iwContent = message, // 인포윈도우에 표시할 내용
	        iwRemoveable = true;

		   // 인포윈도우를 생성합니다
		   var infowindow = new kakao.maps.InfoWindow({
		        content : iwContent,
		        removable : iwRemoveable
		   });
		   infowindow.open(map, marker);
		   kakao.maps.event.addListener(marker, 'mouseover', function() {
		       // 인포윈도우를 마커위에 표시합니다 
		       infowindow.open(map, marker);       
           });
		   kakao.maps.event.addListener(marker, 'mouseout', function() {
		       // 인포윈도우를 마커위에 표시합니다 
		       infowindow.close();       
           });
	       // 지도 중심좌표를 접속위치로 변경합니다
	       map.setCenter(locPosition);      
	   }  
	   
   /*-----------------------------------------------------------음식점 리스트 생성 맵-------------------------------------------  */	  
   //현재 페이지 음식점 리스트를 담을 변수
   var place_list = [];
   // 음식점 url 담을 변수
   var url = [];
   var back_check = false;
   //랜덤으로 나온 음식을 매개변수로 받아 음식점 리스트 출력
   function map_view(){
	   
	   //마커를 담을 배열입니다
	   var markers = [];
	   // 장소 검색 객체를 생성합니다
	   var ps = new kakao.maps.services.Places();  
	   
	   // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
	   var infowindow = new kakao.maps.InfoWindow({zIndex:1});
	   
	   // 키워드로 장소를 검색합니다
	   searchPlaces();
	   
	   // 키워드 검색을 요청하는 함수입니다
	   function searchPlaces() {
		   //위치정보 이름값에 음식을 더해 검색한다.
		   keyword = search_address + "카페";
	       // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
	       ps.keywordSearch(keyword, placesSearchCB); 
	   }
	   // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
	   function placesSearchCB(data, status, pagination) {
		   back_check = true;
		   //데이터 결과가 존재한다면
	       if (status === kakao.maps.services.Status.OK) {
	    	   //음식점 결과 존재하므로 추가 마커 생성을 막기 위한 flag
	    	   map_click = true;
	    	   //배열 초기화
	   		   url.length = 0;
	   		   place_list.length = 0;
	           for(var i=0; i<data.length; i++){
	              url.push(data[i].place_url);
	              place_list.push(data[i]);
	           }
	           
	           // 정상적으로 검색이 완료됐으면
	           // 검색 목록과 마커를 표출합니다  
	           displayPlaces(data);
	           // 페이지 번호를 표출합니다
	           displayPagination(pagination);
	           flag = true;
           //데이터 결과가 0이라면 검색된 식당이 없으므로 재선택을 할 수 있게 해야 한다.		
	       } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
			   alert("결과가 없습니다.");
	           return;
	       } else if (status === kakao.maps.services.Status.ERROR) {
	           alert('검색 결과 중 오류가 발생했습니다.');
	           return;
	       }
	   }
	   // 검색 결과 목록과 마커를 표출하는 함수입니다
	   function displayPlaces(places) {
		   //선택한 반경
		   var radius = $("select[name='distance']").val() * 1000;
	       var listEl = document.getElementById('placesList'), 
	       menuEl = document.getElementById('menu_wrap'),
	       fragment = document.createDocumentFragment(),
	       bounds = new kakao.maps.LatLngBounds(),
	       listStr = '';
	       
	       // 검색 결과 목록에 추가된 항목들을 제거합니다
	       removeAllChildNods(listEl);
	   
	       // 지도에 표시되고 있는 마커를 제거합니다
	       removeMarker();
	       
	       var modified_places = [];
	       
	       for(var i=0;i<places.length;i++){
	    	   //음식점의 위치
	           var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
	           //음식점의 위치에 마커 생성
               marker = addMarker(placePosition, i);	    	   
               //사용자의 위치, 맵 중앙
               var Center = map.getCenter();
               //반복문을 도는 마커의 위치
               var Marker = marker.getPosition();
               //사용자의 위치와 마커의 위치 거리
               var poly = new kakao.maps.Polyline({
                 // map: map, 을 하지 않아도 거리는 구할 수 있다.
                 path: [Center, Marker]
               });
               var dist = poly.getLength();          
				
               //위치 거리가 선택한 거리값 보다 크면 마커를 지운다.
               if(dist > radius){
                  marker.setMap(null);
               //작으면 새로운 배열에 값을 넣는다.
               }else{            	 
	           	  modified_places.push(places[i]); 
	           	  console.log(i + "-" + dist);
               }
	       }
	       for (var i=0; i<modified_places.length; i++) {
	    	   var placePosition = new kakao.maps.LatLng(modified_places[i].y, modified_places[i].x),
               marker = addMarker(placePosition, i),            
	           // 마커를 생성하고 지도에 표시합니다
               itemEl = getListItem(i, modified_places[i]); // 검색 결과 항목 Element를 생성합니다                                                   
               
	           // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
	           //LatLngBounds 객체에 좌표를 추가합니다
	           bounds.extend(placePosition);
	   
	           // 마커와 검색결과 항목에 mouseover 했을때
	           // 해당 장소에 인포윈도우에 장소명을 표시합니다
	           // mouseout 했을 때는 인포윈도우를 닫습니다
               (function(marker, title) {           
                   kakao.maps.event.addListener(marker, 'mouseover', function() {
                       displayInfowindow(marker, title);
                   });
      
                   kakao.maps.event.addListener(marker, 'mouseout', function() {
                       infowindow.close();
                   });	                               
                 
                   itemEl.onmouseover =  function () {
                       displayInfowindow(marker, title);
                   };
      
                   itemEl.onmouseout =  function () {
                	   infowindow.close(); 
                   };
               })(marker, modified_places[i].place_name);
      
               fragment.appendChild(itemEl);
	       }
	   
	       // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
	       listEl.appendChild(fragment);
	       menuEl.scrollTop = 0;
	   
	       //검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	       map.setBounds(bounds);
	   }
	   
	   // 검색결과 항목을 Element로 반환하는 함수입니다
	   function getListItem(index, places) {
	       var el = document.createElement('li');
	       itemStr = '<a href='+places.place_url+' target="_blank">';
	       itemStr += '<span class="markerbg marker_' + (index+1) + '"></span>' +
	                   '<div class="info">' +
	                   '   <h5>' + places.place_name + '</h5>';  
	       if (places.road_address_name) {
	           itemStr += '    <span>' + places.road_address_name + '</span>' +
	                       '   <span class="jibun gray">' +  places.address_name  + '</span>';
	       } else {
	           itemStr += '    <span>' +  places.address_name  + '</span>'; 
	       }
	                    
	       itemStr += '  <span class="tel">' + places.phone  + '<button onclick="preventEvent(event)"class="detail_btn" id="'+index+'"style="padding:5px 10px;">선택</button></span>' + '</div>'; 
	       itemStr += '</a>';
	   
	       el.innerHTML = itemStr;
	       el.className = 'item';
	   
	       return el;
	      
	   }
	   
	   // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
	   function addMarker(position, idx, title) {
	       var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png", // 마커 이미지 url, 스프라이트 이미지를 씁니다
	           imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
	           imgOptions =  {
	               spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
	               spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
	               offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
	           },
	           markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
	               marker = new kakao.maps.Marker({
	               position: position, // 마커의 위치
	               image: markerImage 
	           });
	   	   
	       marker.setMap(map); // 지도 위에 마커를 표출합니다
	       markers.push(marker);  // 배열에 생성된 마커를 추가합니다
	   
	       return marker;
	   }
	   
	   // 지도 위에 표시되고 있는 마커를 모두 제거합니다
	   function removeMarker() {
	       for ( var i = 0; i < markers.length; i++ ) {
	           markers[i].setMap(null);
	       }   
	       markers = [];
	   }
	   
	   // 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
	   function displayPagination(pagination) {
	       var paginationEl = document.getElementById('pagination'),
	           fragment = document.createDocumentFragment(),
	           i; 
	   
	       // 기존에 추가된 페이지번호를 삭제합니다
	       while (paginationEl.hasChildNodes()) {
	           paginationEl.removeChild (paginationEl.lastChild);
	       }
	   
	       for (i=1; i<=pagination.last; i++) {
	           var el = document.createElement('a');
	           el.href = "#";
	           el.innerHTML = i;
	   
	           if (i===pagination.current) {
	               el.className = 'on';
	           } else {
	               el.onclick = (function(i) {
	                   return function() {
	                       pagination.gotoPage(i);
	                   }
	               })(i);
	           }
	   
	           fragment.appendChild(el);
	       }
	       paginationEl.appendChild(fragment);
	   }
	   
	   // 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
	   // 인포윈도우에 장소명을 표시합니다
	   function displayInfowindow(marker, title) {
	       var content = '<div style="padding:5px;z-index:1;color:black">' + title + '</div>';
	       infowindow.setContent(content);
	       infowindow.open(map, marker);
	   }
	   
	    // 검색결과 목록의 자식 Element를 제거하는 함수입니다
	   function removeAllChildNods(el) {   
	       while (el.hasChildNodes()) {
	           el.removeChild (el.lastChild);
	       }
	   }
	
	   
		
	}
	   var btn;
	   
	   function preventEvent(event){
		   //클릭된 음식점 a태그 이동을 막기 위해 사용
		   event.preventDefault();
		   //전역변수로 keyword로 받아온 음식들을 담는다.
		   for(var i=0;i<place_list.length;i++){
			   //버튼 id를 숫자로 매겨 반복문을 돌리면서 선택된 버튼과 비교한다.
			   if(event.target.id == i){
				   $("#user_select").text(place_list[i].place_name);
				   //input[hidden]에 history테이블에 필요한 값을 담아 놓는다.
				   $("input[name='res_name']").val(place_list[i].place_name);
				   $("input[name='res_url']").val(place_list[i].place_url);
				   $("input[name='res_address']").val(place_list[i].address_name);
				   $("input[name='res_x']").val(place_list[i].x);
				   $("input[name='res_y']").val(place_list[i].y);
				   
				   if(btn != undefined){
					   btn.style.background = "white";				   
				   }
				   //선택된 버튼의 색깔을 바꾸어 표시
				   event.target.style.background = "#eee";
				   btn = event.target;
				   break;
			   }
		   }
	   }
	   
	   function last_confirm(){
		   if($("input[name='res_name']").val() == ""){
			   alert("카페를 선택해주세요.");
		   }else{
			   var result = confirm($("input[name='res_name']").val() + "를 선택하시겠습니까?");
			   if(result == true){
				   document.cafe_form.submit();
			   }
		   }
	   }
</script>

</html>