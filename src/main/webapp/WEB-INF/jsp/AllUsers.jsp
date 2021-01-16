<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page session="false"%>
<html>
<head>
<title>Show Employees</title>
</head>
<body>
	
	<h3 style="color: red;">Show All Users</h3>
	<ul>
		<c:forEach items="${userList}" var="user" >
			<li><strong>name:</strong> ${user.name} <strong>lastName:</strong> ${user.lastName} <strong>email:</strong> ${user.email} </li>
			
		</c:forEach>
	</ul>
</body>
</html>