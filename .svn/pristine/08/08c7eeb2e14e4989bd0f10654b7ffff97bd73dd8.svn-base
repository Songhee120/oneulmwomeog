/**
 * 
 */

// 전체 동의 함수
$(document).ready(function() {
	// 최상단 체크박스 클릭
	$("#checkall").click(function() {
		// 클릭되었으면
		if ($("#checkall").prop("checked")) {
			// input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
			$("input[name='ckbox']").prop("checked", true);
			// 클릭이 안되있으면
		} else {
			// input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
			$("input[name='ckbox']").prop("checked", false);
		}
	})
})

function mean() {
	$("input[name='mean_tel']").attr("readOnly", false);
}
// 아이디 찾기 인증번호 readonly
function mean_id() {
	$("input[name='id_mean']").attr("readOnly", false);
}
// 비밀번호 찾기 인증번호 readonly
function mean_pw() {
	$("input[name='pw_mean']").attr("readOnly", false);
}
function home_rollback() {
	if (document.location.href.split('#')[1] == "home") {
		return false;
	}

}
// 동의하기 창에 접근할 때 마다 롤 백
function signup_rollback() {
	if (document.location.href.split('#')[1] == "signup") {
		return false;
	}
	$("input[name='ckbox']").prop("checked", false);
}
// 마이페이지 접근할 때 마다 롤 백
/*
 * function myPage_rollback(){ if(document.location.href.split('#')[1] ==
 * "myPage"){return false;} $("#my_zzim").css("display", "none");
 * $("#my_list").css("display", "block"); }
 */

function notice_rollback() {
	if (document.location.href.split('#')[1] == 'notices') {
		return false;
	}

}

// 아이디찾기 롤백
function findmyid_rollback() {
	if (document.location.href.split('#')[1] == "findmyid") {
		return false;
	}
	$("input[name='id_mean']").attr("readOnly", true);
}
// 비밀번호 찾기 롤백
function findmypw_rollback() {
	if (document.location.href.split('#')[1] == "findmypw") {
		return false;
	}
	$("input[name='pw_mean']").attr("readOnly", true);
}

// 동의하기 경고 메시지 && 회원가입 페이지 이동
function confirm_check() {
	var errmsg = "필수 사항입니다. 동의해주세요.";
	if ($("#first_box").prop('checked') == false) {
		$("#first_box_errmsg").css("display", "inline");
		$("#first_box_errmsg").text(errmsg);
	} else {
		$("#first_box_errmsg").css("display", "none");
	}
	if ($("#second_box").prop('checked') == false) {
		$("#second_box_errmsg").css("display", "inline");
		$("#second_box_errmsg").text(errmsg);
		console.log("들어옴");
		return false;
	} else {
		$("#second_box_errmsg").css("display", "none");
	}
	/*
	 * $("#signup1").css("display", "none"); $("#signup2").css("display",
	 * "block");
	 */
	location.href = "join.jsp#signup";
}

// 동의하기 취소 버튼
function cancel_check() {
	location.href = "index.jsp#home";
}
// 회원가입 취소 버튼
function join_cancel() {
	location.href = "index.jsp#home";
}

// 로그인 확인
function login_check() {
	if ($("input[name='login_email']").val() == "") {
		$("#login_id_result").css("display", "block");
		$("#login_id_result").text("아이디를 입력해주세요.");
		console.log("들어옴");
		return false;
		console.log("들어옴2");
	} else {
		if ($("input[name='login_password']").val() == "") {
			$("#login_id_result").css("display", "none");

			$("#login_pw_result").css("display", "block");
			$("#login_pw_result").text("비밀번호를 입력해주세요.");
			return false;
		}
	}
	document.login.submit();
}


function foodClicked() {
	var btn = $("button[name='btn']");
	$("#home_header").css("display", "none");
	$("#food_select_div").css("display", "block");

}

// best - onClick
function bestClicked() {
	// 디스플레이 전환
	$("#best_area").css("display", "inline-block");
	$("#new_image_area").css("display", "none");
	$("#new_text_area").css("display", "none");
	$("#write_area").css("display", "none");

	// 텍스트 색상, 굵기 전환
	$("#best").css("color", "#ef9a9a").css("font-weight", "bold");
	$("#new").css("color", "#777777").css("font-weight", "300");
	$("#write").css("color", "#777777").css("font-weight", "300");
}

// new_image - onClick
function newImageClicked() {
	// 디스플레이 전환
	$("#best_area").css("display", "none");
	$("#new_image_area").css("display", "inline-block");
	$("#new_text_area").css("display", "none");
	$("#write_area").css("display", "none");

	// 텍스트 색상, 굵기 전환
	$("#best").css("color", "#777777").css("font-weight", "300");
	$("#new").css("color", "#ef9a9a").css("font-weight", "bold");
	$("#write").css("color", "#777777").css("font-weight", "300");
}

