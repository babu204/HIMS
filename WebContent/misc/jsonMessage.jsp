<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page contentType = "application/json;charset=UTF-8"%>
{
	<s:if test="%{fieldErrors.size > 0}">
	<%--
	"fieldErrors" : {
		<s:iterator value="fieldErrors" status="iterStatus">
			"<s:property value="key"/>" : "<s:property value="value[0]"/>"
			<s:if test="%{!#iterStatus.last}">
			,
			</s:if>
		</s:iterator>
	},--%>
	"fieldErrors" : [
		<s:iterator value="fieldErrors" status="iterStatus">
			{
			"name" : "<s:property value="key"/>",
			"msg" : "<s:property value="value[0]"/>"
			}
			<s:if test="%{!#iterStatus.last}">
			,
			</s:if>
		</s:iterator>
	],
	</s:if>
	"exception.message" : "<s:property value="exception.message" escapeJavaScript="true"/>",
	"actionerror" : "<s:actionerror />"
}