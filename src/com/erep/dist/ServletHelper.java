package com.erep.dist;

import javax.servlet.http.HttpServletRequest;

public class ServletHelper {

	public String getBaseUrl(HttpServletRequest request) {
		
		StringBuilder baseUrl = new StringBuilder(request.getScheme())
							.append("://")
							.append(request.getServerName());
		
		if (request.getServerPort() != 80 
				&& request.getServerPort() != 443) 
			baseUrl.append(":")
					.append(request.getServerPort());
		
		if (request.getContextPath() != null
				&& !request.getContextPath().isEmpty()) 
			baseUrl.append("/")
					.append(request.getContextPath());
		
		return baseUrl.toString();
	}

}
