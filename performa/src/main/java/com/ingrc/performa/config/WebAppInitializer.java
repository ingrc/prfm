package com.ingrc.performa.config;

import javax.servlet.Filter;

import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

import com.opensymphony.sitemesh.webapp.SiteMeshFilter;

public class WebAppInitializer extends
		AbstractAnnotationConfigDispatcherServletInitializer {
	

	@Override
	protected Class<?>[] getRootConfigClasses() {
		return new Class<?>[] { SecurityConfig.class, CoreConfig.class  };
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
//		return null;
		return new Class<?>[] {  WebConfig.class };
	}

	@Override
	protected String[] getServletMappings() {
		return new String[] {"/"};
	}

	@Override
	protected Filter[] getServletFilters() {

		CharacterEncodingFilter characterEncodingFilter = new CharacterEncodingFilter();
		characterEncodingFilter.setEncoding("UTF-8");

		SiteMeshFilter sitemeshFilter = new SiteMeshFilter();
		
		

		return new Filter[] { characterEncodingFilter, sitemeshFilter };
	}
	
	

}
