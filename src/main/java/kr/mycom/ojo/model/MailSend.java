package kr.mycom.ojo.model;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.inject.Inject;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.commons.mail.HtmlEmail;

public class MailSend {
	
	public void MailSend(MemberVo vo) {
		
		Properties prop = System.getProperties();
		
		// Setting for mail host server 
		prop.put("mail.smtp.starttls.enable", "true");
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.port", "587");
		
		Authenticator auth = new MailAuth();
		
		Session session = Session.getDefaultInstance(prop, auth);
		
		MimeMessage msg = new MimeMessage(session);
			
		
		// Mail Contents 
		try {
			HtmlEmail email = new HtmlEmail();
			msg.setSentDate(new Date());
			msg.setFrom(new InternetAddress("studyclubad@gmail.com", "STUDYCLUB"));
			InternetAddress to = new InternetAddress(vo.getEmail());
			msg.setRecipient(Message.RecipientType.TO, to);
			msg.setSubject("[ STUDY CLUB ] 회원가입 인증 메일 입니다.", "UTF-8");
			msg.setHeader("content-type", "text/html; charset=UTF-8");
			msg.setContent("<html><body><h1>환영합니다 !</h1><br>"
					+ "<h3>회원가입 인증 메일 입니다.</h3><br>"
					+ vo.getName()+"님 가입을 환영합니다. <br> "
					+ "인증버튼 클릭시 회원가입이 완료 됩니다. <br>"
					+ "<form method='post' action='http://localhost:9999/ojo/member/success'><br>"
					+ "<input type='hidden' name='uid' value='"
					+ vo.getUid()+ "'><br>"
							+ "<input type='hidden' name='pwd' value='"
							+ vo.getPwd()+ "'><br>"
					+ "<input type='hidden' name='email' value='"
					+ vo.getEmail()+ "'><br>"
					+ "<input type='hidden' name='approval_key' value='"
					+ vo.getApproval_key()+"'><br>"
					+ "<input type='hidden' name='approval_status' value='"
					+ vo.getApproval_status()+ "'><br>"
					+ "<input type='submit' id='sumitapproval' value='인증하기'>"
					+ "</form></body></html>","text/html; charset=utf-8");
			
			
//			msg.setText("<html><body>ȸ������ ���� ���� �Դϴ�. <br>"
//					+ vo.getName() +"�� ������ ȯ���մϴ�. <br>"
//							+ "������ư Ŭ���� ȸ�������� �Ϸ� �˴ϴ�. <br>"
//							+ "<form method='post' action='http://localhost:9999/ojo/member/success'><br>"
//							+ "<input type='hidden' name='email' value='"+vo.getEmail()+"'><br>"
//							+ "<input type='hidden' name='approval_key' value='"+ vo.getApproval_key()+ "'><br>"
//							+ "<input type='submit' value='�����ϱ�'></form></body></html>","UTF-8");
			Transport.send(msg);
		}catch (AddressException e) {
			System.out.println("AddressException : " + e.getMessage());
		}catch (MessagingException me) {
			System.out.println("MessagingException : " + me.getMessage());
		}catch (UnsupportedEncodingException ee) {
			System.out.println("UnsupportedEncodingException : " + ee.getMessage());
		}
		
	}
	
	
	
public void MailSendForPw(MemberVo vo) {
		
		Properties prop = System.getProperties();
		
		// Setting for mail host server 
		prop.put("mail.smtp.starttls.enable", "true");
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.port", "587");
		
		Authenticator auth = new MailAuth();
		
		Session session = Session.getDefaultInstance(prop, auth);
		
		MimeMessage msg = new MimeMessage(session);
			
		
		// Mail Contents 
		try {
			HtmlEmail email = new HtmlEmail();
			msg.setSentDate(new Date());
			msg.setFrom(new InternetAddress("studyclubad@gmail.com", "STUDYCLUB"));
			InternetAddress to = new InternetAddress(vo.getEmail());
			msg.setRecipient(Message.RecipientType.TO, to);
			msg.setSubject("[ STUDY CLUB ] 요청하신 임시 비밀번호입니다..", "UTF-8");
			msg.setHeader("content-type", "text/html; charset=UTF-8");
			msg.setContent("<html><body>"
					+ "<h3>임시 비밀번호 입니다.</h3><br>"
					+ "<div style='border:1px solid black;'>"
					+ " 임시 비밀번호는 "
					+ vo.getPwd() + "입니다 "
					+ "</div><br>"
					+ "로그인 후 비밀번호를 변경하여 사용하세요"
					+ "</form></body></html>","text/html; charset=utf-8");
			
			
			Transport.send(msg);
		}catch (AddressException e) {
			System.out.println("AddressException : " + e.getMessage());
		}catch (MessagingException me) {
			System.out.println("MessagingException : " + me.getMessage());
		}catch (UnsupportedEncodingException ee) {
			System.out.println("UnsupportedEncodingException : " + ee.getMessage());
		}
		
	}
	
	

}
