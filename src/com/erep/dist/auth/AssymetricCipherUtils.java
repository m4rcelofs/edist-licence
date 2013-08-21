package com.erep.dist.auth;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.KeySpec;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.crypto.Cipher;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.io.IOUtils;

public class AssymetricCipherUtils {

	private static final String	CIPHER		= "RSA/ECB/PKCS1Padding";
	private static final String	ALGORITHM	= "RSA";

	private static PublicKey	publicKeyBuffered;
	private static PrivateKey	privateKeyBuffered;

	private static Logger		logger		= Logger.getLogger(AssymetricCipherUtils.class
													.getName());

	public static String validateLicence(String signed) throws Exception {
		Cipher rsa = Cipher.getInstance(CIPHER);
		rsa.init(Cipher.DECRYPT_MODE, getLicencePublicKey());
		return new String(rsa.doFinal(Base64.decodeBase64(signed)));
	}

	public static String signLicence(String plain) throws Exception {
		Cipher rsa = Cipher.getInstance(CIPHER);
		rsa.init(Cipher.ENCRYPT_MODE, getLicencePrivateKey());
		return Base64.encodeBase64String(rsa.doFinal(plain.getBytes()));
	}

	private static PublicKey getLicencePublicKey() throws Exception {
		if (publicKeyBuffered == null) {
			byte[] keyBytes = loadKey("WEB-INF/keys/licence.public.key");
			publicKeyBuffered = generatePublic(keyBytes);
		}

		return publicKeyBuffered;
	}

	private static PrivateKey getLicencePrivateKey() throws Exception {
		if (privateKeyBuffered == null) {
			byte[] keyBytes = loadKey("WEB-INF/keys/licence.private.key");
			privateKeyBuffered = generatePrivate(keyBytes);
		}

		return privateKeyBuffered;
	}

	private static byte[] loadKey(String path) throws Exception {
		try (BufferedReader reader = new BufferedReader(new FileReader(path))) {
			String base64key = IOUtils.toString(reader);
			return Base64.decodeBase64(base64key);
		} catch (FileNotFoundException e) {
			logger.log(Level.SEVERE,
					"Could not find crypto key for path '{0}'", path);
			throw (e);
		}
	}

	private static PublicKey generatePublic(byte[] publicKeyBytes)
			throws Exception {
		KeyFactory keyFactory = KeyFactory.getInstance(ALGORITHM);
		KeySpec keySpec = new X509EncodedKeySpec(publicKeyBytes);
		return keyFactory.generatePublic(keySpec);
	}

	private static PrivateKey generatePrivate(byte[] privateKeyBytes)
			throws Exception {
		KeyFactory keyFactory = KeyFactory.getInstance(ALGORITHM);
		KeySpec keySpec = new PKCS8EncodedKeySpec(privateKeyBytes);
		return keyFactory.generatePrivate(keySpec);
	}

	protected static void generateKeys() throws NoSuchAlgorithmException {
		KeyPairGenerator keyPairGenerator = KeyPairGenerator
				.getInstance(ALGORITHM);
		KeyPair keyPair = keyPairGenerator.generateKeyPair();
		PublicKey publicKey = keyPair.getPublic();
		PrivateKey privateKey = keyPair.getPrivate();

		System.out.println(Base64.encodeBase64String(publicKey.getEncoded()));

		System.out
				.println("-----------------------------------------------------");

		System.out.println(Base64.encodeBase64String(privateKey.getEncoded()));
	}
}
