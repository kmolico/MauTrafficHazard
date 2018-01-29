package com.mau.hazard.configuration;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;
 
public class HazardAppInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {
 
    	@Override
    	protected Class<?>[] getRootConfigClasses() {
    		return new Class[] { HazardAppConfiguration.class };
    	}
     
    	@Override
    	protected Class<?>[] getServletConfigClasses() {
    		return null;
    	}
     
    	@Override
    	protected String[] getServletMappings() {
    		return new String[] { "/" };
    	}
}