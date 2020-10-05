package com.mountech.mycart.dao;

import com.mountech.mycart.entities.Category;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.List;

public class CategoryDAO {
    private SessionFactory factory;

    public CategoryDAO(SessionFactory factory) {
        this.factory = factory;
    }

    // Save category to database
    public int saveCategory(Category category) {
        try {
            Session session = factory.openSession();
            Transaction tx = session.beginTransaction();
            int catId = (int) session.save(category);
            session.close();
            return catId;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public Category getCategory(int categoryId ) {
        Session session = factory.openSession();
        Query query = session.createQuery("from Category WHERE categoryId = ?");
        query.setParameter(0,  categoryId);
        Category category = (Category) query.getParameter(0);
        return category;
    }

    public List<Category> getCategoryList() {
        Session session = factory.openSession();
        Query query = session.createQuery("from Category");
        List<Category> categoryList = query.list();
        session.close();
        return categoryList;
    }
}
