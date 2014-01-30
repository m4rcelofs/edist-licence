package com.erep.dist;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;

import static javax.mail.Session.getDefaultInstance;
import static javax.mail.Transport.send;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.google.appengine.api.utils.SystemProperty;

public class Mailer {

	public class MailAddress {
		public String	name;
		public String	address;

		public MailAddress() {}

		public MailAddress(String address) {
			this.address = address;
		}

		public MailAddress(String name, String address) {
			this.name = name;
			this.address = address;
		}
	}

	/**
	 * @param nameEmails
	 *            [name][email]
	 */
	public void mail(String subject, String message, MailAddress... emails)
			throws IOException {

		try {
			Properties props = new Properties();
			Session session = getDefaultInstance(props, null);

			Message msg = new MimeMessage(session);

			String from = "notifications@" + SystemProperty.applicationId.get()
					+ ".appspotmail.com";
			msg.setFrom(new InternetAddress(from, "eDist"));
			msg.setSubject(subject);
			msg.setContent(message, "text/html");

			for (MailAddress email : emails) {
				if (email == null)
					continue;
				if (email.name == null || email.name.isEmpty())
					msg.addRecipient(Message.RecipientType.TO,
							new InternetAddress(email.address));
				else
					msg.addRecipient(Message.RecipientType.TO,
							new InternetAddress(email.address, email.name));
			}
			send(msg);
		} catch (Exception e) {
			throw new IOException(e);
		}
	}

}
