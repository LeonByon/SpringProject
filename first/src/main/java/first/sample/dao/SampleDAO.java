package first.sample.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import first.common.dao.AbstractDAO;

//이 클래스는 DAO임을 선언.
@Repository("sampleDAO")
public class SampleDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectBoardList(Map<String, Object> map) throws Exception {
		//selectList는 MyBatis의 기본 기능으로 리스트를 조회할 때 사용한다.
		//sample.selectBoardList 쿼리이름, 컨트롤러에서 넘어온 map이 쿼리 실행시 필요한 변수
		return (Map<String, Object>)selectPagingList("sample.selectBoardList", map);
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

	public void deleteFileList(Map<String,Object> map)throws Exception{
		update("sample.deleteFileList", map);
	}

	public void updateFile(Map<String, Object> map) throws Exception{
	    update("sample.updateFile", map);
	}

	public void reInsert(Map<String, Object> map) {
		insert("sample.reInsert",map);
	}

	public void reUpdate(Map<String, Object> map) {
		insert("sample.reUpdate",map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> reList(Map<String,Object> map){
		return (List<Map<String,Object>>)selectList("sample.reList",map);
	}

	public void deleteRelist(Map<String,Object> map){
		update("sample.deleteRelist",map);
	}
}
