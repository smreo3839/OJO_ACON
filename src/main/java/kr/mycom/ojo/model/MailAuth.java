package kr.mycom.ojo.model;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MailAuth extends Authenticator{
	
	PasswordAuthentication pa;
	
	public MailAuth() {
		String mail_id = "studyclubad@gmail.com";
		String mail_pw = "studyclub123";
		pa = new PasswordAuthentication(mail_id, mail_pw);
	}
	
	public PasswordAuthentication getPasswordAuthentication() {
		return pa;
	}
}
