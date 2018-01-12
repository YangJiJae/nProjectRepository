package nfc.event.join.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface JoinService {

	void insertJoinGo(Map<String, Object> map, HttpServletRequest request) throws Exception;

	void insertcomJoinGo(Map<String, Object> map);

	Map<String, Object> selectIdCheck(Map<String, Object> map);

}
