package com.mau.hazard.configuration;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

	@Autowired
	DataSource dataSource;
	
	@Autowired
	public void configureGlobalSecurity(AuthenticationManagerBuilder auth) throws Exception {
		auth.jdbcAuthentication().dataSource(dataSource)
		.usersByUsernameQuery("SELECT USERNAME, PASSWORD, ENABLED FROM USERS WHERE USERNAME = ?")
		.authoritiesByUsernameQuery("SELECT USERNAME, ROLE FROM USER_ROLES WHERE USERNAME = ?");
		
		/*auth.inMemoryAuthentication().withUser("user1").password("user1").roles("ADMIN"); // Line 1
	      auth.inMemoryAuthentication().withUser("user2").password("user2").roles("USER"); */
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
	  
	  http.authorizeRequests()
	  	.antMatchers("/", "/home", "/tutorial").permitAll()
	  	.antMatchers("/test/**").access("hasRole('ROLE_USER')")
	  	.antMatchers("/admin/**").access("hasRole('ROLE_ADMIN')")
	  	.antMatchers("/db/**").access("hasRole('ROLE_ADMIN') and hasRole('ROLE_DBA')")
	  	.and().formLogin().loginPage("/login")
	  	.usernameParameter("ssoId").passwordParameter("password")
	  	.and().csrf()
	  	.and().exceptionHandling().accessDeniedPage("/Access_Denied");
	}
}
