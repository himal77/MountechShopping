<%@ page import="com.mountech.mycart.entities.User" %><%
    User user = (User) session.getAttribute("current-user");

    if(user == null) {

        session.setAttribute("message", "you are not logged in !! Login first");
        response.sendRedirect("login.jsp");
        session.invalidate();
        return;

    } else {
        if (user.getUserType().equals("normal")) {

            session.setAttribute("message", "you are not admin");
            response.sendRedirect("login.jsp");
            session.invalidate();
            return;

        }
    }
%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Panle</title>
    <%@include file="components/common_css_js.jsp"%>
</head>
<body>
<%@include file="components/navbar.jsp"%>
This is admin panel
</body>
</html>

