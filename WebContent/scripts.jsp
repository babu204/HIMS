<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%--<meta name="viewport" content="width=device-width, initial-scale=1.0">--%>

<link href="<c:url value="/scripts/bootstrap/css/bootstrap.css"/>" rel="stylesheet">
<link href="<c:url value="/scripts/bootstrap/css/bootstrap-responsive.min.css"/>" rel="stylesheet">
<link href="<c:url value="/scripts/bootstrap/css/docs.css"/>" rel="stylesheet">
<link href="<c:url value="/scripts/bootstrap/js/google-code-prettify/prettify.css"/>" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="<c:url value="/scripts/timeentry/jquery.timeentry.css"/>" media="all">
<%--<link rel="StyleSheet" href="<c:url value="/css/common.css"/>" type="text/css">--%>

<link rel="stylesheet" type="text/css" href="<c:url value="/scripts/easyui/themes/gray/easyui.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/scripts/easyui/themes/icon.css"/>">
<link rel="stylesheet" href="<c:url value="/css/themes/"/>black-tie/jquery-ui-1.8.18.custom.css" type="text/css" id="jqueryui"/>
<%--<link rel="stylesheet" href="<s:url value="/css/themes/">/cupertino/jquery-ui-1.8.18.custom.css" type="text/css" id="jqueryui"/>--%>
<link rel="stylesheet" href="<c:url value="/css/collapsible-panel/collapsible-panel-style.css"/>" type="text/css" />
<link rel="stylesheet" href="<c:url value="/css/datatables/css/table.css"/>" type="text/css" />
<link rel="stylesheet" href="<c:url value="/css/validate/validate.css"/>" type="text/css" />
<%--<link rel="stylesheet" href="<c:url value="/css/fieldSet.css"/>" type="text/css" />--%>
<link rel="stylesheet" href="<c:url value="/css/jquery.checkboxtree.min.css"/>" type="text/css" />
<link rel="stylesheet" href="<c:url value="/css/jquery.treeview.css"/>" type="text/css" />
<link rel="stylesheet" href="<c:url value="/css/jgrowl/jquery.jgrowl.css"/>" type="text/css" />
<%--<link rel="stylesheet" href="<c:url value="/css/notification.css"/>" type="text/css" />--%>

<link rel="stylesheet" type="text/css" href="<c:url value="/css/template_sc/style.css"/>" media="all">
<link rel="stylesheet" type="text/css" href="<c:url value="/css/template_sc/member_style.css"/>" media="all">
<link rel="stylesheet" type="text/css" href="<c:url value="/css/template_sc/member/member.css"/>" media="all">
<link rel="stylesheet" type="text/css" href="<c:url value="/css/template_sc/button.css"/>" media="all">
<link rel="stylesheet" type="text/css" href="<c:url value="/scripts/timeentry/jquery.timeentry.css"/>" media="all">

<link rel="stylesheet" type="text/css" href="<c:url value="/scripts/jquery/jquery.countdown.package-1.6.3/jquery.countdown.css"/>">
<%--<script type="text/javascript" src="<c:url value="/scripts/bootstrap/js/bootstrap.min.js"/>"></script>--%>


<script type="text/javascript" src="<c:url value="/scripts/jquery/jquery-1.7.1.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/scripts/jquery/jquery.form.js"/>"></script>
<script type="text/javascript" src="<c:url value="/scripts/easyui/jquery.easyui.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/scripts/easyui/jquery.easyui.datagrid-detailview.js"/>"></script>
<script type="text/javascript" src="<c:url value="/scripts/easyui/jquery.easyui.datagrid-groupview.js"/>"></script>
<script type="text/javascript" src="<c:url value="/scripts/jquery/jquery-ui-1.8.18.custom.min.js"/>" ></script>
<script type="text/javascript" src="<c:url value="/scripts/jquery/jquery.dataTables.js"/>" ></script>
<script type="text/javascript" src="<c:url value="/scripts/jquery/FixedColumns.js"/>" ></script>
<script type="text/javascript" src="<c:url value="/scripts/jquery/jquery.maskedinput-1.2.2.min.js"/>" ></script>
<script type="text/javascript" src="<c:url value="/scripts/jquery/jquery.validate.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/scripts/jquery/jquery.validate.additional-methods.js"/>"></script>
<script type="text/javascript" src="<c:url value="/scripts/jquery/jquery.numeric.js"/>"></script>
<script type="text/javascript" src="<c:url value="/scripts/jquery/jquery.blockUI.js"/>"></script>
<script type="text/javascript" src="<c:url value="/scripts/jquery/autoNumeric-1.7.1.js"/>"></script>
<script type="text/javascript" src="<c:url value="/scripts/jquery/jquery.treeview.js"/>"></script>
<script type="text/javascript" src="<c:url value="/scripts/jquery/jquery.treeview.edit.js"/>"></script>
<script type="text/javascript" src="<c:url value="/scripts/jquery/jquery.treeview.async.js"/>"></script>
<script type="text/javascript" src="<c:url value="/scripts/jquery/jquery.checkboxtree.js"/>"></script>
<script type="text/javascript" src="<c:url value="/scripts/tiny_mce/tiny_mce_src.js"/>"></script>

