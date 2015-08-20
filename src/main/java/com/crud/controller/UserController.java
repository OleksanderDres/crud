package com.crud.controller;

import com.crud.model.User;
import com.crud.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {

    private static int currentPage = 0;

    @Autowired
    @Qualifier("validator")
    private Validator validator;

    @Autowired
    private UserService userService;

    @RequestMapping(value = {"/", "/listUsers"})
    public String listUsers(@RequestParam(value = "page", required = false) int page, Map<String, Object> map) {
        currentPage = page;
        map.put("user", new User());
        map.put("userList", userService.getAllUsers(currentPage));
        map.put("countAllPages", userService.getCountOfPages());
        return "/user/listUsers";
    }

    @RequestMapping(value = {"/searchUsers"})
    public String searchUsers(@RequestParam("searchName") String searchName, Map<String, Object> map) {
        map.put("user", new User());
        map.put("searchList", userService.searchUsers(searchName));
        return "/user/searchUsers";
    }

    @RequestMapping("/get/{userId}")
    public String getUser(@PathVariable int userId, Map<String, Object> map) {
        User user = userService.getUserById(userId);
        map.put("user", user);
        return "/user/userForm";
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String saveUser(@ModelAttribute("user") @Valid User user, BindingResult result) {
        if (result.hasErrors()) {
            return "/user/userForm";
        }
        userService.saveUser(user);
        return "redirect:listUsers?page=" + currentPage;
    }

    @RequestMapping("/delete/{userId}")
    public String deleteUser(@PathVariable("userId") int id) {
        userService.deleteUser(id);
        return "redirect:/user/listUsers?page=" + currentPage;
    }

    @InitBinder
    private void initBinder(WebDataBinder binder) {
        binder.setValidator(validator);
    }

}
