<%@ page contentType = "text/html;charset=UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<s:iterator value="records" var="record">
	<s:iterator value="columnNames" var="columnName" status="columnStat">${record[columnName]}${!columnStat.last ? "|" : ""}</s:iterator>
</s:iterator>