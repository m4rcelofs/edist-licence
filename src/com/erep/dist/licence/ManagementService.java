package com.erep.dist.licence;

import java.util.Date;
import java.util.List;

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

			licence.setEditedAt(new Date());
			licence.setEditedBy(UserServiceFactory.getUserService()
					.getCurrentUser().getEmail());

			pm.makePersistent(licence);
			return true;
		}
	}

}
