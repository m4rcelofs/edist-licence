package com.erep.dist.licence.data;

import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class Licence {

	@PrimaryKey
	@Persistent
	private String	appId;

	@Persistent
	private Integer	validUntilDay;

	public String getAppId() {
		return appId;
	}

	public void setAppId(String appId) {
		this.appId = appId;
	}

	public Integer getValidUntilDay() {
		return validUntilDay;
	}

	public void setValidUntilDay(Integer validUntilDay) {
		this.validUntilDay = validUntilDay;
	}

}
