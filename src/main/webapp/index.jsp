<%@ page import="com.mountech.mycart.helper.FactoryProvider" %>
<html>
<body>
<h2>Hello World!</h2>
<h1>Creating session factory object</h1>
<%
    out.println(FactoryProvider.getFactory());
%>
</body>
</html>