<%--<script type="text/javascript" src="<c:url value="/scripts/bootstrap/js/bootstrap-transition.js"/>"></script>--%>
<script type="text/javascript" src="<c:url value="/scripts/bootstrap/js/bootstrap-alert.js"/>"></script>
<%--<script type="text/javascript" src="<c:url value="/scripts/bootstrap/js/bootstrap-modal.js"/>"></script>--%>
<%--<script type="text/javascript" src="<c:url value="/scripts/bootstrap/js/bootstrap-dropdown.js"/>"></script>--%>
<%--<script type="text/javascript" src="<c:url value="/scripts/bootstrap/js/bootstrap-scrollspy.js"/>"></script>--%>
<%--<script type="text/javascript" src="<c:url value="/scripts/bootstrap/js/bootstrap-tab.js"/>"></script>--%>
<%--<script type="text/javascript" src="<c:url value="/scripts/bootstrap/js/bootstrap-tooltip.js"/>"></script>--%>
<%--<script type="text/javascript" src="<c:url value="/scripts/bootstrap/js/bootstrap-popover.js"/>"></script>--%>
<%--<script type="text/javascript" src="<c:url value="/scripts/bootstrap/js/bootstrap-button.js"/>"></script>--%>
<%--<script type="text/javascript" src="<c:url value="/scripts/bootstrap/js/bootstrap-collapse.js"/>"></script>--%>
<%--<script type="text/javascript" src="<c:url value="/scripts/bootstrap/js/bootstrap-carousel.js"/>"></script>--%>
<%--<script type="text/javascript" src="<c:url value="/scripts/bootstrap/js/bootstrap-typeahead.js"/>"></script>--%>

<script type="text/javascript" src="<c:url value="/scripts/jquery/theone/jquery.theone.extend.js"/>" ></script>
<script type="text/javascript" src="<c:url value="/scripts/jquery/theone/jquery.theone.dataTables.extend.js"/>" ></script>
<script type="text/javascript" src="<c:url value="/scripts/jquery/theone/jquery.theone.fullCalendar.extend.js"/>" ></script>
<script type="text/javascript" src="<c:url value="/scripts/timepickr/jquery.utils.js"/>" ></script>
<script type="text/javascript" src="<c:url value="/scripts/timepickr/jquery.strings.js"/>" ></script>
<script type="text/javascript" src="<c:url value="/scripts/timepickr/jquery.anchorHandler.js"/>" ></script>
<script type="text/javascript" src="<c:url value="/scripts/timepickr/jquery.timepickr.js"/>" ></script>
<script type="text/javascript" src="<c:url value="/scripts/common.js"/>"></script>
<script type="text/javascript" src="<c:url value="/scripts/common-jquery-struts2.js"/>"></script>


<script type="text/javascript" src="<c:url value="/scripts/timeentry/jquery.timeentry.js"/>"></script>
<script type="text/javascript" src="<c:url value="/scripts/timeentry/jquery.timeentry.min.js"/>"></script>

<script type="text/javascript" src="<c:url value="/scripts/jquery/jquery.countdown.package-1.6.3/jquery.countdown.min.js"/>"></script>

<!-- Ext JS Library -->
<script type="text/javascript" src="<c:url value="/scripts/ext-js/ext-jquery-adapter.js"/>"></script>
<script type="text/javascript" src="<c:url value="/scripts/ext-js/ext-all.js"/>"></script>
<script type="text/javascript" src="<c:url value="/scripts/jquery/jquery.collapsible-v.2.1.3.js"/>"></script>
<script type="text/javascript" src="<c:url value="/scripts/jquery/jquery.jgrowl.js"/>"></script>

<%--<script type='text/javascript' src='<c:url value="/scripts/jquery/localization/"/><s:property value="getText('messages_cn')"/>'></script>--%>
<script type="text/javascript" src="<c:url value="/css/template_sc/custom_form_element.js"/>" ></script>

<script type="text/javascript">
//Ext.BLANK_IMAGE_URL = '<c:url value="/css/ext-js/images/default/s.gif"/>';
//Ext.QuickTips.init();

// init for checking user status
$.theoneUtil.loginStatusUrl = '<s:url action="loginStatus" namespace="/open/ajax/json"/>';
$.theoneUtil.loginUrl = '<s:url value="/open/login/loginFrame.jsp"/>';
$.ajaxSetup({ cache: false });
</script>