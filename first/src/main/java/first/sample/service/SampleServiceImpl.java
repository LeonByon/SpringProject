package first.sample.service;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import first.common.utils.FileUtils;
import first.sample.dao.SampleDAO;

//ServiceImpl 클래스는 Service 인터페이스를 통해 정의된 메서드를 실제로 구현하는 클래스이다.
@Service("sampleService")
public class SampleServiceImpl implements SampleService{
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="fileUtils")
	private FileUtils fileUtils;

	//컨트롤러에서 서비스 접근을 위한 선언
	//name을 통해 bean을 수동으로 등록.
	@Resource(name="sampleDAO")
	private SampleDAO sampleDAO;

	@Override
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception {
		return sampleDAO.selectBoardList(map);
	}

	@Override
	public void insertBoard(Map<String, Object> map, HttpServletRequest request) throws Exception {
		sampleDAO.insertBoard(map);

		//첨부파일은 Multipart 형식의 데이터이며 HttpServletRequest에 담겨서 서버로 전송된다.
		//HttpServletRequest 로는 Multipart 형식의 데이터를 조작하는데 어려움이 있으므로
		//MultipartHttpSevletRequest 형식으로 형 변환을 해줌.
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
		//Iterator 패턴을 이용하여 request에 전송된 모든 name을 이용하기 위한 장치.
		//Iterator는 어떤 데이터들의 집합체에서 컬렉션으로부터 정보를 얻어 올 수 있는 인터페이스.
		//Iterator를 이용하여 Map에 있는 데이터를 while문을 이용하여 순차적 접근
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		MultipartFile multipartFile = null;
		while(iterator.hasNext()){
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			if(multipartFile.isEmpty() == false){
	            log.debug("------------- file start -------------");
	            log.debug("name : "+multipartFile.getName());
	            log.debug("filename : "+multipartFile.getOriginalFilename());
	            log.debug("size : "+multipartFile.getSize());
	            log.debug("-------------- file end --------------\n");
			}
		}
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(map, request);
		for(int i=0 , size=list.size();i<size;i++){
			sampleDAO.insertFile(list.get(i));
		}
	}

	@Override
	public Map<String,Object> selectBoardDetail(Map<String,Object> map) throws Exception{
		sampleDAO.updateViews(map);
		Map<String,Object> resultMap = sampleDAO.selectBoardDetail(map);
		return resultMap;
	}

	@Override
	public void updateBoard(Map<String, Object> map) throws Exception {
		sampleDAO.updateBoard(map);
	}

	@Override
	public void deleteBoard(Map<String, Object> map) {
		sampleDAO.deleteBoard(map);
	}

}