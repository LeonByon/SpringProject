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

	public void insertBoard(Map<String, Object> map) throws Exception{
		insert("sample.insertBoard", map);
	}

	public void updateViews(Map<String, Object> map) throws Exception{
		update("sample.updateviews", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception{
		return (Map<String,Object>) selectOne("sample.selectBoardDetail",map);
	}

	public void updateBoard(Map<String, Object> map) {
		update("sample.updateBoard", map);
	}

	public void deleteBoard(Map<String, Object> map) {
		delete("sample.deleteBoard", map);
	}

	public void insertFile(Map<String, Object> map) throws Exception{
		insert("sample.insertFile", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFileList(Map<String, Object> map) throws Exception{
		return (List<Map<String,Object>>)selectList("sample.selectFileList",map);
	}

}
