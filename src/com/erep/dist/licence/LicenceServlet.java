package com.erep.dist.licence;

import java.io.IOException;

import javax.jdo.JDOObjectNotFoundException;
import javax.servlet.http.*;

import com.erep.dist.CloseablePM;
import com.erep.dist.PMF;
import com.erep.dist.auth.AssymetricCipherUtils;
import com.erep.dist.licence.data.Licence;

@SuppressWarnings("serial")
public class LicenceServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");

		String appId = req.getParameter("appId");

		if (appId == null || appId.trim().isEmpty()) {
			resp.sendError(400);
			return;
		}

		try (CloseablePM pm = PMF.getNewPersistenceManager()) {
			try {
				Licence licence = pm.getObjectById(Licence.class, appId);

				String signed = AssymetricCipherUtils.signLicence(licence
						.getValidUntilDay().toString());

				resp.getWriter().write(signed);

			} catch (JDOObjectNotFoundException e) {
				resp.sendError(404);
				return;
			} catch (Exception e) {
				resp.sendError(503);
				return;
			}
		}
	}

}
