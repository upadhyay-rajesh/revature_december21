package com.exception;

public class SnsException extends Exception{
	String ss;
	public SnsException(String ss){
		super(ss);
	}
	public String toString(){
		return "exception is "+ss;
	}
}
