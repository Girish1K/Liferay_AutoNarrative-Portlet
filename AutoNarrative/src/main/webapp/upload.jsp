<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- <%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui" %>
<%@ taglib uri="http://liferay.com/tld/theme" prefix="liferay-theme" %> --%>

<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%-- <%@ taglib prefix="aui" uri="http://liferay.com/tld/aui"  %>
<%@ taglib prefix="liferay-theme" uri="http://liferay.com/tld/theme"  %>
 --%><%@ taglib prefix="liferay-ui" uri="http://liferay.com/tld/ui"  %>

<%@ page import="javax.portlet.PortletURL" %>
<%@ page import="org.apache.wink.json4j.JSONArray"%>  
<%@ page import="org.apache.wink.json4j.JSONObject"%>
<%@ page import="java.io.*,java.util.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- <script src="http://cdn.alloyui.com/3.0.1/aui/aui-min.js"></script>
<link href="http://cdn.alloyui.com/3.0.1/aui-css/css/bootstrap.min.css" rel="stylesheet"></link>
 --><meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
	function validateInput() {

		var caseID = document.getElementById("caseID").value;
		var fileName = document.getElementById("file").value;
		if(caseID==""){
			alert("Please enter caseID:");
			return false;
		}
		if(fileName==""){
			alert("Please browse the file");
			return false;
		}
			
		return true;
	}
</script>
</head>
<body>

<liferay-theme:defineObjects />
<portlet:defineObjects />

<portlet:actionURL name="uploadFile" var="uploadURL">
	<portlet:param name="caseID" value=""/>
</portlet:actionURL>
<liferay-ui:error key="caseID.errorMsg.missing" message="Please enter caseID"/>
<liferay-ui:error key="file.errorMsg.missing" message="Please select file:"/>

<%if(renderRequest.getPortletSession().getAttribute("jsonArray")==null){ %>
<%-- <form action="${uploadURL}" method="post" enctype="multipart/form-data" onsubmit="return validateInput();"> --%>
<form action="${uploadURL}" method="post" enctype="multipart/form-data" >
	<div>
		<label>Case ID <sup>*</sup>:</label> <input type="text" name="caseID" id="caseID">
	</div>
	<div>
		<label>Upload File <sup>*</sup>:</label> <input type="file" name="fileupload" id="file"> 
	</div>
	
	<div>
		<label>&nbsp;</label> <input type="submit" value="Submit"> 
	</div>
		
</form>

<%} %>
<%-- <center>
<aui:form action="${uploadURL}" method="post" enctype="multipart/form-data">

		
 	Case ID:-	<input type='text' name='<portlet:namespace/>caseID' id='<portlet:namespace/>caseID'/><br>
    <!-- CaseID :-<input type="text" name='caseID' id='caseID'><br> -->
    Upload File:-    	<input type='file' name="fileupload" id="file"/><br><br>
    <aui:input type='file' name='fileupload' value='Browse' />
    <aui:button name="Submit" value="Submit" type="submit" />
 </aui:form>
</center>
 --%>

<% //System.out.println("\n\nIn jsp page==>>\n"+request.getSession().getAttribute("jsonArray"));
if(renderRequest.getPortletSession().getAttribute("jsonArray")!=null){
   JSONArray jsonArray=(JSONArray)renderRequest.getPortletSession().getAttribute("jsonArray");
   ArrayList<String> keyList=new ArrayList();   
   for(Object o:jsonArray){
	   JSONObject jsonObject=(JSONObject) o;
	   Iterator keysToCopyIterator =jsonObject.keys();	   
	   while(keysToCopyIterator.hasNext()) {
	       String key = (String) keysToCopyIterator.next();
	       keyList.add(key);
	   }
	break;   
   }   
%>
 
 <%-- ${requestScope.jsonArray} --%>
        <%-- <h2>${requestScope.message}</h2> --%>
        
<portlet:renderURL var="questionURL">
    <portlet:param name="mvcPath" value="/questions.jsp" />
</portlet:renderURL>

<center><p><a href="<%= questionURL %>">Click Here</a></p></center>
 <%-- <center><aui:input type="button" id="btn" value="Click Here" name="Click Here" onclick="openPage('questions.jsp')"/></center> --%>

 <table style="width: 100%" >
 
 <tr class="portlet-section-header">
 <%for(int i=0;i<keyList.size();i++){ %>
 <th><%=keyList.get(i)%></th>
 </tr>
 <%} %>
 <%for(Object o:jsonArray){
	  JSONObject jsonObject=(JSONObject) o;
	  %>
	  <tr>
	  <%for(int j=0;j<keyList.size();j++){%>
	    <td><%=jsonObject.get(keyList.get(j)) %></td>	  
	  <%}%>
	  </tr>
	  <%}%>
 
 </table>       
 <%} %>
 
 <%-- 
<aui:script>
var rules = {
		caseID: {
	       required: true,
	       
	    },
	    file: {
	    	acceptFiles:xlsx,xls	
	    }
	}

	var fieldStrings = {
	    firstname: {
	       required:"Please enter caseID"  
	    }
	}

	AUI().use(
	    'aui-form-validator',
	    function(A) {
	       new A.FormValidator(
	         {
	          boundingBox: inputForm,
	          fieldStrings: fieldStrings,
	          rules: rules,
	          showAllMessages: true
	         }
	       )
	    }
	);
</aui:script>
 --%> 
</body>
</html>