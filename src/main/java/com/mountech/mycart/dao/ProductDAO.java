package com.mountech.mycart.dao;

import com.mountech.mycart.entities.Product;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.List;

public class ProductDAO {
    private SessionFactory factory = null;
    public ProductDAO(SessionFactory factory) {
        this.factory = factory;
    }

    public int save(Product product) {
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();
        int id = (int) session.save(product);
        tx.commit();
        session.close();
        return id;
    }

    public List<Product> getProductList() {
        Session session = factory.openSession();
        Query query = session.createQuery("from Product ");
        List<Product> productList = query.list();
        session.close();
        return productList;
    }
}
