package com.erep.dist.i18n;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

public class LanguageFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {}

	@Override
	public void destroy() {}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain filterChain) throws IOException, ServletException {

		HttpServletRequest request = (HttpServletRequest) req;

		// browser default
		setLanguage(request, request.getLocale().getLanguage());

		// cookie, if set
		Cookie[] cookies = request.getCookies();
		if (cookies != null)
			for (Cookie c : cookies)
				if ("language".equalsIgnoreCase(c.getName()))
					setLanguage(request, c.getValue());

		// but browser param overrides them all
		String param = request.getParameter("lang");
		if (param != null && !param.trim().isEmpty())
			setLanguage(request, param);

		filterChain.doFilter(req, resp);
	}

	private void setLanguage(HttpServletRequest request, String language) {
		request.setAttribute("language", language);
	}

}
