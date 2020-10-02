package com.mountech.mycart.dao;

import com.mountech.mycart.entities.Category;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class CategoryDAO {
    private SessionFactory factory;

    public CategoryDAO(SessionFactory factory) {
        this.factory = factory;
    }

    // Save category to database
    public int saveCategory(Category category) {
        try {
            Session session = this.factory.openSession();
            Transaction tx = session.beginTransaction();
            int catId = (int) session.save(category);
            this.factory.close();
            return catId;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
}
