package com.mountech.mycart.servlets;

import com.mountech.mycart.dao.UserDAO;
import com.mountech.mycart.entities.User;
import com.mountech.mycart.helper.FactoryProvider;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String userEmail = request.getParameter("user_email");
            String userPassword = request.getParameter("user_password");
            validateLogin(userEmail, userPassword, request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    public void validateLogin(String userEmail, String userPassword, HttpServletRequest request, HttpServletResponse response) throws IOException {
        User user = new UserDAO(FactoryProvider.getFactory()).getUserByEmailAndPassword(userEmail, userPassword);
        HttpSession httpSession = request.getSession();
        if(user != null){
                httpSession.setAttribute("message", "Successfully Login");
                response.sendRedirect("login.jsp");
                return;
        }
        httpSession.setAttribute("message", "login failed");
        response.sendRedirect("login.jsp");
        return;
    }
}
