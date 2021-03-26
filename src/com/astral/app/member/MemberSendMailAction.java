package com.astral.app.member;

import java.io.PrintWriter;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.astral.action.Action;
import com.astral.action.ActionForward;

public class MemberSendMailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter out = resp.getWriter();
		HttpSession key_session = req.getSession();
		
		String host = "smtp.naver.com";
		final String user = "";
		final String pw = "";
		
		String to = req.getParameter("mail");

		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", 587);
		props.put("mail.smtp.auth", "true");
		
		
        StringBuffer temp = new StringBuffer();
        Random r = new Random();
        for(int i=0;i<8;i++)
        {
            int rIndex = r.nextInt(3);
            switch (rIndex) {
            case 0:
                // a-z
                temp.append((char) ((int) (r.nextInt(26)) + 97));
                break;
            case 1:
                // A-Z
                temp.append((char) ((int) (r.nextInt(26)) + 65));
                break;
            case 2:
                // 0-9
                temp.append((r.nextInt(10)));
                break;
            }
        }
        //Stringbuffer 객체를 String으로 전환
        String key = temp.toString();
        
        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
        	protected PasswordAuthentication getPasswordAuthentication() {
        		return new PasswordAuthentication(user, pw);
        	}
        }); 

		try {
			System.out.println(to);
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			
			message.setSubject("메일 테스트");
			message.setText("인증번호:" + key);
			
			resp.setContentType("text/html;charset=utf-8");
			
			Transport.send(message);
			
			key_session.setAttribute("key_num", key);
			out.println("ok");
			out.close();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
		
		return null;
	}

}
