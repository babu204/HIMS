<%@ page contentType = "text/html;charset=UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<s:iterator value="autocompleteResults" var="record">
	${record}|${record}
</s:iterator>