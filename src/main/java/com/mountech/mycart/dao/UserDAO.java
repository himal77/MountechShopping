package com.mountech.mycart.dao;

import com.mountech.mycart.entities.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.engine.spi.SessionDelegatorBaseImpl;
import org.hibernate.query.Query;
import org.hibernate.query.internal.QueryImpl;

import javax.transaction.Transactional;
import java.util.List;

public class UserDAO {
    private SessionFactory factory;

    public UserDAO(SessionFactory factory) {
        this.factory = factory;
    }

    // get user by email and password
    public User getUserByEmailAndPassword(String email, String password){
        User user = null;

        try {

            String query = "from User where userEmail =: e and userPassword=: p";
            Session session = this.factory.openSession();
            Query q = session.createQuery(query);
            q.setParameter("p", password);
            q.setParameter("e", email);
            user = (User) q.uniqueResult();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    public List<User> getUserList() {
        Session session = factory.openSession();
        Query query = session.createQuery("from User");
        List<User> userList = query.list();
        session.close();
        return userList;
    }
}
