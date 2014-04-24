package com.erep.dist.licence;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.erep.dist.Mailer;
import com.google.appengine.api.mail.BounceNotification;
import com.google.appengine.api.mail.BounceNotificationParser;

public class IncomeBounceMailServlet extends HttpServlet {
	
	private static final long	serialVersionUID	= 1L;
	private static Logger	logger	= Logger.getLogger(IncomeBounceMailServlet.class.getName());
	
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		
		logger.log(Level.WARNING, "Incoming BOUNCE message");
		try {
			BounceNotification bounce = BounceNotificationParser.parse(req);
			
			StringBuilder text = new StringBuilder("<img src=\"https://edist-licence.appspot.com/img/logo/logo2_small_opt.cache.png\">")
							.append("<p><b>Forwarded bounce message below</b></p>")
							.append("<p>From: ").append(bounce.getNotification().getFrom()).append("<br/>")
							.append("To: ").append(bounce.getNotification().getTo()).append("<br/>")
							.append("Subject: ").append(bounce.getNotification().getSubject()).append("<br/>")
							.append("Original Subject: ").append(bounce.getOriginal().getSubject()).append("</p>")
							.append("<p>").append(bounce.getNotification().getText()).append("</p>");
					
			
			Mailer mailer = new Mailer();
			mailer.mail("eDist Message Bounce", text.toString(), mailer.new MailAddress("admins"));
			logger.log(Level.WARNING, "Bounce Message from "+bounce.getNotification().getFrom()+" forwarded to admins");
			
			
		} catch (Exception e) {
			logger.log(Level.SEVERE, e.getMessage(), e);
		}

	}
}
