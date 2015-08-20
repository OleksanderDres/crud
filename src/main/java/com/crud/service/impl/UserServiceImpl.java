package com.crud.service.impl;

import com.crud.dao.UserDao;
import com.crud.model.User;
import com.crud.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Transactional
    public void saveUser(User user) {
        userDao.saveUser(user);
    }

    @Transactional
    public void deleteUser(int id) {
        userDao.deleteUser(id);
    }

    @Transactional(readOnly = true)
    public User getUserById(int id) {
        return userDao.getUserById(id);
    }

    @Transactional(readOnly = true)
    public List<User> searchUsers(String name) {
        return userDao.searchUsers(name);
    }

    @Transactional(readOnly = true)
    public List<User> getAllUsers(int page) {
        return userDao.getAllUsers(page);
    }

    @Transactional
    public int getCountOfPages() {
        return userDao.getCountOfPages();
    }

}
