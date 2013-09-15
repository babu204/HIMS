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
$(function(){
	var validate = $("#testForm").theoneValidate({
		// debug : true, // use for debuging, when submit button click, it not submit to server
		rules : {
			username : {
				required : true,
				minlength : 2
			},
			inputDate : {
				required : true,
				dateITA : true
			},
			online1Date : {
				required : true,
				dateITA : true
			},
			inputNumber : {
				required : true,
				notAllowNegative : true,
				digits : true
			},
			theoneNumber : {
				required : true,
				number : true
			},
			"my.theoneNumber" : {
				required : true,
				number : true
			}
		},
		submitHandler: function(form) {
			alert("submitted!");

			// submit the form
			form.submit();
		}
	}
	);

	$("#btnVerDate").click(function (event){
		alert($("#inputDate").datepicker("getDate"));

		var sdate = $("#inputDate").val();
		alert("sdate = " + sdate);
	}); 

	// prefer to use theoneDatepicker
	$("#inputDate").datepicker({
		onSelect : function(dateText, inst) {
		// validate the input
		$(this).valid();
		}
	});

	$("#theoneNumber").theoneNumber();
	$("#my\\.theoneNumber").theoneNumber();

	// prefer to use theoneNumber
	$("#inputNumber").numeric();
	
	$("#online1Date").theoneDatepicker();

	// struts2
	$("#btnStruts2").click(function(event){
		alert("user[ = " + $("#users\\[").val());
		alert("users[0] = " + $("#users\\[0\\]").val());
		alert("users[0].username = " + $("#users\\[0\\]\\.username").val());
	});
});
</script>
<title>Testing JQuery</title>
</head>
<body>

<fieldset>
<form id="testForm">
<table>
	<tr>
		<td>Username</td>
		<td>:</td>
		<td><input name="username" id="username" class="inputText" /></td>
		<td></td>
	</tr>
	<tr>
		<td>Disable / Readonly field</td>
		<td>:</td>
		<td><input name="disableField" id="disableField"
			class="inputTextDisable" readonly="readonly" value="Readonly haha~" /></td>
		<td></td>
	</tr>
	<tr>
		<td>Date</td>
		<td>:</td>
		<td><input name="inputDate" id="inputDate" class="inputText" /></td>
		<td></td>
	</tr>
	<tr>
		<td>Date(online1)</td>
		<td>:</td>
		<td><input name="online1Date" id="online1Date" class="inputText" /></td>
		<td></td>
	</tr>
	<tr>
		<td>Number</td>
		<td>:</td>
		<td><input name="inputNumber" id="inputNumber"
			class="inputNumber" /></td>
		<td></td>
	</tr>
	<tr>
		<td>Number(Online1)</td>
		<td>:</td>
		<td><input name="theoneNumber" id="theoneNumber"
			class="inputNumber" /></td>
		<td></td>
	</tr>
	<tr>
		<td>Number 2(Online1) [id is my.theoneNumber]</td>
		<td>:</td>
		<td><input name="my.theoneNumber" id="my.theoneNumber"
			class="inputNumber" /></td>
		<td></td>
	</tr>
	<tr>
		<td colspan="4"><input type="button" name="btnVerDate"
			id="btnVerDate" value="Verify Date" /> <input name="signup"
			type="submit" /></td>
	</tr>
</table>
</form>
</fieldset>
<br />
<br />

<fieldset><legend>SimpleModal</legend> <script
	type="text/javascript">
$(function(){
	// pop up
	$("#modalLink ,  #btnModal").click(function(event){
		event.preventDefault();
		$("#modalPopup").modal({
			containerCss: {
		    height: 200,
		    width: 300
		  }
		});
	});
});
</script>
<p>Click <a id="modalLink" href="#">here</a> or <input id="btnModal"
	type="button" value="pop up" /> for Modal Dialog</p>
<div id="modalPopup" style="display: none">Just to say hi!!!</div>
</fieldset>

