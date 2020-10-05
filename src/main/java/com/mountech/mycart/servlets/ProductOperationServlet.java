package com.mountech.mycart.servlets;

import com.mountech.mycart.dao.CategoryDAO;
import com.mountech.mycart.dao.ProductDAO;
import com.mountech.mycart.entities.Category;
import com.mountech.mycart.entities.Product;
import com.mountech.mycart.helper.FactoryProvider;
import sun.misc.Cache;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@MultipartConfig
public class ProductOperationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String operation = request.getParameter("operation");

        if (operation.equals("addCategory")) {
            // Fetching category data
            String description = request.getParameter("catDisc");
            String title = request.getParameter("catTitle");

            Category category = new Category(title, description);

            // adding the category in database
            CategoryDAO categoryDAO = new CategoryDAO(FactoryProvider.getFactory());
            int catID = categoryDAO.saveCategory(category);
            HttpSession session = request.getSession();
            if (catID != 0)
                session.setAttribute("message", title + " saved successfully");
            else
                session.setAttribute("message", title + " error saving category");
            response.sendRedirect("admin.jsp");
            return;
        } else if (operation.equals("addProduct")) {

            String pName = request.getParameter("pName");
            double pPrice = Double.parseDouble((request.getParameter("pPrice")));
            double pDiscount = Double.parseDouble(request.getParameter("pDiscount"));
            int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
            String pDesc = request.getParameter("pDesc");
            int categoryId = Integer.parseInt(request.getParameter("catId"));
            String pPhoto = request.getParameter("pPhoto");

            Category category = new CategoryDAO(FactoryProvider.getFactory()).getCategory(categoryId);

            Product product = new Product(pName, pDesc, pPhoto, pDiscount, pPrice, pQuantity, category);

            ProductDAO productDAO = new ProductDAO(FactoryProvider.getFactory());
            int productId = productDAO.save(product);

            HttpSession session = request.getSession();
            if (productId != 0)
                session.setAttribute("message", pName + " saved successfully");
            else
                session.setAttribute("message", pName + " error saving category");
            response.sendRedirect("admin.jsp");

            return;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
