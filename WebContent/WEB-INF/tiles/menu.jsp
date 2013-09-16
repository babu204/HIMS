<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
<head>

</head>
<body>

	<div title="Tree Menu">
		<ul id="tt" class="easyui-tree">
			<li><span>Menu 1</span>
				<ul>
					<li><span>Sub MENU</span>
						<ul>
							<li><span><a href="<s:url action="friendsLink"/>">Friends</a></span></li>
							<li><span><a href="<s:url action="officeLink"/>">The
										Office</a></span></li>
							<li><span>File 13</span></li>
						</ul></li>
					<li><span>File 2</span></li>
					<li><span>File 3</span></li>
				</ul></li>
			<li><span>MENU 2</span></li>
		</ul>

	</div>

</body>
</html>
