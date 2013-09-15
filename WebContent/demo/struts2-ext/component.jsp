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
<%-- 
<fieldset>
<legend>Testing the Online1Dialog</legend>
<script type="text/javascript">
var dob = null;
$(function(){
	$("#btnOpen").click(function(event){
		$("#myModal").dialog('open');
	});
});
</script>
<se:dialog id="myModal" title="Testing only">
Just to say hi!!!
</se:dialog>
<input type="button" id="btnOpen" value="open">	
</fieldset>
--%>
<fieldset>
	<legend>Test Form</legend>
<script type="text/javascript">
var dob = null;
$(function(){
	$("#btnOpenDept").click(function(event){
		$("#deptModal").dialog('open');
	});
});
</script>
<s:form>
<table>
	<%-- 
	<se:datepicker label="DOB" id="dob" name="dob" assignJsVar="dob"/>
	--%>
	<s:url id="deptAutoCompleteUrl" action="deptAutoComplete" namespace="/app/master" />
	<%-- 
	<se:autocomplete url="%{deptAutoCompleteUrl}" key="dept" name="deptName" id="deptName" hiddenId="user.deptId" dialogSearchId="deptModal2" onselect="deptAutocompleteOnSelect" onunselect="deptAutocompleteOnUnselect"/>
	--%>
	<se:buttonRow>
		<input type="button" id="btnOpenDept" value="open">
	</se:buttonRow>
</table>
<s:url id="deptListingUrl" action="deptListing" namespace="/app/master" />
<%-- 
<se:dataTable id="deptDatagrid" sAjaxSource="%{deptListingUrl}" list="depts" idTr="true">
	<se:dataTableColumn label="Dept Id[Hidden]" propertyName="deptId" visible="false"/>
	<se:dataTableColumn key="dept" propertyName="deptName"/>
	<se:dataTableColumn key="dept.deptDesc" propertyName="deptDesc"/>
	<se:dataTableColumn key="status" propertyName="status" fnRender="deptStatusRender"/>
	<se:dataTableFilterRow>
		<se:dataTableFilterDatepicker id="search_date"/>
		<se:dataTableFilterText id="search_deptName"/>
		<se:dataTableFilterSelect id="search_status" list="statuses" listKey="key" listValue="value"/>
	</se:dataTableFilterRow>
</se:dataTable>
--%>
<se:dataTableFnRender list="statuses" functionName="deptStatusRender" listKey="key" listValue="value"/>
</s:form>
<script type="text/javascript">
	function deptStatusRender2(oObj,index){
		if(oObj.aData[index]=='A')
          	return 'Approved';
      	else
          	return oObj.aData[4];
	}

	$("#deptModal2").theoneDialog({
		title:"Department Listing"
	});

	function deptAutocompleteOnSelect(value){
		//alert("on select");
		// set the hidden value with id
		$("#user\\.deptId").val(value);
	}
	function deptAutocompleteOnUnselect(){
		//alert("on unSelect");
		// clear the hidden value
		$("#user\\.deptId").val("");
	}
</script>
<se:dialog id="deptModal" title="%{getText('title.dept_list')}">
	<table width="100%">
		<tr>
			<td>
				<table width="100%">
					<tr>
						<td>
							<se:dataTable id="deptDatagrid" list="depts" idTr="true">
								<se:dataTableColumn label="Dept Id[Hidden]" propertyName="deptId" visible="false"/>
								<se:dataTableColumn key="dept" propertyName="deptName"/>
								<se:dataTableColumn key="dept.deptDesc" propertyName="deptDesc"/>
								<se:dataTableColumn key="status" propertyName="status" />
								<se:dataTableFilterRow>
									<se:dataTableFilterDatepicker id="search_date"/>
									<se:dataTableFilterText id="search_deptName"/>
									<se:dataTableFilterSelect id="search_status" list="statuses" listKey="key" listValue="value"/>
								</se:dataTableFilterRow>
							</se:dataTable>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</se:dialog>
</fieldset>
</body>
</html>