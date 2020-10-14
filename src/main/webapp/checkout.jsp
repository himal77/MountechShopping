<%
    User user = (User)session.getAttribute("current-user");
    if(user == null){
        session.setAttribute("message", "you are not registered user");
        response.sendRedirect("login.jsp");
        return;
    }
%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Checkout</title>
    <%@include file="components/common_css_js.jsp" %>
    <%@include file="components/navbar.jsp" %>
</head>

<body>
<div class="container-fluid">
    <div class="row">

        <%--To show data of card--%>
        <div class="col-md-6">
            <div class="card">
                <div class="card-body">

                    <h3 class="text-center mb-5">Your items</h3>
                    <div class="cart-body">

                    </div>
                </div>
            </div>
        </div>

        <%--To show form details--%>
        <div class="col-md-6">
            <div class="card">
                <div class="card-body">
                    <h3 class="text-center mb-5">Enter your delivery address</h3>
                    <form action="#">

                        <div class="form-group">
                            <label for="exampleInputEmail1">Email address</label>
                            <input type="email" value="<%=user.getUserEmail()%>" class="form-control" id="exampleInputEmail1"
                                   aria-describedby="emailHelp">
                        </div>

                        <div class="form-group">
                            <label for="name">Name</label>
                            <input type="text" value="<%=user.getUserName()%>" class="form-control" id="name">
                        </div>

                        <div class="form-group">
                            <label for="address">address</label>
                            <textarea class="form-control" name="address" id="address"
                                      placeholder="Enter your address"><%=user.getUserAddress()%></textarea>
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary">Order now</button>
                          <button type="button" class="btn btn-primary"><a href="index.jsp" class="btn-secondary">continue shopping</a></button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

    </div>
</div>

</body>
<%@include file="components/common_modals.jsp" %>
</html>
