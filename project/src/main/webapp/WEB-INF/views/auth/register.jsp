<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register Patient</title>
</head>
<body>
<h2>Register Patient</h2>
<form method="post" action="${pageContext.request.contextPath}/register">
    First Name: <input type="text" name="firstName" ><br><br>
    Last Name: <input type="text" name="lastName" ><br><br>
    Email: <input type="text" name="email" ><br><br>
    Password: <input type="password" name="password" ><br><br>
    Weight: <input type="number" step="0.01" name="weight"><br><br>
    Height: <input type="number" step="0.01" name="height"><br><br>
    <input type="submit" value="Register">
</form>
</body>
</html>
