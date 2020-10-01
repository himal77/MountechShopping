<%@ page import="com.mountech.mycart.entities.User" %>
<%
    User user = (User) session.getAttribute("current-user");

    if (user == null) {

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
    <title>Admin Panel</title>
    <%@include file="components/common_css_js.jsp" %>
</head>
<body>
<%@include file="components/navbar.jsp" %>

<div class="container">

    <%--Upper row--%>
    <div class="row mt-3">
        <%--First col--%>
        <div class="col-md-4">
            <%--first box--%>
            <div class="card text-center">
                <div class="card-body">
                    <div class="container">
                        <img class="img-fluid rounded-circle" style="max-width: 100px;" src="image/users.png"/>
                    </div>
                    <h1>123</h1>
                    <h1 class="text-uppercase text-muted">Users</h1>
                </div>
            </div>
        </div>

        <%--Second col--%>
        <div class="col-md-4">
            <%--second box--%>
            <div class="card text-center">
                <div class="card-body">
                    <div class="container">
                        <img class="img-fluid rounded-circle" style="max-width: 100px;" src="image/product.png"/>
                    </div>
                    <h1>123</h1>
                    <h1 class="text-uppercase text-muted">Products</h1>
                </div>
            </div>
        </div>

        <%--Third col--%>
        <div class="col-md-4">
            <%--thrid box--%>
            <div class="card text-center">
                <div class="card-body">
                    <div class="container">
                        <img style="max-width: 100px;" class="img-fluid rounded-bottom" src="image/category.png"/>
                    </div>
                    <h1>123</h1>
                    <h1 class="text-uppercase text-muted">Categories</h1>
                </div>
            </div>
        </div>
    </div>

    <%--Lower Row--%>
    <div class="row">
        <%--first col--%>
        <div class="col-md-6">
            <div class="card">
                <div class="card-body text-center">
                    <div class="container">
                        <img style="max-width: 100px;" class="img-fluid rounded-circle" src="image/categoryPlus.png"/>
                    </div>
                    <h1 class="text-uppercase">Add Category</h1>
                </div>
            </div>
        </div>

        <%--Second col--%>
        <div class="col-md-6">
            <div class="card">
                <div class="card-body text-center">
                    <div class="container">
                        <img src="image/productPlus.png" style="max-width: 100px;" class="rounded-circle img-fluid"/>
                    </div>
                    <h1 class="text-uppercase">Add Product</h1>
                </div>
            </div>
        </div>

    </div>
</div>

</body>
</html>

