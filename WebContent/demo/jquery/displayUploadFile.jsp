<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<html>
<head>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">

<c:import url="/templates/include/scripts.jsp" />
<title>Display Image</title>
</head>
<body>
	<s:url id ="displayImageAction" action="displayImage" namespace="/test">
    	<s:param name="id" value="%{id}" />
	</s:url>
	
	<img src="${displayImageAction}" />

	<!--<img src="displayImage.action?id=<%=request.getParameter("id")%>" />-->
</body>
</html>
