package com.ingrc.performa.component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.ingrc.performa.model.INGRCWebUserModel;
import com.ingrc.performa.service.WebUserService;

@Component("loggedUserInterceptor")
public class LoggedUserInterceptor extends HandlerInterceptorAdapter {
	
	private static final Logger logger=  Logger.getLogger(LoggedUserInterceptor.class);
	
	@Autowired 
	private WebUserService webUserService;
	

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		logger.debug("Logged User ["+request.getRemoteUser() +"] ["+webUserService+"]");
		if (request.getRemoteUser() != null){
			String username = request.getRemoteUser();
			INGRCWebUserModel userModel = webUserService.getByUname(username);
			request.setAttribute("loggedDisplayName", userModel.getDisplayname());				
		}
		super.afterCompletion(request, response, handler, ex);
	}

	
}
