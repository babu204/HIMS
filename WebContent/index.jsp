<!-- <META HTTP-EQUIV="Refresh" CONTENT="0;URL=welcomeLink.action"> -->
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Login</title>
<link href="<c:url value="/scripts/loginscreensjs/normalize.css"/>"
	rel="stylesheet">
<link href="<c:url value="/scripts/loginscreensjs/style.css"/>"
	rel="stylesheet">
</head>
<body>
	<section class="loginform cf">

		<s:form action="loginSuccessLink" method='post' accept-charset="utf-8">
			<ul>
				<li><label for="userName">User Name</label> <input type="email"
					name="userName" placeholder="Enter your email id" required>
				</li>
				<li><label for="passWord">Password</label> <input
					type="password" name="passWord" placeholder="passWord" required></li>
				<li><input type="submit" value="Login"></li>
			</ul>
			<ul>
				<li><font color="red"><s:actionerror /> <s:actionmessage /></font></li>
			</ul>
			<s:token></s:token>
		</s:form>
	</section>


</body>
</html>