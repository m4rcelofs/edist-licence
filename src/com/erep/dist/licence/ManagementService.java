package com.erep.dist.licence;

import java.util.Date;
import java.util.List;

import javax.jdo.JDOObjectNotFoundException;
import javax.jdo.PersistenceManager;

import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;

import com.erep.dist.CloseablePM;
import com.erep.dist.PMF;
import com.erep.dist.erep.eRepTimeCalculator;
import com.erep.dist.licence.data.Licence;
import com.erep.dist.licence.dwr.LicencesQuery;
import com.google.appengine.api.users.UserServiceFactory;

@RemoteProxy
public class ManagementService {

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
		return true;
	}

	private boolean add(PersistenceManager pm, Licence licence) {
		licence.setEditedAt(new Date());
		licence.setEditedBy(UserServiceFactory.getUserService()
				.getCurrentUser().getEmail());
		pm.makePersistent(licence);
		return true;
	}

}
