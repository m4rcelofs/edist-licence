package com.erep.dist.licence.data;

import org.directwebremoting.annotations.DataTransferObject;
import org.directwebremoting.convert.EnumConverter;

@DataTransferObject(converter = EnumConverter.class)
public enum PaymentType
{
	CC, GOLD, WQ7
}
