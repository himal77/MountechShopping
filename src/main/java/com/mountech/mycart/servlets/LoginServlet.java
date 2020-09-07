package com.mountech.mycart.servlets;

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
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String userEmail = request.getParameter("user_email");
            String userPassword = request.getParameter("user_password");

            System.out.println( validateLogin(userEmail, userPassword));

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    public boolean validateLogin(String userEmail, String userPassword){
        String email = null, name = null;
        SessionFactory sessionFactory = FactoryProvider.getFactory();
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        List<User> userList = (List<User>) session.createQuery("FROM User").list();
        for(User u: userList){
            if(u.getUserEmail().equals(userEmail) && u.getUserPassword().equals(userPassword) && u.getUserType().equals("Normal")){
                return true;
            }
        }
        transaction.commit();
        session.close();
        return false;
    }
}
