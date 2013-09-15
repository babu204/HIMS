<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.theone.com.my/struts2" prefix="so"%>
<%@ taglib uri="http://www.online1-my.com/online1/struts2-ext" prefix="se"%>

<so:serverConfiguration />
<html>
<head>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<title>Test Struts2-ext Tag</title>
<c:import url="/templates/include/scripts.jsp" />
</head>
<body>
<script type="text/javascript">
$(function(){
	$("#btnDialog").click(function(event){
		$("#modalDialog").dialog('open');
	});
}); // end $(function())
</script>

<se:view>
<s:form>
	<se:dialog id="modalDialog" title="Testing only">
		Just to say hi
	</se:dialog>
	<input type="button" id="btnDialog" value="click me!"/>
</s:form>
</se:view>
</body>
</html>