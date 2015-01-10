package com.ingrc.performa;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.List;

import org.jasypt.exceptions.EncryptionOperationNotPossibleException;
import org.jasypt.util.text.BasicTextEncryptor;

public class Validation {
	
	private static final String PASS = "password";
	private static final String LICENSE_FILE = "license.txt";
	private List<String> keys = new ArrayList<String>();
	
	public Validation(){
		InputStream in = getClass().getClassLoader().getResourceAsStream(LICENSE_FILE);
		BufferedReader reader = new BufferedReader(new InputStreamReader(in));
        
        String line;
        try {
			while ((line = reader.readLine()) != null) {
			    keys.add(line);
			}
			reader.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
	}
	
	public boolean validate(){
		boolean result = false;
		InetAddress ip;
		try {
	 		ip = InetAddress.getLocalHost();
	 		NetworkInterface network = NetworkInterface.getByInetAddress(ip);
	 		byte[] mac = network.getHardwareAddress();
	 
	 
			StringBuilder sb = new StringBuilder();
			for (int i = 0; i < mac.length; i++) {
				sb.append(String.format("%02X%s", mac[i], (i < mac.length - 1) ? "-" : ""));		
			}
			String mc = sb.toString().trim().replace("-", "");
			
			BasicTextEncryptor textEncryptor = new BasicTextEncryptor();
			textEncryptor.setPassword(PASS);
			
			for (String en:keys){
				String dec = "";
				try {
					dec = textEncryptor.decrypt(en);
				} catch (EncryptionOperationNotPossibleException ex){
					
				}
				
				result = result || (mc.equals(dec));
			}
	 
		} catch (UnknownHostException e) {
	 
			e.printStackTrace();
	 
		} catch (SocketException e){
	 
			e.printStackTrace();
	 
		}
		return result;
	}

	
}
