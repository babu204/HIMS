<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.theone.com.my/struts2" prefix="so"%>

<so:serverConfiguration />
<html>
<head>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<title>Test JQUERY</title>

<c:import url="/templates/include/scripts.jsp" />
</head>
<body>
<script type="text/javascript">
//define function to be executed on document ready
$(function(){
	$("#btnYesNoCancel").click(function(event){
		messageBox.confirmYesNoCancel("hello", function(){
			alert("yes");
		}, function(){
			alert("No");
			});
	});
	
	$("#btnYesNoCancel2").click(function(event){
		messageBox.confirmYesNoCancel("hello2");
	});
	
	$("#btnYesNo").click(function(event){
		messageBox.confirm("hello", function(){
			alert("yes1");
		}, function(){
			alert("No1");
			});
	});
	
	$("#btnYesNo2").click(function(event){
		messageBox.confirm("hello2");
	});
});
</script>
<input type="button" name="btnYesNoCancel" id="btnYesNoCancel" value="show YES NO CANCEL"/>
<input type="button" name="btnYesNoCancel2" id="btnYesNoCancel2" value="show YES NO CANCEL2"/>
<input type="button" name="btnYesNo" id="btnYesNo" value="show YES NO"/>
<input type="button" name="btnYesNo2" id="btnYesNo2" value="show YES NO"/>
</body>
</html>