<br />
<fieldset title="Test on Struts2 collection input">
<p>Test on Struts2 collection input. Assume you have a collection
with name <b>users</b></p>
<table>
	<tr>
		<td>Text [id is users[ ]</td>
		<td>:</td>
		<td><input type="text" name="users[" id="users["
			value="users[xxx]" /></td>
	</tr>
	<tr>
		<td>Text [id is users[0]]</td>
		<td>:</td>
		<td><input type="text" name="users[0]" id="users[0]"
			value="MRAS1" /></td>
	</tr>
	<tr>
		<td>Text [id is users[0].username]</td>
		<td>:</td>
		<td><input type="text" name="users[0].username"
			id="users[0].username" value="MRAS2" /></td>
	</tr>
	<tr>
		<td colspan="3"><input type="button" name="btnStruts2"
			id="btnStruts2" value="Get Username Value" /></td>
	</tr>
</table>
</fieldset>
<br />
<br />
<fieldset><legend>Datatable</legend> <script
	type="text/javascript">
$(function(){
	$("#datatable").dataTable();
});
</script>
<p>When using Datatable, the table must set class to <b>display</b>,
if not, the table will not display properly</p>
<table class="display" id="datatable" border="1" width="100%">
	<thead>
		<tr>
			<th style="width: 300px">Username</th>
			<th style="width: 300px">Full Name</th>
			<th style="width: 300px">Email</th>
			<th style="width: 300px">Status</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>admin</td>
			<td>Eng kam Hon</td>
			<td>jason@xx.com</td>
			<td>active</td>
		</tr>
		<tr>
			<td>admin2</td>
			<td>Eng kam Hon2</td>
			<td>jason@xx.com2</td>
			<td>active2</td>
		</tr>
	</tbody>
</table>
</fieldset>
<br />
<br />
<fieldset><legend>Checking on User Login Status</legend> 
<script type="text/javascript">
$(function(){
	$("#btnGetLoginStatus").click(function(event){

		$.theoneUtil.getLoginStatus(function(status){
			if(status){
				alert("user already login, status = " + status);
			}else{
				alert("user is not login yet, status = " + status);
			}
		});
	});

	$("#btnDoAjax").click(function(event){
		$.theoneUtil.checkUserLogin(function(){
			alert("send ajax request here.....");
		});
	});
});
</script>
<p>Click the 'Get Login Status' button to get status.</p>
<p>'Do Ajax' button is stimulate your ajax function. It used for
checking User Login Status before do ajax function.</p>
<p>For example, the remote datatables pagination. Before send ajax
request for pagination, you need to add checkUserLogin for checking
user. If not login, screen will auto redirect to login screen.</p>
<input id="btnGetLoginStatus" type="button" value="Get Login Status" />
<input id="btnDoAjax" type="button" value="Do Ajax" />
</fieldset>

<br/>
<fieldset><legend>Jquery UI Dialog</legend>
<script type="text/javascript">
$(function(){
	$("#btnAlert").click(function(event){
		messageBox.alert("Just to say hi");
	});

	$("#modalUI").theoneDialog({title:"Testing only"});
	$("#btnModalUI").click(function(event){
		$("#modalUI").dialog('open');
	});
	$("#datepickerModalUI").theoneDatepicker();
});
</script>
<input type="button" value="alert" id="btnAlert"/><br/>
<input type="button" value="Popup" id="btnModalUI"/>
<div id="modalUI">
	<input type="text" />
	<input type="text" id="datepickerModalUI"/>
</div>
</fieldset>

<%-- 
<fieldset>
<legend>Checkbox Tree from jsTree</legend>
<script type="text/javascript">
$(function(){
	$("#treeDemo").tree(
			{
				ui : {
	            theme_name : "checkbox"
	            },

	        rules : {
	            clickable : "all",
	            multiple : "on"
	            },
	            
	        callback : {
	            onchange : function (NODE, TREE_OBJ) { 
	              var $this = $(NODE).is("li") ? $(NODE) : $(NODE).parent();
	              if($this.children("a.unchecked").size() == 0) {
	                TREE_OBJ.container.find("a").addClass("unchecked");
	              }
	              $this.children("a").removeClass("clicked");
	              if($this.children("a").hasClass("checked")) {
	                $this.find("li").andSelf().children("a").removeClass("checked").removeClass("undetermined").addClass("unchecked");
	                var state = 0;
	              }
	              else {
	                $this.find("li").andSelf().children("a").removeClass("unchecked").removeClass("undetermined").addClass("checked");
	                var state = 1;
	              }
	              $this.parents("li").each(function () { 
	                if(state == 1) {
	                  if($(this).find("a.unchecked, a.undetermined").size() - 1 > 0) {
	                    $(this).parents("li").andSelf().children("a").removeClass("unchecked").removeClass("checked").addClass("undetermined");
	                    return false;
	                  }
	                  else $(this).children("a").removeClass("unchecked").removeClass("undetermined").addClass("checked");
	                }
	                else {
	                  if($(this).find("a.checked, a.undetermined").size() - 1 > 0) {
	                    $(this).parents("li").andSelf().children("a").removeClass("unchecked").removeClass("checked").addClass("undetermined");
	                    return false;
	                  }
	                  else $(this).children("a").removeClass("checked").removeClass("undetermined").addClass("unchecked");
	                }
	              });

	                var ids = [];
	                $("a.checked").each(function () { 
	                if($(this).attr("entry_type") == "patch")    //only keep the IDs for patches
	                ids.push(this.id);
	                alert($(this).attr("entry_type"));
	                alert($(this).attr("id")); 
	                });
	                ids.join(",");  //turn the array into a comma-separated list
	                //$("#compat_list").val(ids);    //write the list to a hidden form field
	                alert("ids = " + ids);
	                }
	            }
			});
});
</script>
<table>
	<tr>
		<td>
			<div id="treeDemo" class="demo"> 
	<ul> 
		<li id="phtml_1" entry_type="patch" class="open"><a id="phtml_11" entry_type="patch" href="#">Root node 1</a> 
			<ul> 
				<li id="phtml_2" entry_type="patch"><a id="phtml_12" entry_type="patch" href="#">helo icon</a></li> 
				<li id="phtml_3" entry_type="patch"><a id="phtml_13" entry_type="patch" href="#">Child node 2</a></li> 
				<li id="phtml_4" entry_type="patch"><a id="phtml_14" entry_type="patch" href="#">Some other child node 111</a></li> 
			</ul> 
		</li> 
		<li id="phtml_5"><a href="#">Root node 2</a></li> 
	</ul> 
</div> 
		</td>
	</tr>
</table>
</fieldset>

<br/>
<br/>

<fieldset>
<legend>Local Paging for jqGrid</legend>
<script type="text/javascript">
$(function(){
	$("#list").jqGrid({
		datatype: "local",
		height: 200,
	   	colNames:['Inv No','Date', 'Client', 'Amount','Tax','Total','Notes'],
	   	colModel:[
	   		{name:'id',index:'id', width:60, sorttype:"int"},
	   		{name:'invdate',index:'invdate', width:90, sorttype:"date"},
	   		{name:'name',index:'name', width:100},
	   		{name:'amount',index:'amount', width:80, align:"right",sorttype:"float"},
	   		{name:'tax',index:'tax', width:80, align:"right",sorttype:"float"},		
	   		{name:'total',index:'total', width:80,align:"right",sorttype:"float"},		
	   		{name:'note',index:'note', width:150, sortable:false}		
	   	],
	   	imgpath: gridimgpath,
	   	multiselect: true,
	   	caption: "Manipulating Array Data"
	});

	var mydata = [
	      		{id:"1",invdate:"2007-10-01",name:"test",note:"note",amount:"200.00",tax:"10.00",total:"210.00"},
	      		{id:"2",invdate:"2007-10-02",name:"test2",note:"note2",amount:"300.00",tax:"20.00",total:"320.00"},
	      		{id:"3",invdate:"2007-09-01",name:"test3",note:"note3",amount:"400.00",tax:"30.00",total:"430.00"},
	      		{id:"4",invdate:"2007-10-04",name:"test",note:"note",amount:"200.00",tax:"10.00",total:"210.00"},
	      		{id:"5",invdate:"2007-10-05",name:"test2",note:"note2",amount:"300.00",tax:"20.00",total:"320.00"},
	      		{id:"6",invdate:"2007-09-06",name:"test3",note:"note3",amount:"400.00",tax:"30.00",total:"430.00"},
	      		{id:"7",invdate:"2007-10-04",name:"test",note:"note",amount:"200.00",tax:"10.00",total:"210.00"},
	      		{id:"8",invdate:"2007-10-03",name:"test2",note:"note2",amount:"300.00",tax:"20.00",total:"320.00"},
	      		{id:"9",invdate:"2007-09-01",name:"test3",note:"note3",amount:"400.00",tax:"30.00",total:"430.00"}
	      		];
	      for(var i=0;i<=mydata.length;i++)
	      	jQuery("#list").addRowData(i+1,mydata[i]);
	      	
});
</script>
<table>
	<tr>
		<td>
		<table id="list" class="scroll"></table> 
		<div id="pager" class="scroll" style="text-align:center;"></div> 
		</td>
	</tr>
</table>
</fieldset>
<br/>
<br/>
<fieldset>
<legend>Remote Paging for jqGrid(JSON)</legend>
<script type="text/javascript">
$(function(){
	jQuery("#list2").jqGrid({
		jsonReader : {
		 root: "records",
	     page: "currentPage",
	     total: "totalPages",
	     records: "totalRecords",
	   	 repeatitems: false,
		 id: "userId",
		 cell: ""
	   	},
	   	url:'<c:url value="/app/user/userList_json.action"/>',
		datatype: "json",
	   	colNames:['UserID','Username', 'Full Name', 'Email'],
	   	colModel:[
	   		{name:'userId',index:'userId', width:55},
	   		{name:'username',index:'username', width:90},
	   		{name:'fullname',index:'fullname', width:100},
	   		{name:'email',index:'email', width:150},
	   		/*
	   		,
	   		{name:'amount',index:'amount', width:80, align:"right"},
	   		{name:'tax',index:'tax', width:80, align:"right"},		
	   		{name:'total',index:'total', width:80,align:"right"},		
	   		{name:'note',index:'note', width:150, sortable:false}
	   		*/		
	   	],
	   	rowNum:10,
	   	autowidth:true,
	   	rownumbers:true,
	   	rowList:[10,20,30],
	   	imgpath: gridimgpath,
	   	pager: jQuery('#pager2'),
	   	sortname: 'userId',
	   	multiselect: true,
	    //viewrecords: true,
	    sortorder: "asc",
	    caption:"JSON Example"
	}).navGrid('#pager2',{edit:false,add:false,del:false},
	{}, // edit options 
	{}, // add options 
	{}, //del options 
	{multipleSearch:true} // search options 
	);	
});
</script>
<table border="1" width="90%">
	<tr>
		<td width="100%">
		<table id="list2" class="scroll" cellpadding="0" cellspacing="0"></table>
		<div id="pager2" class="scroll" style="text-align:center;"></div>
		</td>
	</tr>
</table>
</fieldset>

--%>

</body>
</html>