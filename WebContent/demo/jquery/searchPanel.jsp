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

<script type="text/javascript">
var jform = null;
$(function(){
	jform = $("#myForm").theoneValidate({
		submitHandler: function(form) {
			alert("Submit...");
		}
	});

	$("#btnCheck").click(function(event){
		var s = $(":input", jq("myForm")).fieldSerialize();
		alert(s);

		var ss = $(":input", jq("myForm")).formFieldValue();
		alert(ss);
	});
}); // end $(function())
</script>
</head>

<body>
	<form name="myForm" id="myForm">
	<table id="searchPanel" width="100%">
		<tr>
			<td>[username]</td>
			<td>:</td>
			<td><input type="text" name="username" id="username"/></td>
		</tr>
		<tr>
			<td>[username.dis]</td>
			<td>:</td>
			<td><input type="text" name="username.dis" id="username.dis" value="hello" disabled="disabled"/></td>
		</tr>
		<tr>
			<td>[userId] (hidden)</td>
			<td>:</td>
			<td><input type="hidden" name="userId" id="userId"/></td>
		</tr>
		<tr>
			<td>[passwd]</td>
			<td>:</td>
			<td><input type="password" name="passwd" id="passwd"/></td>
		</tr>
		<tr>
			<td>[user.username]</td>
			<td>:</td>
			<td><input type="text" name="user.username" id="user.username"/></td>
		</tr>
		<tr>
			<td>[desc]</td>
			<td>:</td>
			<td><textarea rows="3" cols="30" name="desc" id="desc"></textarea></td>
		</tr>
		<tr>
			<td>[dept]</td>
			<td>:</td>
			<td>
				<select name="dept" id="dept">
					<option value=""></option>
					<option value="IT">IT</option>
					<option value="HR">HR</option>
					<option value="PR">PR</option>
					<option value="FAC">FAC</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>[status]</td>
			<td>:</td>
			<td>
				<input type="radio" name="status" id="statusYes">Yes
				<input type="radio" name="status" id="statusNo">No
			</td>
		</tr>
		<tr>
			<td>[hobbies]</td>
			<td>:</td>
			<td>
				<input type="checkbox" name="hobby" id="hobbyBad" checked="checked" value="badminton">Badminton
				<input type="checkbox" name="hobby" id="hobbyReading" value="reading">Reading
			</td>
		</tr>
		<tr>
			<td colspan="3">
				<input type="button" name="btnAdd" id="btnAdd" value="Add"/>
				<input type="button" name="btnCheck" id="btnCheck" value="Check"/>
				<input type="submit" name="btnSubmit" id="btnSubmit" value="Submit"/>
			</td>
		</tr>
	</table>
	</form>
</body>