// new_text - onClick
function newTextClicked() {
	// 디스플레이 전환
	$("#best_area").css("display", "none");
	$("#new_image_area").css("display", "none");
	$("#new_text_area").css("display", "inline-block");
	$("#write_area").css("display", "none");

	// 텍스트 색상, 굵기 전환
	$("#best").css("color", "#777777").css("font-weight", "300");
	$("#new").css("color", "#ef9a9a").css("font-weight", "bold");
	$("#write").css("color", "#777777").css("font-weight", "300");
}

// write - onClick
function writeClicked() {
	// 디스플레이 전환
	$("#best_area").css("display", "none");
	$("#new_image_area").css("display", "none");
	$("#new_text_area").css("display", "none");
	$("#write_area").css("display", "inline-block");

	// 텍스트 색상, 굵기 전환
	$("#best").css("color", "#777777").css("font-weight", "300");
	$("#new").css("color", "#777777").css("font-weight", "300");
	$("#write").css("color", "#ef9a9a").css("font-weight", "bold");
}

// 리뷰 textarea 글자수 제한
$("#my_review_text").keyup(function(event) {
	var content = $(this).val();
	$("#text_limit").html("(" + content.length + " / 1000)");

	if (content.length > 1000) {
		alert("최대 1000자까지 입력이 가능합니다.");
		$(this).val(content.substring(0, 1000));
		$("text_limit").html("(1000 / 1000)");
	}

});


// 내 정보 수정으로 이동
function move_my_inform() {
	location.href = "update.jsp";
}
function cmp_cancel() {
	history.go(-1);
}
/* HOME(JS) */

/* 음식뭐먹&후식뭐먹 (YR) */
function foodClicked() {
	$("#my_home").css("display", "none");
	$("#food_area").css("display", "block");
}

function letsGo() {
	$("#my_home").css("display", "none");
	$("#food_area").css("display", "none");
	$("#find_road").css("display", "inline-block");
}

function dessertClicked() {
	$("#my_home").css("display", "none");
	$("#food_area").css("display", "none");
	$("#find_road").css("display", "none");
	$("#dessert_area").css("display", "inline-block");
}

function letsGoDrink() {
	$("#my_home").css("display", "none");
	$("#food_area").css("display", "none");
	$("#find_road").css("display", "none");
	$("#dessert_area").css("display", "none");
	$("#findDessert_road").css("display", "inline-block");
}
/* 음식뭐먹&후식뭐먹 End (YR) */

/* POST(JS) */
// best - onClick
function bestClicked() {
	// 디스플레이 전환
	$("#best_area").css("display", "inline-block");
	$("#new_image_area").css("display", "none");
	$("#new_text_area").css("display", "none");
	$("#write_area").css("display", "none");

	// 텍스트 색상, 굵기 전환
	$("#best").css("color", "#ef9a9a").css("font-weight", "bold");
	$("#new").css("color", "#777777").css("font-weight", "300");
	$("#write").css("color", "#777777").css("font-weight", "300");
}

// new_image - onClick
function newImageClicked() {
	// 디스플레이 전환
	$("#best_area").css("display", "none");
	$("#new_image_area").css("display", "inline-block");
	$("#new_text_area").css("display", "none");
	$("#write_area").css("display", "none");

	// 텍스트 색상, 굵기 전환
	$("#best").css("color", "#777777").css("font-weight", "300");
	$("#new").css("color", "#ef9a9a").css("font-weight", "bold");
	$("#write").css("color", "#777777").css("font-weight", "300");
}

// new_text - onClick
function newTextClicked() {
	// 디스플레이 전환
	$("#best_area").css("display", "none");
	$("#new_image_area").css("display", "none");
	$("#new_text_area").css("display", "inline-block");
	$("#write_area").css("display", "none");

	// 텍스트 색상, 굵기 전환
	$("#best").css("color", "#777777").css("font-weight", "300");
	$("#new").css("color", "#ef9a9a").css("font-weight", "bold");
	$("#write").css("color", "#777777").css("font-weight", "300");
}

// write - onClick
function writeClicked() {
	/*
	 * //디스플레이 전환 $("#best_area").css("display", "none");
	 * $("#new_image_area").css("display", "none");
	 * $("#new_text_area").css("display", "none");
	 * $("#write_area").css("display", "inline-block");
	 */

	// 텍스트 색상, 굵기 전환
	$("#best").css("color", "#777777").css("font-weight", "300");
	$("#new").css("color", "#777777").css("font-weight", "300");
	$("#write").css("color", "#ef9a9a").css("font-weight", "bold");
}

$(".hover").mouseleave(function() {
	$(this).removeClass("hover");
});
