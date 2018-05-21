package com.mau.hazard.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import com.mau.hazard.model.User;


@Repository
public class UserDaoImpl implements UserDao {

	NamedParameterJdbcTemplate namedParameterJdbcTemplate;

	@Autowired
	public void setNamedParameterJdbcTemplate(NamedParameterJdbcTemplate namedParameterJdbcTemplate) {
		this.namedParameterJdbcTemplate = namedParameterJdbcTemplate;
	}

	@Override
	public User findById(Integer id) {

		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);

		String sql = "SELECT * FROM users WHERE userid=:id";

		User result = null;
		try {
			result = namedParameterJdbcTemplate
                          .queryForObject(sql, params, new UserMapper());
		} catch (EmptyResultDataAccessException e) {
			// do nothing, return null
		}

		return result;

	}

	@Override
	public List<User> findAll() {

		String sql = "SELECT * FROM users where enabled = true";
		List<User> result = namedParameterJdbcTemplate.query(sql, new UserMapper());
		return result;

	}

	@Override
	public void save(User user) {

		KeyHolder keyHolder = new GeneratedKeyHolder();

		String sql = "INSERT INTO USERS(username, fname, lname, email, address, password, gender, license, enabled) "
				+ "VALUES ( :name, :fname, :lname, :email, :address, :password, :sex, :license, true)";

		namedParameterJdbcTemplate.update(sql, getSqlParameterByModel(user), keyHolder);
		user.setId(keyHolder.getKey().intValue());
		
		sql = "INSERT INTO USER_ROLES(roleuserid, username, role)"
				+ "VALUES(:userid, :username, :role)";
		
		MapSqlParameterSource paramSource = new MapSqlParameterSource();
		paramSource.addValue("userid", user.getId());
		paramSource.addValue("username", user.getName());
		paramSource.addValue("role", "ROLE_USER");
		namedParameterJdbcTemplate.update(sql, paramSource);

	}

	@Override
	public void update(User user) {

		String sql = "UPDATE USERS SET fname=:fname, lname=:lname, EMAIL=:email, ADDRESS=:address, "
			+ "PASSWORD=:password, "
			+ "gender=:sex, license=:license WHERE username=:name";
		namedParameterJdbcTemplate.update(sql, getSqlParameterByModel(user));

	}

	@Override
	public void delete(Integer id) {

		String sql = "Update USERS set enabled = false WHERE userid= :id";
		namedParameterJdbcTemplate.update(sql, new MapSqlParameterSource("id", id));

	}

	private SqlParameterSource getSqlParameterByModel(User user) {

		MapSqlParameterSource paramSource = new MapSqlParameterSource();
		paramSource.addValue("userid", user.getId());
		paramSource.addValue("name", user.getName());
		paramSource.addValue("lname", user.getLname());
		paramSource.addValue("fname", user.getFname());
		paramSource.addValue("email", user.getEmail());
		paramSource.addValue("address", user.getAddress());
		paramSource.addValue("password", user.getPassword());
		paramSource.addValue("sex", user.getSex());
		paramSource.addValue("license", user.getLicense());
		paramSource.addValue("enabled", user.getActive());

		return paramSource;
	}

	private static final class UserMapper implements RowMapper<User> {

		public User mapRow(ResultSet rs, int rowNum) throws SQLException {
			User user = new User();
			user.setId(rs.getInt("userid"));
			user.setName(rs.getString("username"));
			user.setLname(rs.getString("lname"));
			user.setFname(rs.getString("fname"));
			user.setEmail(rs.getString("email"));
			user.setAddress(rs.getString("address"));
			user.setPassword(rs.getString("password"));
			user.setSex(rs.getString("gender"));
			user.setLicense(rs.getString("license"));
			user.setActive(rs.getInt("enabled"));
			return user;
		}
	}
}
