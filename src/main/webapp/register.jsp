<%--
  Created by IntelliJ IDEA.
  User: puri
  Date: 9/3/20
  Time: 12:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>New User Registraion</title>
    <%@include file="components/common_css_js.jsp" %>
</head>
<body>
<%@include file="components/navbar.jsp" %>
<div class="container-fluid">
<div class="row mt-3">
    <div class="col-md-4 offset-md-4">
        <div class="card">
            <%@include file="components/message.jsp"%>
            <div class="card-body px-5" style="background-color:#BBDEFB">
                <h3 class="text-center my-3">Sign up here</h3>
                <form action="RegisterServlet" method="post">
                    <div class="form-group">
                        <label for="name">User Name</label>
                        <input name="user_name" type="text" class="form-control" id="name" placeholder="Enter username"
                               aria-describedby="emailHelp">
                    </div>
                    <div class="form-group">
                        <label for="email">User Email</label>
                        <input name="user_email" type="email" class="form-control" id="email" placeholder="Enter user mail "
                               aria-describedby="emailHelp">
                    </div>

                    <div class="form-group">
                        <label for="password">User Password</label>
                        <input name="user_password" type="password" class="form-control" id="password" placeholder="Enter user password" "
                        aria-describedby="emailHelp">
                    </div>

                    <div class="form-group">
                        <label for="phone">User number</label>
                        <input name="user_phone" type="number" class="form-control" id="phone" placeholder="Enter user password" "
                        aria-describedby="emailHelp">
                    </div>
                    <div class="form-group">
                        <label for="address">User address</label>
                        <textarea name="user_address" style="height: 100px" class="form-control" id="address"
                                  placeholder="Enter your address"></textarea>
                    </div>

                    <div class="container text-center">
                        <button type="submit" class="btn btn-outline-success">Register</button>
                        <button type="reset" class="btn btn-outline-warning">Reset</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</div>

</body>
</html>
