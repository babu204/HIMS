<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<jsp:include page="/scripts.jsp"></jsp:include>
<html>
<head>
<title><tiles:insertAttribute name="title" ignore="true" /></title>
</head>
<body>

	<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td><tiles:insertAttribute name="header" /></td>
		</tr>
		<tr>
			<td valign="top" align="left" width="100%">
				<table cellpadding="0" cellspacing="0" width="100%">
					<tr valign="top">
						<td id="menu_panel" width="20%"><tiles:insertAttribute
								name="menu" /></td>
						<td width="1%">&nbsp;</td>
						<td width="76%" id="content_panel"><tiles:insertAttribute
								name="body" /></td>
						<td width="1%">&nbsp;</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td><tiles:insertAttribute name="footer" /></td>
		</tr>
	</table>



</body>
</html>
