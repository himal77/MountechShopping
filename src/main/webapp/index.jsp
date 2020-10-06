<%@ page import="com.mountech.mycart.helper.FactoryProvider" %>
<%@ page import="com.mountech.mycart.dao.ProductDAO" %>
<%@ page import="com.mountech.mycart.entities.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="com.mountech.mycart.dao.CategoryDAO" %>
<%@ page import="com.mountech.mycart.entities.Category" %>
<%@ page import="com.mountech.mycart.helper.Helper" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>MyCart</title>
    <%@include file="components/common_css_js.jsp" %>
</head>

<body>
<%@include file="components/navbar.jsp" %>

<div class="row mt-3 mx-2">
    <%
        ProductDAO productDAO = new ProductDAO(FactoryProvider.getFactory());
        List<Product> productList = productDAO.getProductList();

        CategoryDAO categoryDAO = new CategoryDAO(FactoryProvider.getFactory());
        List<Category> categoryList = categoryDAO.getCategoryList();
    %>
    <%--show categories--%>
    <div class="col-md-2">
        <div class="list-group mt-4">
            <a href="#" class="list-group-item list-group-item-action active">
                Categories
            </a>
            <%for (Category c : categoryList) {%>
            <a href="#" class="list-group-item list-group-item-action"><%=c.getCategoryName()%>
            </a>
            <%}%>
        </div>
    </div>

    <%--show products--%>
    <div class="col-md-8">
        <div class="row mt-4">
            <div class="col-md-12">
                <div class="card-columns">

                    <%--Traversing products--%>
                    <%for(Product p: productList){%>
                        <div class="card">
                           <div class="container text-center">
                               <img src="image/products/<%=p.getpPhoto()%>" style="height: 150px; width: 200px;" class="card-img-top m-2" alt="...">
                           </div>
                            <div class="card-body">
                                <h5 class="card-title"><%=p.getpName()%></h5>
                                <p class="card-text"><%=Helper.get10Words(p.getpDesc())%></p>

                            </div>
                            <div class="card-footer text-center">
                                <button class="btn custom-bg text-white">Add to cart</button>
                                <button class="btn btn-outline-primary">&#8377;<%=p.getpPrice()%></button>
                            </div>
                        </div>
                    <%}%>

                </div>
            </div>
        </div>
    </div>

</div>
</body>
</html>
