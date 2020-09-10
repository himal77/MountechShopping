package com.mountech.mycart.servlets;

import com.mountech.mycart.entities.User;
import com.mountech.mycart.helper.FactoryProvider;
import org.hibernate.Session;
import org.hibernate.Transaction;

import javax.servlet.http.HttpSession;
import java.io.IOException;

public class RegisterServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        try {
            String userName = request.getParameter("user_name");
            String userEmail = request.getParameter("user_email");
            String userPassword = request.getParameter("user_password");
            String userPhone = request.getParameter("user_phone");
            String userAddress = request.getParameter("user_address");

            // if i want i can validate data here?

            User user = new User(userName, userEmail, userPassword, userPhone, userAddress, "default.jpg","normal");
            int userId = registerUser(user);
            HttpSession httpSession = request.getSession();
            httpSession.setAttribute("message", "Registration successful !! " + userId);
            response.sendRedirect("register.jsp");
            return;

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        try {

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int registerUser(User user) {
        Session session = FactoryProvider.getFactory().openSession();
        Transaction tx =  session.getTransaction();
        tx.begin();
        int userId = (int) session.save(user);
        tx.commit();
        session.close();
        return userId;
    }
}
