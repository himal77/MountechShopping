
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <%@include file="components/common_css_js.jsp" %>
</head>
<body>
<%@include file="components/navbar.jsp" %>
<div class="container-fluid">
<div class="row mt-3">
    <div class="col-md-4 offset-md-4">
        <div class="card">
            <div class="card-body px-5" style="background-color:#BBDEFB">
                <h3 class="text-center my-3">Login</h3>
                <form action="LoginServlet" method="post">
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
                    <div class="container text-center">
                        <button class="btn btn-outline-success">Login</button>
                        <button class="btn btn-outline-warning">Reset</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</div>

</body>
</html>
