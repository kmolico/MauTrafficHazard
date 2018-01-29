package com.mau.hazard.service;

import java.util.List;

import com.mau.hazard.model.User;

public interface UserService {

	User findById(Integer id);

	List<User> findAll();

	void saveOrUpdate(User user);

	void delete(int id);

}
