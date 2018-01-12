package nfc.event.login.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import nfc.common.dao.AbstractDAO;


@Repository("loginDAO")
public class LoginDAO extends AbstractDAO {

	public Map<String, Object> selectCusIdInfo(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("login.selectCusIdInfo", map);
	}

	public Map<String, Object> selectComIdInfo(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("login.selectComIdInfo", map);
	}

}
