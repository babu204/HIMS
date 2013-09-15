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
<title>Upload File</title>
</head>
<body>
<s:form action="/test/doUpload" name="doUpload" method="POST" enctype="multipart/form-data" theme="simple">
	<span id="global_error" class="error">
			<s:actionerror /><s:property value="exception.message"/><s:fielderror />
	</span>
	<table>
		<tr>
			<td>Select File</td>
			<td>:</td>
			<td><s:file name="upName" label="File"/></td>
			<td></td>
		</tr>
		<tr>
			<td colspan="3" align="center">
			<s:submit />
			</td>
			<td></td>
		</tr>
	</table>
</s:form>
</body>
</html>
