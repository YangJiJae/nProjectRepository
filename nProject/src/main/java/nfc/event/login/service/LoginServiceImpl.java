package nfc.event.login.service;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import nfc.event.login.dao.LoginDAO;

@Service("loginService")
public class LoginServiceImpl implements LoginService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="loginDAO")
	private LoginDAO loginDAO;

	@Override
	public Map<String, Object> selectIdInfo(Map<String, Object> map) {
		Map<String, Object> resultMap = null;
		if("user".equals(map.get("SEL"))){
			resultMap = loginDAO.selectCusIdInfo(map);
		}else if("com".equals(map.get("SEL"))){
			resultMap = loginDAO.selectComIdInfo(map);
		}
		
		return resultMap;
	}

}
