package com.ingrc.performa.config;

import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.http.MediaType;
import org.springframework.web.accept.ContentNegotiationManagerFactoryBean;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.view.ContentNegotiatingViewResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.ingrc.performa.component.LoggedUserInterceptor;
import com.ingrc.performa.service.WebUserService;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = { "com.ingrc.performa.web.controller" })
public class WebConfig extends WebMvcConfigurerAdapter {

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		 registry.addResourceHandler("/bootstrap/**/*", "/css/**/*", "/fonts/**/*",
		 "/img/**/*", "/js/**/*").addResourceLocations(
		 "/bootstrap/", "/css/", "/fonts/", "/img/", "/js/");
		
	}
	

	@Bean
    public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver multipart = new CommonsMultipartResolver();
		multipart.setMaxUploadSize(2566665);
		return multipart;
    }
	
	@Bean 
	@Scope(value = "session", proxyMode = ScopedProxyMode.TARGET_CLASS)
	public WebUserService webUserService(){
		return new WebUserService();
	};
	
	@Bean
	public LoggedUserInterceptor loggedUserInterceptor(){
		return new LoggedUserInterceptor();
	}
	

	@Override
	public void addInterceptors(InterceptorRegistry registry) {

		LocaleChangeInterceptor localeChangeInterceptor = new LocaleChangeInterceptor();
		localeChangeInterceptor.setParamName("lang");
		registry.addInterceptor(localeChangeInterceptor);
		
		
		registry.addInterceptor(loggedUserInterceptor());
	}
	
	
	
	@Bean
	public ViewResolver viewResolver() {
		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
		viewResolver.setOrder(2);
		viewResolver.setViewClass(JstlView.class);
		viewResolver.setPrefix("/WEB-INF/views/");
		viewResolver.setSuffix(".jsp");
		return viewResolver;
	}

	
	
	@Bean 
	public ContentNegotiationManagerFactoryBean contentNegotiationManager(){
		ContentNegotiationManagerFactoryBean cnm = new ContentNegotiationManagerFactoryBean();
		cnm.setIgnoreAcceptHeader(true);
		cnm.setDefaultContentType(MediaType.TEXT_PLAIN);
		Properties mediaTypes = new Properties();
		mediaTypes.put("json", MediaType.APPLICATION_JSON_VALUE);
		mediaTypes.put("text", MediaType.TEXT_PLAIN_VALUE);
		mediaTypes.put("image/jpeg", MediaType.IMAGE_JPEG_VALUE);
		mediaTypes.put("image/png", MediaType.IMAGE_PNG_VALUE);
		mediaTypes.put("image/gif", MediaType.IMAGE_GIF_VALUE);
		cnm.setMediaTypes(mediaTypes);
		return cnm;
	}
	
	@Bean
	public ContentNegotiatingViewResolver contentNegotiatingViewResolver(){
		ContentNegotiatingViewResolver cnv = new ContentNegotiatingViewResolver();
		cnv.setOrder(1);
		cnv.setContentNegotiationManager(contentNegotiationManager().getObject());
		
		List<View> views = new ArrayList<View>();
		views.add(new MappingJackson2JsonView());
		cnv.setDefaultViews(views);
		return cnv;
	}
	
	
}
