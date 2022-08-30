package kr.spring.mail.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class MailServiceImpl implements MailService{

	@Autowired
	private JavaMailSender sender;
	
	@Override
	public Map<String, Object> send(String email, String title, String body) {

		MailHandler mail;
		try {
			mail = new MailHandler(sender);
			mail.setFrom("no-reply@norepy.com", "ECO4U");
			mail.setTo(email);
			mail.setSubject(title);
			mail.setText(body);
			mail.send();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
}

