<%--
/**
 * Copyright (c) 2000-present Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */
--%>

<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ page import="org.apache.wink.json4j.JSONArray"%>  
<%@ page import="org.apache.wink.json4j.JSONObject"%>
<%@ page import="java.io.*,java.util.*"%>

<portlet:defineObjects />

<portlet:renderURL var="uploadURL">
    <portlet:param name="mvcPath" value="/upload.jsp" />
</portlet:renderURL>
<p><a href="<%= uploadURL %>"><b>Narrative Application</b></a></p>





