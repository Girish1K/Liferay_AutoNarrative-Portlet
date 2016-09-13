<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib uri="http://java.sun.com/portlet" prefix="portlet" %>  
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>
<portlet:defineObjects />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript">
function openPage(pageName){
	window.location.href=pageName;
}
</script>

<title>Questions</title>
</head>

<body>

<portlet:renderURL var="narrativelURL">
              <portlet:param name="jspPage" value="/narrativeEditor.jsp"/>
</portlet:renderURL>


  <aui:input type="checkbox" name="Case is Serious" value="Case is Serious" />
  <aui:input type="checkbox" name="Case is not Serious" value="Case is not Serious" />
  <p><a href="<%= narrativelURL %>">Click Here</a></p>
  <%-- <aui:input type="button" onclick="<%=narrativelURL.toString()%>" label="Submit" name="Submit"/> --%>  

<%renderRequest.getPortletSession().removeAttribute("jsonArray"); %>
</body>
</html>