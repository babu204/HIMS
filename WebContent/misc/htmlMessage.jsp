<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.theone.com.my/struts2" prefix="so"%>


<div id="global_error" class="errorMessage" align="${!empty align ? align : "center"}">
	<p style="border: 1px solid silver; padding: 5px; background: #ffd; text-align: center;">
		<s:actionerror /><s:property value="exception.message"/>
		<s:if test="%{!(#request.serverConfiguration.productionMode) && fieldErrors.size > 0}">
			${fieldErrors}
		</s:if>
	</p>
</div>
