package com.crud.service;

import com.crud.model.User;

import java.util.List;

public interface UserService {
    void saveUser(User user);

    void deleteUser(int id);

    User getUserById(int id);

    List<User> searchUsers(String name);

    List<User> getAllUsers(int page);

    int getCountOfPages();
}
