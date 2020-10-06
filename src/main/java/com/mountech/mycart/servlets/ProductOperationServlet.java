package com.mountech.mycart.servlets;

import com.mountech.mycart.dao.CategoryDAO;
import com.mountech.mycart.dao.ProductDAO;
import com.mountech.mycart.entities.Category;
import com.mountech.mycart.entities.Product;
import com.mountech.mycart.helper.FactoryProvider;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import java.io.*;

@MultipartConfig
public class ProductOperationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String operation = request.getParameter("operation");

        if (operation.equals("addCategory")) {

            // Fetching category data
            String description = request.getParameter("catDisc");
            String title = request.getParameter("catTitle");

            // Creating category object
            Category category = new Category(title, description);

            // adding the category in database
            CategoryDAO categoryDAO = new CategoryDAO(FactoryProvider.getFactory());
            int catID = categoryDAO.saveCategory(category);

            // Displaying success message
            HttpSession session = request.getSession();
            if (catID != 0)
                session.setAttribute("message", title + " saved successfully");
            else
                session.setAttribute("message", title + " error saving category");
            response.sendRedirect("admin.jsp");

            return;

        } else if (operation.equals("addProduct")) {

            // Getting values from form
            String pName = request.getParameter("pName");
            double pPrice = Double.parseDouble((request.getParameter("pPrice")));
            double pDiscount = Double.parseDouble(request.getParameter("pDiscount"));
            int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
            String pDesc = request.getParameter("pDesc");
            int categoryId = Integer.parseInt(request.getParameter("catId"));
            Part pPhoto = request.getPart("pPhoto");

            // Extracting category
            CategoryDAO categoryDAO = new CategoryDAO(FactoryProvider.getFactory());
            Category category = categoryDAO.getCategory(categoryId);

            // Creating product
            Product product = new Product(pName, pDesc, pPhoto.getSubmittedFileName(), pDiscount, pPrice, pQuantity, category);

            // saving product
            ProductDAO productDAO = new ProductDAO(FactoryProvider.getFactory());
            int productId = productDAO.save(product);

            // Uploading picture
            try {

                String path = request.getRealPath("image") + File.separatorChar + "products" + File.separatorChar + pPhoto.getSubmittedFileName();
                System.out.println(path);
                FileOutputStream fos = new FileOutputStream(path);
                InputStream fis = pPhoto.getInputStream();

                // Reading data
                byte[] data = new byte[fis.available()];
                fis.read(data);  // This will place the file data in byte[] data

                // Writing the data
                fos.write(data);
                fos.close();
                fis.close();

            } catch (Exception e) {
                e.printStackTrace();
            }


            // Displaying success message
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
