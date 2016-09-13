<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>
<%@ page import="javax.portlet.PortletURL" %>
<%@ page import="org.apache.wink.json4j.JSONArray"%>  
<%@ page import="org.apache.wink.json4j.JSONObject"%>
<%@ page import="java.io.*,java.util.*"%>
<portlet:defineObjects />    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<portlet:actionURL name="uploadFile" var="actionURLByPortletTagURL">
<portlet:param name="caseID" value=""/>
</portlet:actionURL>
<center>
<aui:form action="${actionURLByPortletTagURL}" method="post" enctype="multipart/form-data">
		<aui:input name='caseID' type='text' id='caseID'></aui:input>
    <!-- CaseID :-<input type="text" name='caseID' id='caseID'><br> -->
    <aui:input type='file' name='fileupload' value='Browse' />
    <aui:button name="Submit" value="Submit" type="submit"></aui:button>
    <!-- <input type="submit" value="Submit">  -->
</aui:form>
</center>
<%System.out.println("In jsp------------->> "+renderRequest.getPortletSession().getAttribute("jsonArray"));

if(renderRequest.getPortletSession().getAttribute("jsonArray")!=null && renderRequest.getPortletSession().getAttribute("jsonArray").equals("Y")){
%>
<center><table><tr>Please display table here</tr></table></center>
<%} %>
</body>
</html>