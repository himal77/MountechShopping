<%@ page import="com.mountech.mycart.helper.FactoryProvider" %>
<%@ page import="com.mountech.mycart.dao.ProductDAO" %>
<%@ page import="com.mountech.mycart.entities.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="com.mountech.mycart.dao.CategoryDAO" %>
<%@ page import="com.mountech.mycart.entities.Category" %>
<html>
<head>
    <title>MyCart</title>
    <%@include file="components/common_css_js.jsp" %>
</head>

<body>
<%@include file="components/navbar.jsp" %>

<div class="row container mt-3 mx-2">
    <%
        ProductDAO productDAO = new ProductDAO(FactoryProvider.getFactory());
        List<Product> productList = productDAO.getProductList();

        CategoryDAO categoryDAO = new CategoryDAO(FactoryProvider.getFactory());
        List<Category> categoryList = categoryDAO.getCategoryList();
    %>
    <%--show categories--%>
    <div class="col-md-2">
        <%for(Category c: categoryList){%>
        <%=c.getCategoryName()%><br>
        <%}%>
    </div>

    <%--show products--%>
    <div class="col-md-8">
        <%for(Product p: productList){%>
            <%=p.getpPhoto()%><br>
            <%=p.getpName()%><br><br>
        <%}%>
    </div>

</div>
</body>
</html>
