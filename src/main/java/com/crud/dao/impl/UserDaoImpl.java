package com.crud.dao.impl;

import com.crud.dao.UserDao;
import com.crud.model.User;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserDaoImpl implements UserDao {

    private static final int USERS_PER_PAGE = 7;

    @Autowired
    private SessionFactory sessionFactory;

    public void saveUser(User user) {
        getSession().merge(user);
    }


    public void deleteUser(int id) {
        User user = getUserById(id);
        if (null != user) {
            getSession().delete(user);
        }
    }

    public User getUserById(int id) {
        return (User) getSession().get(User.class, id);
    }

    @SuppressWarnings("unchecked")
    public List<User> searchUsers(String name) {
        Criteria criteria = getSession().createCriteria(User.class);
        criteria.add(Restrictions.ilike("name", name + "%"));
        return criteria.list();


    }

    @SuppressWarnings("unchecked")
    public List<User> getAllUsers(int page) {
        Query query = getSession().createQuery("from User");
        query.setFirstResult(page * USERS_PER_PAGE);
        query.setMaxResults(USERS_PER_PAGE);
        return query.list();
    }

    public int getCountOfPages() {
        Query query = getSession().createQuery("from User");
        return (query.list().size() / USERS_PER_PAGE);
    }


    private Session getSession() {
        Session session = getSessionFactory().getCurrentSession();
        if (session == null) {
            session = getSessionFactory().openSession();
        }
        return session;
    }

    private SessionFactory getSessionFactory() {
        return sessionFactory;
    }


}
