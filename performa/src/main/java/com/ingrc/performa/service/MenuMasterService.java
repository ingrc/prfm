package com.ingrc.performa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ingrc.performa.dao.MenuMasterDao;
import com.ingrc.performa.dao.MenuMasterLeftDao;
import com.ingrc.performa.model.MenuMasterLeftModel;
import com.ingrc.performa.model.MenuMasterModel;
import com.ingrc.performa.web.dto.ComboboxHelperDto;
import com.ingrc.performa.web.dto.MenuMasterDto;

@Service("menuMasterService")
public class MenuMasterService {

	@Autowired
	private MenuMasterDao menuMasterDao;
	@Autowired
	private MenuMasterLeftDao menuMasterLeftDao;
	
	public Integer addMenuMaster(MenuMasterModel menuMaster){
		return menuMasterDao.insert(menuMaster);
	}
	
	public Integer updateMenuMaster(MenuMasterModel model){
		return menuMasterDao.update(model);
	}
	
	public Integer deleteMenuMaster(Integer id){
		return menuMasterDao.delete(id);
	}
	
	public MenuMasterModel getMenuMasterModelById(String id){
		return menuMasterDao.getMenuMasterById(id);
	}
	
	public List<MenuMasterDto> listMenuMasterAll(){
		return menuMasterDao.listAll();
	}
	
	public String getListMenuMaster(){
		return menuMasterDao.getMenuAsStringXML();
	}
	
	public List<ComboboxHelperDto> getComboboxValueMenuMaster(){
		return menuMasterDao.getComboboxValueMenuMaster();
	}
	
	/*
	 * Menu Master Left Service
	 */
	public Integer addMenuMasterLeft(MenuMasterLeftModel model){
		return menuMasterLeftDao.insert(model);
	}
	
	public Integer updateMenuMasterLeft(MenuMasterLeftModel model){
		return menuMasterLeftDao.update(model);
	}
	
	public Integer deleteMenuMasterLeft(Integer id){
		return menuMasterLeftDao.delete(id);
	}
	
	public MenuMasterLeftModel getMenuMasterLeftById(Integer id){
		return menuMasterLeftDao.getMenuMasterLeftById(id);
	}
	
	public List<MenuMasterDto> listMenuMasterLeftAll(Integer menuMasterId){
		return menuMasterLeftDao.listAll(menuMasterId);
	}
	
	public String getListMenuMasterLeft(int masterKanalId){
		return menuMasterLeftDao.getMenuLeftAsStringXML(masterKanalId);
	}
	
	public List<ComboboxHelperDto> getComboboxValueMenuMasterLeft(Integer menuMasterId){
		return menuMasterLeftDao.getComboboxValueMaster(menuMasterId);
	}
}
