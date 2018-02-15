package com.mau.hazard.configuration;

import java.util.Locale;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

/**
 * @author Khemraj
 *
 */

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "com.mau.hazard")
public class HazardAppConfiguration extends WebMvcConfigurerAdapter{
	
	@Autowired
	DataSource dataSource;
	
    @Bean
    public ViewResolver viewResolver() {
        InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
        viewResolver.setViewClass(JstlView.class);
        viewResolver.setPrefix("/WEB-INF/views/");
        viewResolver.setSuffix(".jsp");
 
        return viewResolver;
    }
    
    @Bean(name = "datasource")
    public DriverManagerDataSource dataSource() {

        DriverManagerDataSource driverManagerDataSource = new DriverManagerDataSource();
        driverManagerDataSource.setDriverClassName("com.mysql.jdbc.Driver");
        driverManagerDataSource.setUrl("jdbc:mysql://localhost:3306/hazarddb");
        driverManagerDataSource.setUsername("hazard");
        driverManagerDataSource.setPassword("hazard");
        return driverManagerDataSource;

    }
    
    @Bean
	public NamedParameterJdbcTemplate getNamedParameterJdbcTemplate() {
		return new NamedParameterJdbcTemplate(dataSource);
	}
    
    @Bean
	public JdbcTemplate getJdbcTemplate() {
		return new JdbcTemplate(dataSource);
	}
    /*
     * Configure ResourceHandlers to serve static resources like CSS/ Javascript etc...
     */
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
        registry.addResourceHandler("/HAZARDS/**").addResourceLocations("file:///C:/HAZARDS/");
    }
 
    @Bean
	public ResourceBundleMessageSource messageSource() {
		ResourceBundleMessageSource rb = new ResourceBundleMessageSource();
		rb.setBasenames(new String[] { "messages/messages", "messages/validation" });
		return rb;
	}
    
    
    /**
     * In order for our application to be able to determine which locale is currently being used, we need to add a LocaleResolver bean
     * @return
     */
    @Bean
    public LocaleResolver localeResolver() {
        SessionLocaleResolver slr = new SessionLocaleResolver();
        slr.setDefaultLocale(Locale.ENGLISH);
        return slr;
    }
    
    /**
     * Next, we need to add an interceptor bean that will switch to a new locale based on the value of the lang parameter appended to a request
     * @return
     */
    @Bean
    public LocaleChangeInterceptor localeChangeInterceptor() {
        LocaleChangeInterceptor lci = new LocaleChangeInterceptor();
        lci.setParamName("lang");
        return lci;
    }
    
    /*In order to take effect, this bean needs to be added to the application’s interceptor registry.
    To achieve this, our @Configuration class has to extend the WebMvcConfigurerAdapter class and override the addInterceptors() method:*/
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(localeChangeInterceptor());
    }
}
