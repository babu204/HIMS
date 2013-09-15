<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div>
	<s:form action="createUserLink" method="post" theme="simple">
		<table>
			<tr>
				<td>Enter User Name:</td>
				<td><s:textfield name="userName" required="true" theme="simple"></s:textfield></td>
			</tr>
			<tr>
				<td>Enter Password</td>
				<td><s:password name="passWord" required="true" theme="simple"></s:password></td>
			</tr>
			<%-- <tr>
				<td>Select Role</td>
				<td><s:select list="roleList" /></td>
			</tr> --%>
		</table>
		<s:token></s:token>
		<s:submit></s:submit>
	</s:form>
</div>
