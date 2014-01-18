package com.erep.dist.licence.data;

import java.util.Date;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.NotPersistent;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import org.directwebremoting.annotations.DataTransferObject;
import org.directwebremoting.annotations.RemoteProperty;

import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;

@DataTransferObject
@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class Payment {

	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private Key			key;

	@NotPersistent
	@RemoteProperty
	private String		encodedKey;

	@Persistent
	private Licence		licence;

	@Persistent
	@RemoteProperty
	private Double		value;

	@Persistent
	@RemoteProperty
	private PaymentType	type;

	@Persistent
	@RemoteProperty
	private Integer		paymentDate;

	@Persistent
	@RemoteProperty
	private Date		recordedAt;

	@Persistent
	@RemoteProperty
	private String		recordedBy;

	@Persistent
	@RemoteProperty
	private Integer		fromDay;

	@Persistent
	@RemoteProperty
	private Integer		toDay;

	@Persistent
	@RemoteProperty
	private String		notes;

	public Licence getLicence() {
		return licence;
	}

	public void setLicence(Licence licence) {
		this.licence = licence;
	}

	public Double getValue() {
		return value;
	}

	public void setValue(Double value) {
		this.value = value;
	}

	public PaymentType getType() {
		return type;
	}

	public void setType(PaymentType type) {
		this.type = type;
	}

	public Date getRecordedAt() {
		return recordedAt;
	}

	public void setRecordedAt(Date recordedAt) {
		this.recordedAt = recordedAt;
	}

	public Integer getFromDay() {
		return fromDay;
	}

	public void setFromDay(Integer fromDay) {
		this.fromDay = fromDay;
	}

	public Integer getToDay() {
		return toDay;
	}

	public void setToDay(Integer toDay) {
		this.toDay = toDay;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

	public Integer getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(Integer paymentDate) {
		this.paymentDate = paymentDate;
	}

	public String getRecordedBy() {
		return recordedBy;
	}

	public void setRecordedBy(String recordedBy) {
		this.recordedBy = recordedBy;
	}

	public String getEncodedKey() {
		if (key != null)
			return KeyFactory.keyToString(key);
		return encodedKey;
	}

	public void setEncodedKey(String encodedKey) {
		this.encodedKey = encodedKey;
		if (encodedKey != null)
			this.key = KeyFactory.stringToKey(encodedKey);
	}

	public Key getKey() {
		return key;
	}

	public void setKey(Key key) {
		this.key = key;
	}

}
