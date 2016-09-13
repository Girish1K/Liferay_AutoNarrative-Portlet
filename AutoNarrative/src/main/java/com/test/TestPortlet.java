package com.test;

import java.io.File;
import java.util.ArrayList;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletConfig;
import javax.portlet.PortletSession;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.wink.json4j.JSONArray;

import com.liferay.portal.kernel.portlet.LiferayPortletConfig;
import com.liferay.portal.kernel.servlet.SessionErrors;
import com.liferay.portal.kernel.servlet.SessionMessages;
import com.liferay.portal.kernel.upload.UploadPortletRequest;
import com.liferay.portal.kernel.util.JavaConstants;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.kernel.util.Validator;
import com.liferay.portal.util.PortalUtil;
import com.liferay.util.bridges.mvc.MVCPortlet;
import com.utility.Constants;
import com.utility.FileUtility;

/**
 * Portlet implementation class TestPortlet
 */
public class TestPortlet extends MVCPortlet {
	

	private final static int SIZE = 1024*100;
		
	private final static String fileInputName = "fileupload";
 
	
	public void uploadFile(ActionRequest actionRequest, ActionResponse actionResponse) throws Exception {
		
		
		String caseID= ParamUtil.getString(actionRequest, "caseID");
		UploadPortletRequest uploadRequest = PortalUtil.getUploadPortletRequest((actionRequest));
		System.out.println("caseID-->> "+caseID+"\nselectedFile---->> "+uploadRequest.getFileName("fileupload"));
		InputBean inputBean=new InputBean(caseID, uploadRequest.getFileName("fileupload"));
	
		
		ArrayList<String>inputList=new ArrayList<String>();
		inputList=validate(inputBean, actionRequest);
		if(inputList.size()==0){
		
		
		new Constants("autoNarrative.properties");
		int MAX_COLUMN_SIZE_OF_FILE=Integer.parseInt(Constants.getProperty("MAX_COLUMN_SIZE_OF_FILE"));
		int DEFAULT_GRID_SIZE=Integer.parseInt(Constants.getProperty("DEFAULT_GRID_SIZE"));
		int SEARCH_SHEET_NO=Integer.parseInt(Constants.getProperty("SEARCH_SHEET_NO"));
		
		String baseDir=Constants.getProperty("baseDir");		
		HttpServletRequest request=PortalUtil.getHttpServletRequest(actionRequest);		
		//System.out.println("-------------------In uploadFile method caseID-------------"+ParamUtil.getString(actionRequest, "caseID"));
		
		
		 
		long sizeInBytes = uploadRequest.getSize(fileInputName);
		// System.out.println("actual size of file----->> "+sizeInBytes+"\nacheck size of disk--------> "+SIZE);
		if (uploadRequest.getSize(fileInputName) == 0) {
			throw new Exception("Received file is 0 bytes!");
		}
 
		// Get the uploaded file as a file.
		File uploadedFile = uploadRequest.getFile(fileInputName);
 
		String sourceFileName = uploadRequest.getFileName(fileInputName);
 
		
		// Where should we store this file?
		File folder = new File(baseDir);
 
		// Check minimum 1GB storage space to save new files...
	/*	
		if (folder.getUsableSpace() < SIZE) {
			throw new Exception("Out of disk space!");
		}
 */
		// This is our final file path.
		File filePath = new File(folder.getAbsolutePath() + File.separator + sourceFileName);
		System.out.println("upload file path----------------  "+filePath);
		// Move the existing temporary file to new location.
		FileUtils.copyFile(uploadedFile, filePath);
		FileUtility fileUtility=new FileUtility();
		JSONArray jsonArray=null;
		try{
			jsonArray = fileUtility.getJson(folder.getAbsolutePath() + File.separator + sourceFileName, SEARCH_SHEET_NO, MAX_COLUMN_SIZE_OF_FILE, DEFAULT_GRID_SIZE);
		}catch(Exception e){
			e.printStackTrace();
		}
		PortletSession session= actionRequest.getPortletSession();
		//session.setAttribute("jsonArray", "Y");
		session.setAttribute("jsonArray", jsonArray);
		actionResponse.setRenderParameter("jspPage", "/upload.jsp");
		}else{
			PortletConfig config=(PortletConfig) actionRequest.getAttribute(JavaConstants.JAVAX_PORTLET_CONFIG);
			SessionMessages.add(actionRequest, PortalUtil.getPortletId(actionRequest)+SessionMessages.KEY_SUFFIX_HIDE_DEFAULT_ERROR_MESSAGE);
			actionResponse.setRenderParameter("jspPage", "/upload.jsp");
		}
	}


	private ArrayList<String> validate(InputBean inputBean, ActionRequest actionRequest) {
		
		ArrayList<String>list=new ArrayList<String>();
		if(!Validator.isName(inputBean.getCaseID())){
			list.add(inputBean.getCaseID());
			SessionErrors.add(actionRequest, "caseID.errorMsg.missing");
		}
		System.out.println(Validator.isFileName(inputBean.getFileName()));
		if(!Validator.isFileName(inputBean.getFileName())){
			list.add(inputBean.getFileName());
			SessionErrors.add(actionRequest, "file.errorMsg.missing");
		}
		
			//return false;
		System.out.println("Size Of List -->  "+list.size());
		return list;
	}
 

} 
