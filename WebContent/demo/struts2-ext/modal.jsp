<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.theone.com.my/struts2" prefix="so"%>
<%@ taglib uri="http://www.online1-my.com/online1/struts2-ext"
	prefix="se"%>

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
		<fieldset>
			<legend>
				Test Form
			</legend>
			<script type="text/javascript">
	var dob = null;
	$(function() {
		$("#btnOpenDept").click(function(event) {
			$("#deptModal").dialog('open');
		});
	});
</script>
			<form id="component" name="component"
				action="/exam/demo/struts2-ext/component.action" method="post">

				<table>

					<tr>
						<td colspan="3">
							<div align="center">
								<input type="button" id="btnOpenDept" value="open">
							</div>
						</td>
						<td></td>
					</tr>
				</table>

				<script type="text/javascript">
	function deptStatusRender(oObj, index) {
		if (oObj.aData[index] == '')
			return 'All';
		if (oObj.aData[index] == 'A')
			return 'Approved';
		if (oObj.aData[index] == 'D')
			return 'Deleted';
		else
			return oObj.aData[index];
	}
</script>
			</form>


			<script type="text/javascript">
	function deptStatusRender2(oObj, index) {
		if (oObj.aData[index] == 'A')
			return 'Approved';
		else
			return oObj.aData[4];
	}

	$("#deptModal2").theoneDialog( {
		title : "Department Listing"
	});

	function deptAutocompleteOnSelect(value) {
		//alert("on select");
		// set the hidden value with id
		$("#user\\.deptId").val(value);
	}
	function deptAutocompleteOnUnselect() {
		//alert("on unSelect");
		// clear the hidden value
		$("#user\\.deptId").val("");
	}
</script>
			<div id="deptModal" title="Department Listing">
				<table width="100%">
					<tr>
						<td>
							<table width="100%">
								<tr>
									<td>
										<table class="display" id="deptDatagrid" border="0"
											width="100%">
											<thead>
												<tr>
													<th>
														Dept Id[Hidden]
													</th>
													<th>
														Department
													</th>

													<th>
														Description
													</th>
													<th>
														Status
													</th>
												</tr>
												<tr>

													<td>
														<input type="text" name="" size="10" id="search_date" forIndex="1"
															class="search_init" />
													</td>
													<td>

														<input type="text" name="" size="10" id="search_deptName" forIndex="2"
															class="search_init" />
													</td>

													<td>
														<select name="" id="search_status" class="search_init" forIndex="3">
															<option value="">
																All
															</option>
															<option value="A">
																Approved
															</option>
															<option value="D">
																Deleted
															</option>


														</select>
													</td>


												</tr>
											</thead>
											<%-- 
											<tbody>
												<tr>
													<td>
														1
													</td>
													<td>
														IT DEPT
													</td>
													<td>
														INFORMATION TECHNOLOGY
													</td>
													<td>
														A
													</td>

												</tr>
												<tr>
													<td>
														2
													</td>
													<td>
														TECH DEPT
													</td>
													<td>
														TECHNICAL DEPARTMENT
													</td>
													<td>
														A
													</td>
												</tr>
												<tr>
													<td>
														3
													</td>

													<td>
														HUMAN RESOURCE
													</td>
													<td></td>
													<td>
														A
													</td>
												</tr>
												<tr>
													<td>
														4
													</td>
													<td>
														FINANCE
													</td>
													<td></td>

													<td>
														A
													</td>
												</tr>
												<tr>
													<td>
														5
													</td>
													<td>
														FACTORY
													</td>
													<td></td>
													<td>
														A
													</td>
												</tr>

												<tr>
													<td>
														6
													</td>
													<td>
														SALES DEPT
													</td>
													<td></td>
													<td>
														A
													</td>
												</tr>
												<tr>
													<td>
														7
													</td>

													<td>
														MANAGEMENT
													</td>
													<td></td>
													<td>
														A
													</td>
												</tr>
												<tr>
													<td>
														8
													</td>
													<td>
														SERVICE DEPARTMENT
													</td>
													<td></td>

													<td>
														A
													</td>
												</tr>
												<tr>
													<td>
														9
													</td>
													<td>
														RECEPTION
													</td>
													<td></td>
													<td>
														A
													</td>
												</tr>

												<tr>
													<td>
														10
													</td>
													<td>
														PROCUREMENT
													</td>
													<td>
														PROCUREMENT DEPT
													</td>
													<td>
														A
													</td>
												</tr>
												<tr>
													<td>
														11
													</td>

													<td>
														WAREHOUSE
													</td>
													<td></td>
													<td>
														A
													</td>
												</tr>
												<tr>
													<td>
														12
													</td>
													<td>
														OPERATION
													</td>
													<td></td>

													<td>
														A
													</td>
												</tr>
												<tr>
													<td>
														13
													</td>
													<td>
														HELP DESK
													</td>
													<td></td>
													<td>
														A
													</td>
												</tr>

												<tr>
													<td>
														14
													</td>
													<td>
														SERVICE AFTER SALES DEPT
													</td>
													<td></td>
													<td>
														A
													</td>
												</tr>
												<tr>
													<td>
														15
													</td>

													<td>
														LIEW
													</td>
													<td>
														OOOOOO
													</td>
													<td>
														A
													</td>
												</tr>
												<tr>
													<td>
														16
													</td>
													<td>
														RESEARCH &amp; DEVELOPMENT
													</td>

													<td>
														R&amp;D
													</td>
													<td>
														A
													</td>
												</tr>
											</tbody>
											--%>
										</table>
									</td>
								</tr>
							</table>

						</td>
					</tr>
				</table>
			</div>
			<script type="text/javascript">
	$(function() {
		var options_search_date = {};
		$("#search_date").theoneDatepicker(options_search_date);
	}); // end $(function())
</script>
			<script type="text/javascript">
	$(function() {
		var options_deptDatagrid = {};
		options_deptDatagrid.idTr = "true";
		options_deptDatagrid.bServerSide = "true";
		options_deptDatagrid.sAjaxSource= "<c:url value="/app/master/deptListing.action"/>";

		var options_deptDatagrid_aoColumns = [ {
			"bVisible" : false,
			"sName" : "deptId"
		}, {
			"bVisible" : true,
			"sName" : "deptName"
		}, {
			"bVisible" : true,
			"sName" : "deptDesc"
		}, {
			"bVisible" : true,
			"sName" : "status"
		} ];
		options_deptDatagrid.aoColumns = options_deptDatagrid_aoColumns;

		$("#deptDatagrid").theoneDataTable(options_deptDatagrid);
	}); // end $(function())
</script>
			<script type="text/javascript">
	$(function() {
		var options_deptModal = {};
		options_deptModal.title = "Department Listing";
		$("#deptModal").theoneDialog(options_deptModal);
	}); // end $(function())
</script>
		</fieldset>


	</body>
</html>