package com.ingrc.performa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ingrc.performa.dao.IngrcAttachDao;
import com.ingrc.performa.model.INGRCAttchModel;
import com.ingrc.performa.web.dto.MitigationControlAttachmentDto;

@Service("mitigationControlAttachmentService")
public class MitigationControlAttachmentService {

	@Autowired
	private IngrcAttachDao ingrcAttachDao;
	
	public int save(INGRCAttchModel model){
		return ingrcAttachDao.save(model);
	}
	
	public int delete(Integer attachId){
		return ingrcAttachDao.delete(attachId);
	}
	
	public List<MitigationControlAttachmentDto> listControlAttch(String controlId){
		return ingrcAttachDao.listControlAttch(controlId);
	}
}
