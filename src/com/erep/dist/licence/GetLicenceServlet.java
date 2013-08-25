package com.erep.dist.licence;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.jdo.JDOObjectNotFoundException;
import javax.servlet.http.*;

import org.json.simple.JSONObject;

import com.erep.dist.CloseablePM;
import com.erep.dist.PMF;
import com.erep.dist.auth.AssymetricCipherUtils;
import com.erep.dist.licence.data.Licence;

@SuppressWarnings("serial")
public class GetLicenceServlet extends HttpServlet {

	private static Logger	logger	= Logger.getLogger(GetLicenceServlet.class
											.getName());

	@SuppressWarnings("unchecked")
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		resp.setContentType("text/plain");
		resp.setCharacterEncoding("UTF-8");

		String appId = req.getParameter("appId");

		if (appId == null || appId.trim().isEmpty()) {
			logger.log(Level.WARNING, "Invalid request");
			resp.sendError(400);
			return;
		}

		try (CloseablePM pm = PMF.getNewPersistenceManager()) {
			try {
				Licence licence = pm.getObjectById(Licence.class, appId);

				JSONObject jsObj = new JSONObject();
				jsObj.put("validUntilDay", licence.getValidUntilDay());
				jsObj.put("userLimit", licence.getUserLimit());
				
				String signed = AssymetricCipherUtils.signLicence(jsObj.toJSONString());

				resp.getWriter().write(signed);

			} catch (JDOObjectNotFoundException e) {
				logger.log(Level.WARNING, "Invalid request for appId {0}",
						appId);
				resp.sendError(404);
				return;
			} catch (Exception e) {
				logger.log(Level.SEVERE, "Error in request for appId " + appId,
						e);
				resp.sendError(503);
				return;
			}
		}
	}

}
