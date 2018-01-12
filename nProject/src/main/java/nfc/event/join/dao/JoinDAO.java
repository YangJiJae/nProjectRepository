package nfc.event.join.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import nfc.common.dao.AbstractDAO;


@Repository("joinDAO")
public class JoinDAO extends AbstractDAO {

	public void insertJoinGo(Map<String, Object> map) {
		insert("join.insertJoinGo", map);
	}

	public void insertComJoinGo(Map<String, Object> map) {
		insert("join.insertComJoinGo", map);		
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectCusId(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("join.selectCusId", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectComId(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("join.selectComId", map);
	}

}
