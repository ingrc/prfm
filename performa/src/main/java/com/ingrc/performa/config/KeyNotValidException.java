package com.ingrc.performa.config;

public class KeyNotValidException extends Exception{

	 /**
	 * 
	 */
	private static final long serialVersionUID = -8550020929785922136L;

	public KeyNotValidException() {
	        super("Warning: Not Valid License, please contact your software provider for details!");
	    }
}
