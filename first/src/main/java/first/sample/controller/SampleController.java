package first.sample.controller;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import first.common.common.CommandMap;
import first.sample.service.SampleService;

//현재클래스가 컨트롤러 라는것을 알려준다.
//컨트롤로는 웹 클라이언트에서 들어온 요청을 해당 비지니스  로직을 호출하고, 수행결과와 함께
//응답을 해주는 Dispatcher 역할을 한다.
@Controller
public class SampleController {
	//사용할 Log4j를 선언
    Logger log = Logger.getLogger(this.getClass());

    //Service 영역의 접근을 위한 선언
    @Resource(name="sampleService")
    private SampleService sampleService;

    //DispatcherServlet은 이 어노테이션을 기준으로 어떤 컨트롤러의 메서드가 호출되어야 할지를 결정
    @RequestMapping(value="/sample/openBoardList.do")//실행될 주소
    public ModelAndView openSampleBoardList(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("/first/sample/boardList");
    	//우리가 화면에 보여줄 jsp파일을 의미한다.

        Map<String,Object> resultMap = sampleService.selectBoardList(commandMap.getMap());
        //서비스 로직의 결과를 ModelAndView 객체에 담어서 클라이언트, 즉 jsp에서 그 결과를 사용 할 수 있도록 한다.
        mv.addObject("paginationInfo", (PaginationInfo)resultMap.get("paginationInfo"));
        mv.addObject("list", resultMap.get("result"));
        return mv;
    }

    @RequestMapping(value="/sample/searchList.do")
    public ModelAndView openSearchList(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("/first/sample/boardList");

    	Map<String,Object> resultMap = sampleService.searchList(commandMap.getMap());

    	mv.addObject("paginationInfo", (PaginationInfo)resultMap.get("paginationInfo"));
    	mv.addObject("list",resultMap.get("result"));

    	return mv;
    }
    @RequestMapping(value="/sample/testMapArgumentResolver.do")
    public ModelAndView testMapArgumentResolver(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("");

    	if (commandMap.isEmpty() == false){
    		Iterator<Entry<String,Object>> iterator = commandMap.getMap().entrySet().iterator();
    		Entry<String,Object> entry = null;
    		while(iterator.hasNext()){
    			entry = iterator.next();
    			log.debug("key : " + entry.getKey() + ", value :" + entry.getValue());
    		}
    	}
    	return mv;
    }

    @RequestMapping(value="/sample/openBoardWrite.do")
    public ModelAndView openBoardWrite(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("/first/sample/boardWrite");
    	return mv;
    }

    @RequestMapping(value="/sample/insertBoard.do")
    public ModelAndView insertBoard(CommandMap commandMap, HttpServletRequest request) throws Exception{
    	ModelAndView mv = new ModelAndView("redirect:/sample/openBoardList.do");

    	sampleService.insertBoard(commandMap.getMap(), request);

    	mv.addObject("STAR",commandMap.get("STAR"));

    	return mv;
    }

    @RequestMapping(value="/sample/openBoardDetail.do")
    public ModelAndView openBoardDetail(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("/first/sample/boardDetail");

    	Map<String,Object> map = sampleService.selectBoardDetail(commandMap.getMap());
    	mv.addObject("map",map.get("map"));
    	mv.addObject("list", map.get("list"));
    	mv.addObject("relist", map.get("relist"));

    	return mv;
    }

    @RequestMapping(value="/sample/openBoardUpdate.do")
    public ModelAndView openBoardUpdate(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("/first/sample/boardUpdate");

    	Map<String,Object> map = sampleService.selectBoardDetail(commandMap.getMap());
    	mv.addObject("map", map.get("map"));
    	mv.addObject("list",map.get("list"));

    	return mv;
    }

    @RequestMapping(value="/sample/updateBoard.do")
    public ModelAndView updateBoard(CommandMap commandMap, HttpServletRequest request) throws Exception{
    	ModelAndView mv = new ModelAndView("redirect:/sample/openBoardDetail.do");

    	sampleService.updateBoard(commandMap.getMap(), request);

    	mv.addObject("IDX",commandMap.get("IDX"));
    	mv.addObject("STAR", commandMap.get("STAR"));

    	return mv;
    }

    @RequestMapping(value="/sample/deleteBoard.do")
    public ModelAndView deleteBoard(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("redirect:/sample/openBoardList.do");

    	sampleService.deleteBoard(commandMap.getMap());

    	return mv;
    }

    @RequestMapping(value="/sample/reInsert.do")
    public ModelAndView reInsert(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("redirect:/sample/openBoardDetail.do");

    	sampleService.reInsert(commandMap.getMap());

    	mv.addObject("IDX",commandMap.get("IDX"));

    	return mv;
    }

    @RequestMapping(value="/sample/deleteRelist.do")
    public ModelAndView deleteRelist(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("redirect:/sample/openBoardDetail.do");

    	sampleService.deleteRelist(commandMap.getMap());

    	mv.addObject("IDX",commandMap.get("IDX"));

    	return mv;
    }
}