package com.astral.app.member;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.astral.action.Action;
import com.astral.action.ActionForward;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

public class MemberSendPhoneNoAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter out = resp.getWriter();
		HttpSession session = req.getSession();
		
		//사용자가 입력한 전화번호
		String to = req.getParameter("phone");
		
		//랜덤 번호 생성
		Random r = new Random();
		String temp = "0123456789^#&";
		String code = "";
		final int code_length = 6;

		// 임의의 문자의 조합으로 6자리 인증번호를 발급한다.
		for (int i = 0; i < code_length; i++) {
			//code에 랜덤 값 들어감.
			code += temp.charAt(r.nextInt(temp.length()));
		}

		// 외부API(문자발송)
		// coolsms 사이트에 로그인한 후
		// 본인의 API KEY값을 참고하여 작성한다.
		String api_key = "";
		String api_secret = "";
		Message coolsms = new Message(api_key, api_secret);

		// 4 params(to, from, type, text) are mandatory. must be filled
		HashMap<String, String> params = new HashMap<String, String>();
		// 누구에게 전송할 지
		params.put("to", to);
		// 등록한 발신 번호 작성
		params.put("from", "");
		/// SMS 그대로 유지
		params.put("type", "SMS");
		// 전송할 메세지
		params.put("text", "[테스트]\n인증번호 : " + code);
		// 사용하고 있는 API 버전
		params.put("app_version", "JAVA SDK v2.2"); // application name and version

		try {
			resp.setContentType("text/html; charset=utf-8");
			
			session.setAttribute("code", code);
			out.println("ok");
			out.close();
			
			// 전송된 데이터를 JSON으로 변환하여 콘솔에 출력
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString());
			
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}

		return null;
	}
}
