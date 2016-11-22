package first.sample.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import first.common.dao.AbstractDAO;

//이 클래스는 DAO임을 선언.
@Repository("sampleDAO")
public class SampleDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception {
		//selectList는 MyBatis의 기본 기능으로 리스트를 조회할 때 사용한다.
		//sample.selectBoardList 쿼리이름, 컨트롤러에서 넘어온 map이 쿼리 실행시 필요한 변수
		return (List<Map<String, Object>>)selectList("sample.selectBoardList",map);
	}

}
