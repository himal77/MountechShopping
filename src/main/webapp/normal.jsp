<%@ page import="com.mountech.mycart.entities.User" %>
<%
    User user = (User)session.getAttribute("current-user");
    if(user.getUserType() == null){
        session.setAttribute("message", "you are not registered user");
        response.sendRedirect("login.jsp");
        return;
    } else if (user.getUserType().equals("admin")) {
        session.setAttribute("message", "you are admin cannot login with normal user");
        response.sendRedirect("login.jsp");
        return;
    }
%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="components/common_css_js.jsp"%>
<html>
<head>
    <title>Normal</title>
    <%@include file="components/common_css_js.jsp"%>
</head>
<body>
<%@include file="components/navbar.jsp"%>
This is normal user panel
</body>
</html>
