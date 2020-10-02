package com.mountech.mycart.servlets;

import com.mountech.mycart.dao.CategoryDAO;
import com.mountech.mycart.entities.Category;
import com.mountech.mycart.helper.FactoryProvider;
import sun.misc.Cache;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

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
            if (catID == 1)
                session.setAttribute("message", title + " saved successfully");
            else
                session.setAttribute("message", title + " saved unsuccessful");
            response.sendRedirect("admin.jsp");
            return;
        } else if (operation.equals("addProduct")) {

            // TODO adding product
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
