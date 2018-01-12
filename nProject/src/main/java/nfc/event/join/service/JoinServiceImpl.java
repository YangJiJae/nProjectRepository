package nfc.event.join.service;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import nfc.event.join.dao.JoinDAO;

@Service("joinService")
public class JoinServiceImpl implements JoinService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="joinDAO")
	private JoinDAO joinDAO;

	@Override
	public void insertJoinGo(Map<String, Object> map, HttpServletRequest request) throws Exception {
		if(map.get("PHONE_NUM") == null || "".equals(map.get("PHONE_NUM"))){
			map.put("CUS_ID", map.get("EMAIL"));
		}else{
			map.put("CUS_ID", map.get("PHONE_NUM"));
		}
		joinDAO.insertJoinGo(map);
	}

	@Override
	public void insertcomJoinGo(Map<String, Object> map) {
		joinDAO.insertComJoinGo(map);
	}

	@Override
	public Map<String, Object> selectIdCheck(Map<String, Object> map) {
		Map<String, Object> resultMap = null;
		if("member".equals(map.get("SEL"))){
			resultMap = joinDAO.selectCusId(map);
		}else if("company".equals(map.get("SEL"))){
			resultMap = joinDAO.selectComId(map);
		}
		
		return resultMap;
	}

}
