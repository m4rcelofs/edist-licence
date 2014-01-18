package com.erep.dist.licence.data;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import org.directwebremoting.annotations.DataTransferObject;
import org.directwebremoting.annotations.RemoteProperty;


@DataTransferObject
@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class Licence {

	@PrimaryKey
	@Persistent
	@RemoteProperty
	private String	appId;

	@Persistent
	@RemoteProperty
	private Integer	validUntilDay;
	
	@Persistent
	@RemoteProperty
	private Integer	userLimit;
	
	@Persistent
	@RemoteProperty
	private String	contactEmail;

	@Persistent
	@RemoteProperty
	private Date	editedAt;

	@Persistent
	@RemoteProperty
	private String	editedBy;
	
	@Persistent(mappedBy = "licence")
	private Set<Payment>		payments;

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

	public Date getEditedAt() {
		return editedAt;
	}

	public void setEditedAt(Date editedAt) {
		this.editedAt = editedAt;
	}

	public String getEditedBy() {
		return editedBy;
	}

	public void setEditedBy(String editedBy) {
		this.editedBy = editedBy;
	}

	public Integer getUserLimit() {
		return userLimit;
	}

	public void setUserLimit(Integer userLimit) {
		this.userLimit = userLimit;
	}

	public String getContactEmail() {
		return contactEmail;
	}

	public void setContactEmail(String contactEmail) {
		this.contactEmail = contactEmail;
	}

	public Set<Payment> getPayments() {
		if(payments == null)
			payments = new HashSet<>();
		return payments;
	}

	public void setPayments(Set<Payment> payments) {
		this.payments = payments;
	}

}
