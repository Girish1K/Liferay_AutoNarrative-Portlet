package com.test;

public class InputBean {
	private String caseID;
	private String fileName;
	
	
	public InputBean(String caseID, String selectedFile) {
		// TODO Auto-generated constructor stub
		this.caseID=caseID;
		this.fileName=selectedFile;
	}
	
	public String getCaseID() {
		return caseID;
	}
	public void setCaseID(String caseID) {
		this.caseID = caseID;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
}
