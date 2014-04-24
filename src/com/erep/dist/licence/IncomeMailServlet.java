package com.erep.dist.licence;

import static javax.mail.Session.getInstance;

import java.io.IOException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.activation.DataSource;
import javax.mail.Session;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.util.MimeMessageParser;

import com.erep.dist.Mailer;

public class IncomeMailServlet extends HttpServlet {

	private static final long	serialVersionUID	= 1L;
	private static Logger	logger	= Logger.getLogger(IncomeMailServlet.class.getName());

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		
		logger.log(Level.WARNING, "New incoming message");
		
		try {
			Session session = getInstance(new Properties());
			MimeMessage message = new MimeMessage(session, req.getInputStream());

			MimeMessageParser parser = new MimeMessageParser(message).parse();
			
			String subject = new StringBuilder("eDist Incoming Message (")
					.append(parser.getFrom()).append(")").toString();

			StringBuilder text = new StringBuilder("<img src=\"https://edist-licence.appspot.com/img/logo/logo2_small_opt.cache.png\">")
						.append("<p><b>Forwarded message below</b></p>")
						.append("<p>From: ").append(parser.getFrom()).append("<br/>")
						.append("To: ").append(parser.getTo()).append("<br/>")
						.append("CC: ").append(parser.getCc()).append("<br/>")
						.append("Reply to: ").append(parser.getReplyTo()).append("<br/>")
						.append("Subject: ").append(parser.getSubject()).append("<br/>")
						.append("Sent: ").append(message.getSentDate()).append("</p>");
						
			
			
			text.append("<p>");		
			if(parser.hasPlainContent())
				text.append(parser.getPlainContent());
			if(parser.hasHtmlContent())
				text.append(parser.getHtmlContent());
			text.append("</p>");		
			
			if(parser.hasAttachments()) {
				text.append("<p>Attachments: <br /><ul>");
				for(DataSource attachment : parser.getAttachmentList())
					text.append("<li>").append(attachment.getName()).append("</li>");
				text.append("</ul></p>");
			}
			
			Mailer mailer = new Mailer();
			mailer.mail(subject, text.toString(), mailer.new MailAddress("admins"));
			logger.log(Level.WARNING, "Message from "+parser.getFrom()+" forwarded to admins");

		} catch (Exception e) {
			logger.log(Level.SEVERE, e.getMessage(), e);
		}
	}
}
