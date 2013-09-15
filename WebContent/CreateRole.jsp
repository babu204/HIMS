<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div>
	<s:form action="createLink" method="post" theme="simple">
		<table>
			<tr>
				<td>Enter Role Name:</td>
				<td><s:textfield name="roleName" required="true" theme="simple"></s:textfield></td>
			</tr>
		</table>
		<s:token></s:token>
		<s:submit></s:submit>
	</s:form>
</div>
