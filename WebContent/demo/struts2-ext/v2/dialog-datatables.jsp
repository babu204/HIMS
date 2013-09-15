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
var dob = null;
$(function(){
	$("#btnDeptModal").click(function(event){
		$("#deptModal").dialog('open');
	});
});
</script>
<se:view>
<s:form>
<se:buttonRow>
	<input type="button" id="btnDeptModal" value="Open"/> 
</se:buttonRow>
</s:form>
<se:dialog id="deptModal" title="%{getText('title.dept_list')}" width="600">
	<table width="100%">
		<tr>
			<td>
				<table width="100%">
					<tr>
						<td>
							<s:url id="deptListingUrl" action="deptListing" namespace="/app/master" />
							<se:dataTable id="deptDatagrid" sAjaxSource="%{deptListingUrl}" list="depts" idTr="true">
								<se:dataTableColumn label="Dept Id[Hidden]" propertyName="deptId" visible="false"/>
								<se:dataTableColumn key="dept" propertyName="deptName"/>
								<se:dataTableColumn key="dept.deptDesc" propertyName="deptDesc"/>
								<se:dataTableColumn key="status" propertyName="status" fnRender="deptStatusRender"/>
								<se:dataTableFilterRow>
									<se:dataTableFilterDatepicker id="search_date"/>
									<se:dataTableFilterText id="search_deptDesc"/>
									<se:dataTableFilterSelect id="search_status" list="statuses" listKey="key" listValue="value"/>
								</se:dataTableFilterRow>
							</se:dataTable>
							<se:dataTableFnRender list="statuses" functionName="deptStatusRender" listKey="key" listValue="value"/>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</se:dialog>
</se:view>
</body>
</html>