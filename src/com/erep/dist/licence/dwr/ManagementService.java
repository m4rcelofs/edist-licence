package com.erep.dist.licence.dwr;

import java.io.IOException;
import java.util.Collection;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.jdo.JDOObjectNotFoundException;
import javax.jdo.PersistenceManager;

import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;

import com.erep.dist.CloseablePM;
import com.erep.dist.Mailer;
import com.erep.dist.PMF;
import com.erep.dist.Mailer.MailAddress;
import com.erep.dist.erep.eRepTimeCalculator;
import com.erep.dist.licence.data.Licence;
import com.erep.dist.licence.data.Payment;
import com.google.appengine.api.users.UserServiceFactory;

@RemoteProxy
public class ManagementService {

	private static Logger	logger	= Logger.getLogger(ManagementService.class
											.getName());

	@RemoteMethod
	@SuppressWarnings("unchecked")
	public boolean sendMessage(String subject, String text) {

		text = "<p>" + text + "</p>";
		text = "<img src=\"https://edist-licence.appspot.com/img/logo/logo2_small_opt.cache.png\">"
				+ text;
		text = text.replace("\n", "<br />");

		text += "<hr><p><small>";
		text += "Essa é uma mensagem automática, por favor não responder. / ";
		text += "This is an automated message, please do not reply.<br/>";
		text += "Entre em contato no #eDist! / Contact us on #eDist!";
		text += "</small></p>";

		try (CloseablePM pm = PMF.getNewPersistenceManager()) {
			Mailer mailer = new Mailer();
			List<Licence> licences = (List<Licence>) pm.newQuery(Licence.class)
					.execute();

			mailer.mail(subject, text, mailer.new MailAddress("admins"));
			for (Licence licence : licences) {
				mailer.mail(subject, text,
						mailer.new MailAddress(licence.getContactEmail()));
			}
			return true;
		} catch (IOException e) {
			logger.log(Level.SEVERE, e.getMessage(), e);
		}
		return false;
	}

	@RemoteMethod
	public void addPayment(Licence licence, Payment payment) {
		try (CloseablePM pm = PMF.getNewPersistenceManager()) {
			Licence original = pm.getObjectById(Licence.class,
					licence.getAppId());
			payment.setRecordedAt(new Date());
			payment.setRecordedBy(UserServiceFactory.getUserService()
					.getCurrentUser().getEmail());
			original.getPayments().add(payment);
		}
	}

	@RemoteMethod
	public Collection<Payment> listPayments(Licence licence) {
		try (CloseablePM pm = PMF.getNewPersistenceManager()) {
			try {
				Licence original = pm.getObjectById(Licence.class,
						licence.getAppId());
				Set<Payment> response = original.getPayments();
				return pm.detachCopyAll(response);
			} catch (JDOObjectNotFoundException e) {
				return new HashSet<>();
			}
		}
	}

	@RemoteMethod
	public boolean removePayment(Licence licence, Payment payment) {
		try (CloseablePM pm = PMF.getNewPersistenceManager()) {
			Licence dbLicence = pm.getObjectById(Licence.class,
					licence.getAppId());
			Payment dbPayment = pm.getObjectById(Payment.class,
					payment.getKey());
			dbLicence.getPayments().remove(dbPayment);
			return true;
		}
	}

	@RemoteMethod
	@SuppressWarnings("unchecked")
	public LicencesQuery listLicences() {
		LicencesQuery dto = new LicencesQuery();
		try (CloseablePM pm = PMF.getNewPersistenceManager()) {
			dto.setLicences((List<Licence>) pm.newQuery(Licence.class)
					.execute());
		}
		dto.seteRepDay(eRepTimeCalculator.geteRepDay());
		return dto;
	}

	@RemoteMethod
	public boolean addLicence(Licence licence) {
		try (CloseablePM pm = PMF.getNewPersistenceManager()) {

			try {
				Licence original = pm.getObjectById(Licence.class,
						licence.getAppId());
				return edit(original, licence);
			} catch (JDOObjectNotFoundException e) {
				return add(pm, licence);
			}

		}
	}

	private boolean edit(Licence original, Licence edited) {
		if (edited.getContactEmail() != null
				&& !edited.getContactEmail().trim().isEmpty())
			original.setContactEmail(edited.getContactEmail());
		if (edited.getUserLimit() != null)
			original.setUserLimit(edited.getUserLimit());
		if (edited.getValidUntilDay() != null)
			original.setValidUntilDay(edited.getValidUntilDay());

		original.setEditedAt(new Date());
		original.setEditedBy(UserServiceFactory.getUserService()
				.getCurrentUser().getEmail());

		try {
			mailChanges(original);
		} catch (IOException e) {
			logger.log(Level.SEVERE, e.getMessage(), e);
			return false;
		}

		return true;
	}

	private boolean add(PersistenceManager pm, Licence licence) {
		licence.setEditedAt(new Date());
		licence.setEditedBy(UserServiceFactory.getUserService()
				.getCurrentUser().getEmail());
		pm.makePersistent(licence);

		try {
			mailChanges(licence);
		} catch (IOException e) {
			logger.log(Level.SEVERE, e.getMessage(), e);
			return false;
		}

		return true;
	}

	private void mailChanges(Licence licence) throws IOException {

		if (licence.getContactEmail() != null
				&& !licence.getContactEmail().isEmpty()) {

			Mailer mailer = new Mailer();

			String subject = "eDist - Licence for " + licence.getAppId()
					+ " has been changed";

			StringBuilder message = new StringBuilder(
					"<p><b>eDist - License Notification</b></p>");

			message.append("<p>Hello!</p>");

			message.append("<p>This is automatic notification that the licence for the eDist Application "
					+ "used by your Military Unit has been changed.</p>");

			message.append("<p>- AppID: ").append(licence.getAppId())
					.append("<br />- Valid until eDay: ")
					.append(licence.getValidUntilDay())
					.append("<br />- Maximum number of users: ")
					.append(licence.getUserLimit()).append("</p>");

			message.append("<p>If you have any questions, please contact us at:</p>");

			message.append("<p>- IRC (Rizon): <a href=\"https://qchat.rizon.net/?channels=eDist\">#eDist</a> <br />"
					+ "- <a href=\"http://www.erepublikbr.com/private.php?do=newpm&u=5602\">The eBR Forums</a></p>");

			message.append("<p>Regards, <br /> eDist Development</p> ");
			message.append("<p></p><p><small>Today is eDay ")
					.append(eRepTimeCalculator.geteRepDay())
					.append(".<br />This is an automated message. Please do not reply directly to this address "
							+ "as your message will not be received.</small></p>");

			mailer.mail(subject, message.toString(), mailer.new MailAddress(
					licence.getContactEmail()),
					mailer.new MailAddress("admins"));

		}

	}

}
