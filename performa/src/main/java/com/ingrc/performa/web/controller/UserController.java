package com.ingrc.performa.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ingrc.performa.service.DataReferenceService;
import com.ingrc.performa.service.TOwnService;
import com.ingrc.performa.service.TOwnTService;
import com.ingrc.performa.service.UserService;
import com.ingrc.performa.web.dto.UserDto;

@Controller
@RequestMapping("/user")
public class UserController extends BaseController {

	private static final Logger logger = Logger.getLogger(UserController.class);

	private static final String LIST_ORG_DROP_DOWN = "orgMenuList";
	private static final String LIST_UGRP_DROP_DOWN = "ugrpMenuList";
	private static final String LIST_TOWNANDQOWNT_CHECK_BOX = "towntModel";

	@Autowired
	private DataReferenceService dataReferenceService;

	@Autowired
	private UserService userService;

	@Autowired
	private TOwnTService towntService;

	@Autowired
	private TOwnService townService;

	@RequestMapping(value = "/form.html", method = RequestMethod.GET)
	public String doForm(Model model, HttpServletRequest request) {

		model.addAttribute(LIST_ORG_DROP_DOWN,
				dataReferenceService.getORGList());
		model.addAttribute(LIST_UGRP_DROP_DOWN,
				dataReferenceService.getUGrpList());
		
		UserDto userDto = new UserDto();

		if (request.getParameter("username") != null) {
			String userName = request.getParameter("username");
			userDto = userService.getByUserName(userName);
			model.addAttribute(LIST_TOWNANDQOWNT_CHECK_BOX,
					dataReferenceService.getTOwnAndTOwnTList(userName));

			model.addAttribute("formStat", "update");
		} else {
			model.addAttribute(LIST_TOWNANDQOWNT_CHECK_BOX,
					dataReferenceService.getTOwnAndTOwnTList(""));
			model.addAttribute("formStat", "addnew");
		}


		model.addAttribute("formModel", userDto);
		return USER_FOLDER + "/user-form";
	}

	@RequestMapping(value = "/form.html", method = RequestMethod.POST)
	public String doFormPost(HttpServletRequest request,
			@Validated @ModelAttribute("formModel") UserDto dto,
			BindingResult bindingResult, Model model) {

		if (bindingResult.hasErrors()) {
			logger.info("failed to save user");

			model.addAttribute(LIST_ORG_DROP_DOWN,
					dataReferenceService.getORGList());
			model.addAttribute(LIST_UGRP_DROP_DOWN,
					dataReferenceService.getUGrpList());
			//bindingResult.rejectValue("logindto.password","accesscontrol.form");
			
			//UserDto userDto = new UserDto();			
			if (request.getParameter("username") != null && !request.getParameter("formStat").equalsIgnoreCase("addnew")) {
				String userName = request.getParameter("username");
				//userDto = userService.getByUserName(userName);
				model.addAttribute(LIST_TOWNANDQOWNT_CHECK_BOX,
						dataReferenceService.getTOwnAndTOwnTList(userName));
				model.addAttribute("formStat", "update");
			} else {
				model.addAttribute(LIST_TOWNANDQOWNT_CHECK_BOX,
						dataReferenceService.getTOwnAndTOwnTList(""));
				model.addAttribute("formStat", "addnew");
			}

			model.addAttribute("formModel", dto);

			return USER_FOLDER + "/user-form";
		}

		logger.info("KIRIM="+dto);
		String formStat = request.getParameter("formStat");
		if (formStat.equalsIgnoreCase("update")) {
			userService.update(dto);
		} else {
			userService.save(dto);
		}

		return doList(model, request);
	}

	@RequestMapping(value = "/list.html")
	public String doList(Model model, HttpServletRequest request) {
		if (request.getParameter("username") != null
				&& request.getParameter("delete") != null) {
			String[] ids = request.getParameterValues("username");
			String deletedIds = "";
			String deleteFailedIds = "";
			for (String id : ids) {
				logger.info("deleting User with usernme [" + id + "]");
				int delresult = userService.delete(id);
				if (delresult == 1) {
					deletedIds += "," + id;
				} else if (delresult == -1) {
					deleteFailedIds += "," + id;
				}

			}
			if (deletedIds.isEmpty() == false) {
				model.addAttribute("deletedItem", deletedIds.substring(1));
			}
			if (deleteFailedIds.isEmpty() == false) {
				model.addAttribute("deleteFailedItem",
						deleteFailedIds.substring(1));
			}
		}

		List<UserDto> listUser = userService.list();
		logger.debug("userModelList [" + listUser.size() + "]");
		model.addAttribute("listModel", listUser);
		return USER_FOLDER + "/user-list";
	}
}
