package pl.cinema.email;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

import pl.cinema.model.Order;

public class Email {

	    private final static String MYUSERNAME = "thebestcinemainthecity";  
	    private final static String MYPASSWORD = "DEDEDEDE1!"; 
	    private Order order;

	    public Email(Order order) {
	    	this.order=order;
		}

		public void sendFromGMail() throws AddressException, MessagingException {
	        Properties props = System.getProperties();
	        String host = "smtp.gmail.com";
	        props.put("mail.smtp.starttls.enable", "true");
	        props.put("mail.smtp.host", host);
	        props.put("mail.smtp.user", MYUSERNAME);
	        props.put("mail.smtp.password", MYPASSWORD);
	        props.put("mail.smtp.port", "587");
	        props.put("mail.smtp.auth", "true");
	        props.put("mail.smtp.ssl.trust", "smtp.gmail.com");

	        Session session = Session.getDefaultInstance(props);
	        MimeMessage message = new MimeMessage(session);
	        
	        String[] to = { order.getClientEmail() };
	        
	        try {
	            message.setFrom(new InternetAddress(MYUSERNAME));
	            InternetAddress[] toAddress = new InternetAddress[to.length];

	            for( int i = 0; i < to.length; i++ ) {
	                toAddress[i] = new InternetAddress(to[i]);
	            }

	            for( int i = 0; i < toAddress.length; i++) {
	                message.addRecipient(Message.RecipientType.TO, toAddress[i]);
	            }
	           
	
		        message.setSubject("DOKONANO REZERWACJI");
		        message.setHeader("Content-Type", "text/html; charset=UTF-8");
		        String htmlText = ("<h3 style=\"color:red;\">"+order.getClientFirstname()+" "+order.getClientLastname()+"</h3><div>Rezerwacji biletów na film \""+ order.getFilmTitle()+"\" dokonano pomyślnie!"+"</div>");
		        message.setContent(htmlText, "text/html; charset=UTF-8");

	            Transport transport = session.getTransport("smtp");
	            transport.connect(host, MYUSERNAME, MYPASSWORD);
	            transport.sendMessage(message, message.getAllRecipients());
	            transport.close();
	        }
	        catch (AddressException ae) {
	            ae.printStackTrace();
	        }
	        catch (MessagingException me) {
	            me.printStackTrace();
	        }
	    }
	}