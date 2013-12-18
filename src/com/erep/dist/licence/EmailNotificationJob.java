package com.erep.dist.licence;

import static com.erep.dist.erep.eRepTimeCalculator.geteRepDay;

import java.io.IOException;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.erep.dist.CloseablePM;
import com.erep.dist.Mailer;
import com.erep.dist.PMF;
import com.erep.dist.licence.data.Licence;

public class EmailNotificationJob extends HttpServlet {

	private static final long	serialVersionUID	= 1L;

	private static Logger		logger				= Logger.getLogger(EmailNotificationJob.class
															.getName());

	@SuppressWarnings("unchecked")
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {

		try (CloseablePM pm = PMF.getNewPersistenceManager()) {

			Mailer mailer = new Mailer();
			List<Licence> all = (List<Licence>) pm.newQuery(Licence.class)
					.execute();
			Integer limit = geteRepDay() + 3;

			for (Licence licence : all) {
				if (licence.getValidUntilDay() <= limit
						&& licence.getContactEmail() != null
						&& !licence.getContactEmail().isEmpty()) {
					String subject = "eDist - Licence for "
							+ licence.getAppId() + " Valid Until Day "
							+ licence.getValidUntilDay();

					StringBuilder message = new StringBuilder(
							"<p><b>eDist - License Expiring Reminder</b></p>");

					message.append("<p>Hello!</p>");

					message.append(
							"<p>This is automatic message to remind you that licence for the eDist Application ")
							.append(licence.getAppId())
							.append(" used by your Military Unit will expire on eRepublik Day <b>")
							.append(licence.getValidUntilDay())
							.append("</b></p>");

					message.append("<p>Please make sure to renew your subscription as soon as possible to avoid service interruption. "
							+ "You can contact us at:</p>");

					message.append("<p>- IRC (Rizon): <a href=\"https://qchat.rizon.net/?channels=eDist\">#eDist</a> <br />"
							+ "- <a href=\"http://www.erepublikbr.com/private.php?do=newpm&u=5602\">The eBR Forums</a></p>");

					message.append("<p>Regards, <br /> eDist Development</p> ");
					message.append("<p><small>This is an automated message. Please do not reply directly to this address "
							+ "as your message as your message will not be received.</small></p>");

					mailer.mail(subject, message.toString(),
							mailer.new MailAddress(licence.getContactEmail()),
							mailer.new MailAddress("admins"));
				}

			}

		}
	}
}
