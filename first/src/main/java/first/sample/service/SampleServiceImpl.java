package first.sample.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import first.sample.dao.SampleDAO;

//ServiceImpl 클래스는 Service 인터페이스를 통해 정의된 메서드를 실제로 구현하는 클래스이다.
@Service("sampleService")
public class SampleServiceImpl implements SampleService{
	Logger log = Logger.getLogger(this.getClass());

	//컨트롤러에서 서비스 접근을 위한 선언
	//name을 통해 bean을 수동으로 등록.
	@Resource(name="sampleDAO")
	private SampleDAO sampleDAO;

	@Override
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception {
		return sampleDAO.selectBoardList(map);
	}

	@Override
	public void insertBoard(Map<String, Object> map) throws Exception {
		sampleDAO.insertBoard(map);
	}

}