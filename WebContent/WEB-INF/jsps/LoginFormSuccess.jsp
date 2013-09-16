<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
	$(function() {
		 $('#dgUserListing').datagrid({
	         striped:true,
	         selectOnCheck: false,
	         checkOnSelect: false,
	         url:'<s:url action="userListingAction"/>',
	         nowrap:false,
	         showFooter:true,
	         columns:[[ 
	             {field:'id',title:'Id',width:200},
	             {field:'userName',title:'User Name',width:150},
	             
	         ]],
	         onBeforeLoad:function(param){
	             param.userName = '';
	         }
		 });
	});
	
</script>


<div title="User Listing">


	<div class="portlet">
		<div class="portlet-header">
			<s:property value="getText('User Listing')" />
		</div>
		<div class="portlet-content">

			<table id="dgUserListing"
				style="width: 1250px; height: 200px"
				data-options="iconCls:'icon-list', idField:'id'"
				title="User Listing" iconCls="icon-search"
				rownumbers="true" pagination="true"></table>
		</div>
	</div>
</div>