package com.mau.hazard.dao;

import java.util.List;

import com.mau.hazard.model.User;

public interface UserDao {

	User findById(Integer id);

	List<User> findAll();

	void save(User user);

	void update(User user);

	void delete(Integer id);

}