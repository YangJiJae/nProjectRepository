package nfc.event.main.service;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import nfc.event.main.dao.MainDAO;

@Service("mainService")
public class MainServiceImpl implements MainService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="mainDAO")
	private MainDAO mainDAO;

	

}
