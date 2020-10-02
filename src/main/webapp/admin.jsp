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

<div class="container admin">
    <div class="container-fluid">
        <%@include file="components/message.jsp"%>
    </div>
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
    <div class="row mt-3">
        <%--first col--%>
        <div class="col-md-6">
            <div class="card" data-toggle="modal" data-target="#add-category-modal">
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
            <div class="card" data-toggle="modal" data-target="#productModal">
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

<%--Start Modal--%>
<div class="modal fade" id="add-category-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header custom-bg text-white">
                <h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="ProductOperationServlet" method="post">
                    <input type="hidden" name="operation" value="addCategory">
                    <div class="form-group">
                        <input type="text" class="form-control" name="catTitle" placeholder="Enter category title"
                               required>
                    </div>
                    <div class="form-group">
                        <textarea placeholder="Enter category description" class="form-control" name="catDisc" style="height: 250px;">
                        </textarea>
                    </div>
                    <div class="container text-center">
                        <button class="btn btn-success" type="submit">Add Category</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<%--Ended Modal--%>

<%--Modal for add product--%>
<div class="modal fade" id="productModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header text-center">
                <h5 class="modal-title" id="exampleModalLabel">Fill Product detail</h5>
            </div>
            <div class="modal-body">
                <form action="#">
                    <div class="form-group">
                        <input type="text" class="form-control" name="addProduct" required placeholder="Enter the product name">
                    </div>

                    <div class="form-group">
                        <textarea name="productDisc" class="form-control" style="height: 200px;"
                                  placeholder="Enter the description"></textarea>
                    </div>
                    <div class="container text-center">
                        <button type="button" class="btn btn-primary">Add</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<%--Modal ended--%>
</body>
</html>

