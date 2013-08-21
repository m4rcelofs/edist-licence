package com.erep.dist.licence.dwr;

import java.util.List;

import org.directwebremoting.annotations.DataTransferObject;
import org.directwebremoting.annotations.RemoteProperty;

import com.erep.dist.licence.data.Licence;

@DataTransferObject
public class LicencesQuery {

	@RemoteProperty
	private Integer			eRepDay;

	@RemoteProperty
	private List<Licence>	licences;

	public Integer geteRepDay() {
		return eRepDay;
	}

	public void seteRepDay(Integer eRepDay) {
		this.eRepDay = eRepDay;
	}

	public List<Licence> getLicences() {
		return licences;
	}

	public void setLicences(List<Licence> licences) {
		this.licences = licences;
	}

}
