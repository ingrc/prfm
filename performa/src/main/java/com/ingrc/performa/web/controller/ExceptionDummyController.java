package com.ingrc.performa.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ingrc.performa.web.controller.exception.ServiceUnavailableException;
import com.ingrc.performa.web.controller.exception.BadRequestException;
import com.ingrc.performa.web.controller.exception.ForbiddenException;
import com.ingrc.performa.web.controller.exception.InternalServerErrorException;
import com.ingrc.performa.web.controller.exception.NotFoundException;
import com.ingrc.performa.web.controller.exception.UnauthorizedException;

@Controller
@RequestMapping("/exceptions")
public class ExceptionDummyController {

	@RequestMapping(value = "/400.html")
	public void do400(){
		throw new BadRequestException();
	}
	
	@RequestMapping("/404.html")
	public void do404(){
		throw new NotFoundException();
	}
	
	@RequestMapping("/500.html")
	public void do500(){
		throw new InternalServerErrorException();
	}
	
	@RequestMapping("/401.html")
	public void do401(){
		throw new UnauthorizedException();
	}
	
	@RequestMapping("/403.html")
	public void do403(){
		throw new ForbiddenException();
	}
	
	@RequestMapping("/503.html")
	public void do503(){
		throw new ServiceUnavailableException();
	}
}
