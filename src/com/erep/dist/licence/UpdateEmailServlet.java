package com.erep.dist.licence;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.jdo.JDOObjectNotFoundException;
import javax.servlet.http.*;

import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import com.erep.dist.CloseablePM;
import com.erep.dist.PMF;
import com.erep.dist.auth.AssymetricCipherUtils;
import com.erep.dist.licence.data.Licence;

public class UpdateEmailServlet extends HttpServlet {

	private static final long	serialVersionUID	= 1L;

	private static Logger		logger				= Logger.getLogger(UpdateEmailServlet.class
															.getName());

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {

		resp.setContentType("text/plain");
		resp.setCharacterEncoding("UTF-8");

		String encrypted = req.getParameter("encrypted");

		String decodedObj = "";
		try {
			decodedObj = AssymetricCipherUtils.decryptPublic(encrypted);
		} catch (Exception e) {
			logger.log(Level.WARNING, "Invalid request: '" + encrypted + "'");
			throw new IOException(e);
		}

		JSONObject jsObj = (JSONObject) JSONValue.parse(decodedObj);

		String appId = jsObj.get("appId").toString();
		String email = jsObj.get("email").toString();

		if (appId == null || appId.trim().isEmpty() || email == null
				|| email.trim().isEmpty()) {
			logger.log(Level.WARNING, "Invalid request");
			resp.sendError(400);
			return;
		}

		try (CloseablePM pm = PMF.getNewPersistenceManager()) {
			try {
				Licence licence = pm.getObjectById(Licence.class, appId);
				licence.setContactEmail(email);
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
